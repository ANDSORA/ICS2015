
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
c010002b:	e9 10 04 00 00       	jmp    c0100440 <init>

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
c0100066:	e8 b5 0b 00 00       	call   c0100c20 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 be 0b 00 00       	call   c0100c30 <get_ucr3>
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
c01000d7:	a1 40 a5 10 c0       	mov    0xc010a540,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 40 a5 10 c0       	mov    %eax,0xc010a540
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
c010014c:	e8 47 13 00 00       	call   c0101498 <memset>
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
c0100178:	c7 44 24 10 24 7d 10 	movl   $0xc0107d24,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 88 7d 10 	movl   $0xc0107d88,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 13 7d 10 	movl   $0xc0107d13,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 34 7d 10 c0 	movl   $0xc0107d34,(%esp)
c010019f:	e8 ac 0d 00 00       	call   c0100f50 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 2c 7d 10 	movl   $0xc0107d2c,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 88 7d 10 	movl   $0xc0107d88,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 13 7d 10 	movl   $0xc0107d13,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 34 7d 10 c0 	movl   $0xc0107d34,(%esp)
c01001ee:	e8 5d 0d 00 00       	call   c0100f50 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 24 7d 10 	movl   $0xc0107d24,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 88 7d 10 	movl   $0xc0107d88,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 13 7d 10 	movl   $0xc0107d13,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 34 7d 10 c0 	movl   $0xc0107d34,(%esp)
c010022e:	e8 1d 0d 00 00       	call   c0100f50 <printk>
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
c0100258:	c7 44 24 10 2c 7d 10 	movl   $0xc0107d2c,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 88 7d 10 	movl   $0xc0107d88,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 13 7d 10 	movl   $0xc0107d13,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 34 7d 10 c0 	movl   $0xc0107d34,(%esp)
c010027f:	e8 cc 0c 00 00       	call   c0100f50 <printk>
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
c01002a8:	c7 44 24 10 00 7d 10 	movl   $0xc0107d00,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 7e 7d 10 	movl   $0xc0107d7e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 13 7d 10 	movl   $0xc0107d13,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 34 7d 10 c0 	movl   $0xc0107d34,(%esp)
c01002cf:	e8 7c 0c 00 00       	call   c0100f50 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 40 a5 10 c0       	mov    0xc010a540,%eax
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
c010039a:	e8 61 02 00 00       	call   c0100600 <irq_handle>
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
c01003b7:	e8 a4 09 00 00       	call   c0100d60 <init_segment>
c01003bc:	e8 9f 03 00 00       	call   c0100760 <init_idt>
c01003c1:	e8 2a 03 00 00       	call   c01006f0 <init_i8259>
c01003c6:	e8 e5 0b 00 00       	call   c0100fb0 <init_serial>
c01003cb:	e8 a0 0d 00 00       	call   c0101170 <init_ide>
c01003d0:	fb                   	sti    
c01003d1:	e8 9a 08 00 00       	call   c0100c70 <init_mm>
c01003d6:	68 1f 7e 10 c0       	push   $0xc0107e1f
c01003db:	6a 4a                	push   $0x4a
c01003dd:	68 8e 7d 10 c0       	push   $0xc0107d8e
c01003e2:	68 a0 7d 10 c0       	push   $0xc0107da0
c01003e7:	e8 64 0b 00 00       	call   c0100f50 <printk>
c01003ec:	e8 9f 07 00 00       	call   c0100b90 <video_mapping_write_test>
c01003f1:	e8 1a 0a 00 00       	call   c0100e10 <loader>
c01003f6:	89 c3                	mov    %eax,%ebx
c01003f8:	e8 b3 07 00 00       	call   c0100bb0 <video_mapping_read_test>
c01003fd:	e8 fe 07 00 00       	call   c0100c00 <video_mapping_clear>
c0100402:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c0100407:	bd 00 00 00 00       	mov    $0x0,%ebp
c010040c:	83 ec 10             	sub    $0x10,%esp
c010040f:	ff d3                	call   *%ebx
c0100411:	68 1f 7e 10 c0       	push   $0xc0107e1f
c0100416:	6a 6b                	push   $0x6b
c0100418:	68 8e 7d 10 c0       	push   $0xc0107d8e
c010041d:	68 d4 7d 10 c0       	push   $0xc0107dd4
c0100422:	e8 29 0b 00 00       	call   c0100f50 <printk>
c0100427:	b8 01 00 00 00       	mov    $0x1,%eax
c010042c:	d6                   	(bad)  
c010042d:	83 c4 20             	add    $0x20,%esp
c0100430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100433:	c9                   	leave  
c0100434:	c3                   	ret    
c0100435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100440 <init>:
c0100440:	55                   	push   %ebp
c0100441:	89 e5                	mov    %esp,%ebp
c0100443:	83 ec 08             	sub    $0x8,%esp
c0100446:	e8 95 08 00 00       	call   c0100ce0 <init_page>
c010044b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100451:	b8 b0 03 10 c0       	mov    $0xc01003b0,%eax
c0100456:	ff e0                	jmp    *%eax
c0100458:	68 29 7e 10 c0       	push   $0xc0107e29
c010045d:	6a 24                	push   $0x24
c010045f:	68 8e 7d 10 c0       	push   $0xc0107d8e
c0100464:	68 d4 7d 10 c0       	push   $0xc0107dd4
c0100469:	e8 e2 0a 00 00       	call   c0100f50 <printk>
c010046e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100473:	d6                   	(bad)  
c0100474:	83 c4 10             	add    $0x10,%esp
c0100477:	c9                   	leave  
c0100478:	c3                   	ret    
c0100479:	66 90                	xchg   %ax,%ax
c010047b:	66 90                	xchg   %ax,%ax
c010047d:	66 90                	xchg   %ax,%ax
c010047f:	90                   	nop

c0100480 <do_syscall>:
c0100480:	55                   	push   %ebp
c0100481:	89 e5                	mov    %esp,%ebp
c0100483:	53                   	push   %ebx
c0100484:	83 ec 04             	sub    $0x4,%esp
c0100487:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010048a:	8b 43 1c             	mov    0x1c(%ebx),%eax
c010048d:	83 f8 04             	cmp    $0x4,%eax
c0100490:	74 6e                	je     c0100500 <do_syscall+0x80>
c0100492:	83 f8 2d             	cmp    $0x2d,%eax
c0100495:	74 49                	je     c01004e0 <do_syscall+0x60>
c0100497:	85 c0                	test   %eax,%eax
c0100499:	74 2d                	je     c01004c8 <do_syscall+0x48>
c010049b:	83 ec 0c             	sub    $0xc,%esp
c010049e:	50                   	push   %eax
c010049f:	68 c0 7e 10 c0       	push   $0xc0107ec0
c01004a4:	6a 26                	push   $0x26
c01004a6:	68 4c 7e 10 c0       	push   $0xc0107e4c
c01004ab:	68 6c 7e 10 c0       	push   $0xc0107e6c
c01004b0:	e8 9b 0a 00 00       	call   c0100f50 <printk>
c01004b5:	b8 01 00 00 00       	mov    $0x1,%eax
c01004ba:	d6                   	(bad)  
c01004bb:	83 c4 20             	add    $0x20,%esp
c01004be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004c1:	c9                   	leave  
c01004c2:	c3                   	ret    
c01004c3:	90                   	nop
c01004c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01004c8:	fa                   	cli    
c01004c9:	83 ec 08             	sub    $0x8,%esp
c01004cc:	ff 73 18             	pushl  0x18(%ebx)
c01004cf:	ff 73 10             	pushl  0x10(%ebx)
c01004d2:	e8 79 00 00 00       	call   c0100550 <add_irq_handle>
c01004d7:	fb                   	sti    
c01004d8:	83 c4 10             	add    $0x10,%esp
c01004db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004de:	c9                   	leave  
c01004df:	c3                   	ret    
c01004e0:	83 ec 0c             	sub    $0xc,%esp
c01004e3:	ff 73 10             	pushl  0x10(%ebx)
c01004e6:	e8 55 07 00 00       	call   c0100c40 <mm_brk>
c01004eb:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
c01004f2:	83 c4 10             	add    $0x10,%esp
c01004f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01004f8:	c9                   	leave  
c01004f9:	c3                   	ret    
c01004fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100500:	8b 43 10             	mov    0x10(%ebx),%eax
c0100503:	83 e8 01             	sub    $0x1,%eax
c0100506:	83 f8 01             	cmp    $0x1,%eax
c0100509:	76 27                	jbe    c0100532 <do_syscall+0xb2>
c010050b:	83 ec 0c             	sub    $0xc,%esp
c010050e:	68 2e 7e 10 c0       	push   $0xc0107e2e
c0100513:	68 c0 7e 10 c0       	push   $0xc0107ec0
c0100518:	6a 21                	push   $0x21
c010051a:	68 4c 7e 10 c0       	push   $0xc0107e4c
c010051f:	68 34 7d 10 c0       	push   $0xc0107d34
c0100524:	e8 27 0a 00 00       	call   c0100f50 <printk>
c0100529:	b8 01 00 00 00       	mov    $0x1,%eax
c010052e:	d6                   	(bad)  
c010052f:	83 c4 20             	add    $0x20,%esp
c0100532:	8b 53 14             	mov    0x14(%ebx),%edx
c0100535:	8b 4b 18             	mov    0x18(%ebx),%ecx
c0100538:	b8 02 00 00 00       	mov    $0x2,%eax
c010053d:	d6                   	(bad)  
c010053e:	89 53 1c             	mov    %edx,0x1c(%ebx)
c0100541:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100544:	c9                   	leave  
c0100545:	c3                   	ret    
c0100546:	66 90                	xchg   %ax,%ax
c0100548:	66 90                	xchg   %ax,%ax
c010054a:	66 90                	xchg   %ax,%ax
c010054c:	66 90                	xchg   %ax,%ax
c010054e:	66 90                	xchg   %ax,%ax

c0100550 <add_irq_handle>:
c0100550:	55                   	push   %ebp
c0100551:	89 e5                	mov    %esp,%ebp
c0100553:	53                   	push   %ebx
c0100554:	83 ec 04             	sub    $0x4,%esp
c0100557:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010055a:	83 fb 0f             	cmp    $0xf,%ebx
c010055d:	7f 71                	jg     c01005d0 <add_irq_handle+0x80>
c010055f:	a1 00 c0 12 c0       	mov    0xc012c000,%eax
c0100564:	83 f8 20             	cmp    $0x20,%eax
c0100567:	7e 2c                	jle    c0100595 <add_irq_handle+0x45>
c0100569:	83 ec 0c             	sub    $0xc,%esp
c010056c:	68 fa 7e 10 c0       	push   $0xc0107efa
c0100571:	68 e1 7f 10 c0       	push   $0xc0107fe1
c0100576:	6a 16                	push   $0x16
c0100578:	68 de 7e 10 c0       	push   $0xc0107ede
c010057d:	68 34 7d 10 c0       	push   $0xc0107d34
c0100582:	e8 c9 09 00 00       	call   c0100f50 <printk>
c0100587:	b8 01 00 00 00       	mov    $0x1,%eax
c010058c:	d6                   	(bad)  
c010058d:	a1 00 c0 12 c0       	mov    0xc012c000,%eax
c0100592:	83 c4 20             	add    $0x20,%esp
c0100595:	8d 50 01             	lea    0x1(%eax),%edx
c0100598:	89 15 00 c0 12 c0    	mov    %edx,0xc012c000
c010059e:	8b 55 0c             	mov    0xc(%ebp),%edx
c01005a1:	89 14 c5 80 c0 12 c0 	mov    %edx,-0x3fed3f80(,%eax,8)
c01005a8:	8b 14 9d 40 c0 12 c0 	mov    -0x3fed3fc0(,%ebx,4),%edx
c01005af:	89 14 c5 84 c0 12 c0 	mov    %edx,-0x3fed3f7c(,%eax,8)
c01005b6:	8d 04 c5 80 c0 12 c0 	lea    -0x3fed3f80(,%eax,8),%eax
c01005bd:	89 04 9d 40 c0 12 c0 	mov    %eax,-0x3fed3fc0(,%ebx,4)
c01005c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01005c7:	c9                   	leave  
c01005c8:	c3                   	ret    
c01005c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01005d0:	83 ec 0c             	sub    $0xc,%esp
c01005d3:	68 cb 7e 10 c0       	push   $0xc0107ecb
c01005d8:	68 e1 7f 10 c0       	push   $0xc0107fe1
c01005dd:	6a 15                	push   $0x15
c01005df:	68 de 7e 10 c0       	push   $0xc0107ede
c01005e4:	68 34 7d 10 c0       	push   $0xc0107d34
c01005e9:	e8 62 09 00 00       	call   c0100f50 <printk>
c01005ee:	b8 01 00 00 00       	mov    $0x1,%eax
c01005f3:	d6                   	(bad)  
c01005f4:	83 c4 20             	add    $0x20,%esp
c01005f7:	e9 63 ff ff ff       	jmp    c010055f <add_irq_handle+0xf>
c01005fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100600 <irq_handle>:
c0100600:	55                   	push   %ebp
c0100601:	89 e5                	mov    %esp,%ebp
c0100603:	53                   	push   %ebx
c0100604:	83 ec 04             	sub    $0x4,%esp
c0100607:	8b 55 08             	mov    0x8(%ebp),%edx
c010060a:	8b 42 20             	mov    0x20(%edx),%eax
c010060d:	85 c0                	test   %eax,%eax
c010060f:	0f 88 9b 00 00 00    	js     c01006b0 <irq_handle+0xb0>
c0100615:	3d 80 00 00 00       	cmp    $0x80,%eax
c010061a:	0f 84 b8 00 00 00    	je     c01006d8 <irq_handle+0xd8>
c0100620:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100625:	7e 59                	jle    c0100680 <irq_handle+0x80>
c0100627:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c010062d:	83 fb 0f             	cmp    $0xf,%ebx
c0100630:	7f 1e                	jg     c0100650 <irq_handle+0x50>
c0100632:	8b 1c 9d 40 c0 12 c0 	mov    -0x3fed3fc0(,%ebx,4),%ebx
c0100639:	85 db                	test   %ebx,%ebx
c010063b:	74 0c                	je     c0100649 <irq_handle+0x49>
c010063d:	8d 76 00             	lea    0x0(%esi),%esi
c0100640:	ff 13                	call   *(%ebx)
c0100642:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100645:	85 db                	test   %ebx,%ebx
c0100647:	75 f7                	jne    c0100640 <irq_handle+0x40>
c0100649:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010064c:	c9                   	leave  
c010064d:	c3                   	ret    
c010064e:	66 90                	xchg   %ax,%ax
c0100650:	83 ec 0c             	sub    $0xc,%esp
c0100653:	68 18 7f 10 c0       	push   $0xc0107f18
c0100658:	68 d6 7f 10 c0       	push   $0xc0107fd6
c010065d:	6a 30                	push   $0x30
c010065f:	68 de 7e 10 c0       	push   $0xc0107ede
c0100664:	68 34 7d 10 c0       	push   $0xc0107d34
c0100669:	e8 e2 08 00 00       	call   c0100f50 <printk>
c010066e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100673:	d6                   	(bad)  
c0100674:	83 c4 20             	add    $0x20,%esp
c0100677:	eb b9                	jmp    c0100632 <irq_handle+0x32>
c0100679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100680:	83 ec 08             	sub    $0x8,%esp
c0100683:	ff 72 28             	pushl  0x28(%edx)
c0100686:	50                   	push   %eax
c0100687:	68 d6 7f 10 c0       	push   $0xc0107fd6
c010068c:	6a 2d                	push   $0x2d
c010068e:	68 de 7e 10 c0       	push   $0xc0107ede
c0100693:	68 7c 7f 10 c0       	push   $0xc0107f7c
c0100698:	e8 b3 08 00 00       	call   c0100f50 <printk>
c010069d:	b8 01 00 00 00       	mov    $0x1,%eax
c01006a2:	d6                   	(bad)  
c01006a3:	83 c4 20             	add    $0x20,%esp
c01006a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006a9:	c9                   	leave  
c01006aa:	c3                   	ret    
c01006ab:	90                   	nop
c01006ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006b0:	68 d6 7f 10 c0       	push   $0xc0107fd6
c01006b5:	6a 29                	push   $0x29
c01006b7:	68 de 7e 10 c0       	push   $0xc0107ede
c01006bc:	68 30 7f 10 c0       	push   $0xc0107f30
c01006c1:	e8 8a 08 00 00       	call   c0100f50 <printk>
c01006c6:	b8 01 00 00 00       	mov    $0x1,%eax
c01006cb:	d6                   	(bad)  
c01006cc:	83 c4 10             	add    $0x10,%esp
c01006cf:	e9 75 ff ff ff       	jmp    c0100649 <irq_handle+0x49>
c01006d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01006d8:	89 55 08             	mov    %edx,0x8(%ebp)
c01006db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01006de:	c9                   	leave  
c01006df:	e9 9c fd ff ff       	jmp    c0100480 <do_syscall>
c01006e4:	66 90                	xchg   %ax,%ax
c01006e6:	66 90                	xchg   %ax,%ax
c01006e8:	66 90                	xchg   %ax,%ax
c01006ea:	66 90                	xchg   %ax,%ax
c01006ec:	66 90                	xchg   %ax,%ax
c01006ee:	66 90                	xchg   %ax,%ax

c01006f0 <init_i8259>:
c01006f0:	55                   	push   %ebp
c01006f1:	ba 21 00 00 00       	mov    $0x21,%edx
c01006f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01006fb:	89 e5                	mov    %esp,%ebp
c01006fd:	ee                   	out    %al,(%dx)
c01006fe:	b2 a1                	mov    $0xa1,%dl
c0100700:	ee                   	out    %al,(%dx)
c0100701:	b8 11 00 00 00       	mov    $0x11,%eax
c0100706:	b2 20                	mov    $0x20,%dl
c0100708:	ee                   	out    %al,(%dx)
c0100709:	b8 20 00 00 00       	mov    $0x20,%eax
c010070e:	b2 21                	mov    $0x21,%dl
c0100710:	ee                   	out    %al,(%dx)
c0100711:	b8 04 00 00 00       	mov    $0x4,%eax
c0100716:	ee                   	out    %al,(%dx)
c0100717:	b8 03 00 00 00       	mov    $0x3,%eax
c010071c:	ee                   	out    %al,(%dx)
c010071d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100722:	b2 a0                	mov    $0xa0,%dl
c0100724:	ee                   	out    %al,(%dx)
c0100725:	b8 28 00 00 00       	mov    $0x28,%eax
c010072a:	b2 a1                	mov    $0xa1,%dl
c010072c:	ee                   	out    %al,(%dx)
c010072d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100732:	ee                   	out    %al,(%dx)
c0100733:	b8 03 00 00 00       	mov    $0x3,%eax
c0100738:	ee                   	out    %al,(%dx)
c0100739:	b8 68 00 00 00       	mov    $0x68,%eax
c010073e:	b2 20                	mov    $0x20,%dl
c0100740:	ee                   	out    %al,(%dx)
c0100741:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100746:	ee                   	out    %al,(%dx)
c0100747:	b8 68 00 00 00       	mov    $0x68,%eax
c010074c:	b2 a0                	mov    $0xa0,%dl
c010074e:	ee                   	out    %al,(%dx)
c010074f:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100754:	ee                   	out    %al,(%dx)
c0100755:	5d                   	pop    %ebp
c0100756:	c3                   	ret    
c0100757:	66 90                	xchg   %ax,%ax
c0100759:	66 90                	xchg   %ax,%ax
c010075b:	66 90                	xchg   %ax,%ax
c010075d:	66 90                	xchg   %ax,%ax
c010075f:	90                   	nop

c0100760 <init_idt>:
c0100760:	55                   	push   %ebp
c0100761:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100766:	b8 c0 c1 12 c0       	mov    $0xc012c1c0,%eax
c010076b:	89 d1                	mov    %edx,%ecx
c010076d:	c1 ea 10             	shr    $0x10,%edx
c0100770:	89 e5                	mov    %esp,%ebp
c0100772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100778:	66 89 08             	mov    %cx,(%eax)
c010077b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100781:	83 c0 08             	add    $0x8,%eax
c0100784:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100788:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c010078c:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100790:	3d c0 c9 12 c0       	cmp    $0xc012c9c0,%eax
c0100795:	75 e1                	jne    c0100778 <init_idt+0x18>
c0100797:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c010079c:	ba 08 00 00 00       	mov    $0x8,%edx
c01007a1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007a6:	66 a3 c0 c1 12 c0    	mov    %ax,0xc012c1c0
c01007ac:	c1 e8 10             	shr    $0x10,%eax
c01007af:	66 89 15 c2 c1 12 c0 	mov    %dx,0xc012c1c2
c01007b6:	66 a3 c6 c1 12 c0    	mov    %ax,0xc012c1c6
c01007bc:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c01007c1:	ba 08 00 00 00       	mov    $0x8,%edx
c01007c6:	66 a3 c8 c1 12 c0    	mov    %ax,0xc012c1c8
c01007cc:	c1 e8 10             	shr    $0x10,%eax
c01007cf:	66 89 0d ca c1 12 c0 	mov    %cx,0xc012c1ca
c01007d6:	66 a3 ce c1 12 c0    	mov    %ax,0xc012c1ce
c01007dc:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c01007e1:	66 89 15 d2 c1 12 c0 	mov    %dx,0xc012c1d2
c01007e8:	66 a3 d0 c1 12 c0    	mov    %ax,0xc012c1d0
c01007ee:	c1 e8 10             	shr    $0x10,%eax
c01007f1:	b9 08 00 00 00       	mov    $0x8,%ecx
c01007f6:	66 a3 d6 c1 12 c0    	mov    %ax,0xc012c1d6
c01007fc:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c0100801:	ba 08 00 00 00       	mov    $0x8,%edx
c0100806:	66 a3 d8 c1 12 c0    	mov    %ax,0xc012c1d8
c010080c:	c1 e8 10             	shr    $0x10,%eax
c010080f:	66 89 0d da c1 12 c0 	mov    %cx,0xc012c1da
c0100816:	66 a3 de c1 12 c0    	mov    %ax,0xc012c1de
c010081c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100821:	66 89 15 e2 c1 12 c0 	mov    %dx,0xc012c1e2
c0100828:	66 a3 e0 c1 12 c0    	mov    %ax,0xc012c1e0
c010082e:	c1 e8 10             	shr    $0x10,%eax
c0100831:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100836:	66 a3 e6 c1 12 c0    	mov    %ax,0xc012c1e6
c010083c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100841:	ba 08 00 00 00       	mov    $0x8,%edx
c0100846:	66 a3 e8 c1 12 c0    	mov    %ax,0xc012c1e8
c010084c:	c1 e8 10             	shr    $0x10,%eax
c010084f:	66 89 0d ea c1 12 c0 	mov    %cx,0xc012c1ea
c0100856:	66 a3 ee c1 12 c0    	mov    %ax,0xc012c1ee
c010085c:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100861:	66 89 15 f2 c1 12 c0 	mov    %dx,0xc012c1f2
c0100868:	66 a3 f0 c1 12 c0    	mov    %ax,0xc012c1f0
c010086e:	c1 e8 10             	shr    $0x10,%eax
c0100871:	c6 05 c4 c1 12 c0 00 	movb   $0x0,0xc012c1c4
c0100878:	c6 05 c5 c1 12 c0 8f 	movb   $0x8f,0xc012c1c5
c010087f:	c6 05 cc c1 12 c0 00 	movb   $0x0,0xc012c1cc
c0100886:	b9 08 00 00 00       	mov    $0x8,%ecx
c010088b:	c6 05 cd c1 12 c0 8f 	movb   $0x8f,0xc012c1cd
c0100892:	c6 05 d4 c1 12 c0 00 	movb   $0x0,0xc012c1d4
c0100899:	ba 08 00 00 00       	mov    $0x8,%edx
c010089e:	c6 05 d5 c1 12 c0 8f 	movb   $0x8f,0xc012c1d5
c01008a5:	c6 05 dc c1 12 c0 00 	movb   $0x0,0xc012c1dc
c01008ac:	c6 05 dd c1 12 c0 8f 	movb   $0x8f,0xc012c1dd
c01008b3:	c6 05 e4 c1 12 c0 00 	movb   $0x0,0xc012c1e4
c01008ba:	c6 05 e5 c1 12 c0 8f 	movb   $0x8f,0xc012c1e5
c01008c1:	c6 05 ec c1 12 c0 00 	movb   $0x0,0xc012c1ec
c01008c8:	c6 05 ed c1 12 c0 8f 	movb   $0x8f,0xc012c1ed
c01008cf:	c6 05 f4 c1 12 c0 00 	movb   $0x0,0xc012c1f4
c01008d6:	c6 05 f5 c1 12 c0 8f 	movb   $0x8f,0xc012c1f5
c01008dd:	66 a3 f6 c1 12 c0    	mov    %ax,0xc012c1f6
c01008e3:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c01008e8:	66 a3 f8 c1 12 c0    	mov    %ax,0xc012c1f8
c01008ee:	c1 e8 10             	shr    $0x10,%eax
c01008f1:	66 89 0d fa c1 12 c0 	mov    %cx,0xc012c1fa
c01008f8:	66 a3 fe c1 12 c0    	mov    %ax,0xc012c1fe
c01008fe:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c0100903:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100908:	66 a3 00 c2 12 c0    	mov    %ax,0xc012c200
c010090e:	c1 e8 10             	shr    $0x10,%eax
c0100911:	66 89 15 02 c2 12 c0 	mov    %dx,0xc012c202
c0100918:	66 a3 06 c2 12 c0    	mov    %ax,0xc012c206
c010091e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0100923:	66 89 0d 0a c2 12 c0 	mov    %cx,0xc012c20a
c010092a:	66 a3 08 c2 12 c0    	mov    %ax,0xc012c208
c0100930:	c1 e8 10             	shr    $0x10,%eax
c0100933:	ba 08 00 00 00       	mov    $0x8,%edx
c0100938:	66 a3 0e c2 12 c0    	mov    %ax,0xc012c20e
c010093e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c0100943:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100948:	66 a3 10 c2 12 c0    	mov    %ax,0xc012c210
c010094e:	c1 e8 10             	shr    $0x10,%eax
c0100951:	66 89 15 12 c2 12 c0 	mov    %dx,0xc012c212
c0100958:	66 a3 16 c2 12 c0    	mov    %ax,0xc012c216
c010095e:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c0100963:	66 89 0d 1a c2 12 c0 	mov    %cx,0xc012c21a
c010096a:	66 a3 18 c2 12 c0    	mov    %ax,0xc012c218
c0100970:	c1 e8 10             	shr    $0x10,%eax
c0100973:	ba 08 00 00 00       	mov    $0x8,%edx
c0100978:	66 a3 1e c2 12 c0    	mov    %ax,0xc012c21e
c010097e:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c0100983:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100988:	66 a3 20 c2 12 c0    	mov    %ax,0xc012c220
c010098e:	c1 e8 10             	shr    $0x10,%eax
c0100991:	66 89 15 22 c2 12 c0 	mov    %dx,0xc012c222
c0100998:	66 a3 26 c2 12 c0    	mov    %ax,0xc012c226
c010099e:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c01009a3:	66 89 0d 2a c2 12 c0 	mov    %cx,0xc012c22a
c01009aa:	66 a3 28 c2 12 c0    	mov    %ax,0xc012c228
c01009b0:	c1 e8 10             	shr    $0x10,%eax
c01009b3:	c6 05 fc c1 12 c0 00 	movb   $0x0,0xc012c1fc
c01009ba:	c6 05 fd c1 12 c0 8f 	movb   $0x8f,0xc012c1fd
c01009c1:	c6 05 04 c2 12 c0 00 	movb   $0x0,0xc012c204
c01009c8:	ba 08 00 00 00       	mov    $0x8,%edx
c01009cd:	c6 05 05 c2 12 c0 8f 	movb   $0x8f,0xc012c205
c01009d4:	c6 05 0c c2 12 c0 00 	movb   $0x0,0xc012c20c
c01009db:	b9 08 00 00 00       	mov    $0x8,%ecx
c01009e0:	c6 05 0d c2 12 c0 8f 	movb   $0x8f,0xc012c20d
c01009e7:	c6 05 14 c2 12 c0 00 	movb   $0x0,0xc012c214
c01009ee:	c6 05 15 c2 12 c0 8f 	movb   $0x8f,0xc012c215
c01009f5:	c6 05 1c c2 12 c0 00 	movb   $0x0,0xc012c21c
c01009fc:	c6 05 1d c2 12 c0 8f 	movb   $0x8f,0xc012c21d
c0100a03:	c6 05 24 c2 12 c0 00 	movb   $0x0,0xc012c224
c0100a0a:	c6 05 25 c2 12 c0 8f 	movb   $0x8f,0xc012c225
c0100a11:	c6 05 2c c2 12 c0 00 	movb   $0x0,0xc012c22c
c0100a18:	66 a3 2e c2 12 c0    	mov    %ax,0xc012c22e
c0100a1e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0100a23:	66 89 15 32 c2 12 c0 	mov    %dx,0xc012c232
c0100a2a:	66 a3 30 c2 12 c0    	mov    %ax,0xc012c230
c0100a30:	c1 e8 10             	shr    $0x10,%eax
c0100a33:	66 89 0d c2 c5 12 c0 	mov    %cx,0xc012c5c2
c0100a3a:	66 a3 36 c2 12 c0    	mov    %ax,0xc012c236
c0100a40:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c0100a45:	ba 08 00 00 00       	mov    $0x8,%edx
c0100a4a:	66 a3 c0 c5 12 c0    	mov    %ax,0xc012c5c0
c0100a50:	c1 e8 10             	shr    $0x10,%eax
c0100a53:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100a58:	66 a3 c6 c5 12 c0    	mov    %ax,0xc012c5c6
c0100a5e:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c0100a63:	c6 05 2d c2 12 c0 8f 	movb   $0x8f,0xc012c22d
c0100a6a:	66 a3 c0 c2 12 c0    	mov    %ax,0xc012c2c0
c0100a70:	c1 e8 10             	shr    $0x10,%eax
c0100a73:	c6 05 34 c2 12 c0 00 	movb   $0x0,0xc012c234
c0100a7a:	66 a3 c6 c2 12 c0    	mov    %ax,0xc012c2c6
c0100a80:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0100a85:	c6 05 35 c2 12 c0 8f 	movb   $0x8f,0xc012c235
c0100a8c:	66 a3 30 c3 12 c0    	mov    %ax,0xc012c330
c0100a92:	c1 e8 10             	shr    $0x10,%eax
c0100a95:	c6 05 c4 c5 12 c0 00 	movb   $0x0,0xc012c5c4
c0100a9c:	66 a3 36 c3 12 c0    	mov    %ax,0xc012c336
c0100aa2:	b8 ff 07 00 00       	mov    $0x7ff,%eax
c0100aa7:	c6 05 c5 c5 12 c0 ef 	movb   $0xef,0xc012c5c5
c0100aae:	66 a3 80 c1 12 c0    	mov    %ax,0xc012c180
c0100ab4:	b8 c0 c1 12 c0       	mov    $0xc012c1c0,%eax
c0100ab9:	66 89 15 c2 c2 12 c0 	mov    %dx,0xc012c2c2
c0100ac0:	66 a3 82 c1 12 c0    	mov    %ax,0xc012c182
c0100ac6:	c1 e8 10             	shr    $0x10,%eax
c0100ac9:	c6 05 c4 c2 12 c0 00 	movb   $0x0,0xc012c2c4
c0100ad0:	66 a3 84 c1 12 c0    	mov    %ax,0xc012c184
c0100ad6:	c6 05 c5 c2 12 c0 8e 	movb   $0x8e,0xc012c2c5
c0100add:	b8 80 c1 12 c0       	mov    $0xc012c180,%eax
c0100ae2:	66 89 0d 32 c3 12 c0 	mov    %cx,0xc012c332
c0100ae9:	c6 05 34 c3 12 c0 00 	movb   $0x0,0xc012c334
c0100af0:	c6 05 35 c3 12 c0 8e 	movb   $0x8e,0xc012c335
c0100af7:	0f 01 18             	lidtl  (%eax)
c0100afa:	5d                   	pop    %ebp
c0100afb:	c3                   	ret    
c0100afc:	66 90                	xchg   %ax,%ax
c0100afe:	66 90                	xchg   %ax,%ax

c0100b00 <create_video_mapping>:
c0100b00:	55                   	push   %ebp
c0100b01:	89 e5                	mov    %esp,%ebp
c0100b03:	53                   	push   %ebx
c0100b04:	83 ec 04             	sub    $0x4,%esp
c0100b07:	e8 14 01 00 00       	call   c0100c20 <get_updir>
c0100b0c:	89 c3                	mov    %eax,%ebx
c0100b0e:	e8 0d 01 00 00       	call   c0100c20 <get_updir>
c0100b13:	39 c3                	cmp    %eax,%ebx
c0100b15:	74 27                	je     c0100b3e <create_video_mapping+0x3e>
c0100b17:	83 ec 0c             	sub    $0xc,%esp
c0100b1a:	68 f0 7f 10 c0       	push   $0xc0107ff0
c0100b1f:	68 53 80 10 c0       	push   $0xc0108053
c0100b24:	6a 19                	push   $0x19
c0100b26:	68 16 80 10 c0       	push   $0xc0108016
c0100b2b:	68 34 7d 10 c0       	push   $0xc0107d34
c0100b30:	e8 1b 04 00 00       	call   c0100f50 <printk>
c0100b35:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b3a:	d6                   	(bad)  
c0100b3b:	83 c4 20             	add    $0x20,%esp
c0100b3e:	ba 00 d0 12 00       	mov    $0x12d000,%edx
c0100b43:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c0100b48:	b8 80 d2 12 c0       	mov    $0xc012d280,%eax
c0100b4d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b53:	83 ca 07             	or     $0x7,%edx
c0100b56:	89 13                	mov    %edx,(%ebx)
c0100b58:	90                   	nop
c0100b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100b60:	89 ca                	mov    %ecx,%edx
c0100b62:	83 c0 04             	add    $0x4,%eax
c0100b65:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c0100b6b:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0100b71:	83 ca 07             	or     $0x7,%edx
c0100b74:	89 50 fc             	mov    %edx,-0x4(%eax)
c0100b77:	3d c0 d2 12 c0       	cmp    $0xc012d2c0,%eax
c0100b7c:	75 e2                	jne    c0100b60 <create_video_mapping+0x60>
c0100b7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b81:	c9                   	leave  
c0100b82:	c3                   	ret    
c0100b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100b90 <video_mapping_write_test>:
c0100b90:	55                   	push   %ebp
c0100b91:	31 c0                	xor    %eax,%eax
c0100b93:	89 e5                	mov    %esp,%ebp
c0100b95:	8d 76 00             	lea    0x0(%esi),%esi
c0100b98:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c0100b9f:	83 c0 01             	add    $0x1,%eax
c0100ba2:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0100ba7:	75 ef                	jne    c0100b98 <video_mapping_write_test+0x8>
c0100ba9:	5d                   	pop    %ebp
c0100baa:	c3                   	ret    
c0100bab:	90                   	nop
c0100bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100bb0 <video_mapping_read_test>:
c0100bb0:	55                   	push   %ebp
c0100bb1:	89 e5                	mov    %esp,%ebp
c0100bb3:	56                   	push   %esi
c0100bb4:	be 01 00 00 00       	mov    $0x1,%esi
c0100bb9:	53                   	push   %ebx
c0100bba:	31 db                	xor    %ebx,%ebx
c0100bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100bc0:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0100bc7:	74 24                	je     c0100bed <video_mapping_read_test+0x3d>
c0100bc9:	83 ec 0c             	sub    $0xc,%esp
c0100bcc:	68 2f 80 10 c0       	push   $0xc010802f
c0100bd1:	68 3b 80 10 c0       	push   $0xc010803b
c0100bd6:	6a 30                	push   $0x30
c0100bd8:	68 16 80 10 c0       	push   $0xc0108016
c0100bdd:	68 34 7d 10 c0       	push   $0xc0107d34
c0100be2:	e8 69 03 00 00       	call   c0100f50 <printk>
c0100be7:	89 f0                	mov    %esi,%eax
c0100be9:	d6                   	(bad)  
c0100bea:	83 c4 20             	add    $0x20,%esp
c0100bed:	83 c3 01             	add    $0x1,%ebx
c0100bf0:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0100bf6:	75 c8                	jne    c0100bc0 <video_mapping_read_test+0x10>
c0100bf8:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100bfb:	5b                   	pop    %ebx
c0100bfc:	5e                   	pop    %esi
c0100bfd:	5d                   	pop    %ebp
c0100bfe:	c3                   	ret    
c0100bff:	90                   	nop

c0100c00 <video_mapping_clear>:
c0100c00:	55                   	push   %ebp
c0100c01:	89 e5                	mov    %esp,%ebp
c0100c03:	83 ec 0c             	sub    $0xc,%esp
c0100c06:	68 00 fa 00 00       	push   $0xfa00
c0100c0b:	6a 00                	push   $0x0
c0100c0d:	68 00 00 0a 00       	push   $0xa0000
c0100c12:	e8 81 08 00 00       	call   c0101498 <memset>
c0100c17:	83 c4 10             	add    $0x10,%esp
c0100c1a:	c9                   	leave  
c0100c1b:	c3                   	ret    
c0100c1c:	66 90                	xchg   %ax,%ax
c0100c1e:	66 90                	xchg   %ax,%ax

c0100c20 <get_updir>:
c0100c20:	55                   	push   %ebp
c0100c21:	b8 00 f0 12 c0       	mov    $0xc012f000,%eax
c0100c26:	89 e5                	mov    %esp,%ebp
c0100c28:	5d                   	pop    %ebp
c0100c29:	c3                   	ret    
c0100c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c30 <get_ucr3>:
c0100c30:	55                   	push   %ebp
c0100c31:	a1 04 e0 12 c0       	mov    0xc012e004,%eax
c0100c36:	89 e5                	mov    %esp,%ebp
c0100c38:	5d                   	pop    %ebp
c0100c39:	c3                   	ret    
c0100c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100c40 <mm_brk>:
c0100c40:	55                   	push   %ebp
c0100c41:	89 e5                	mov    %esp,%ebp
c0100c43:	53                   	push   %ebx
c0100c44:	83 ec 04             	sub    $0x4,%esp
c0100c47:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100c4a:	a1 00 e0 12 c0       	mov    0xc012e000,%eax
c0100c4f:	39 d8                	cmp    %ebx,%eax
c0100c51:	73 11                	jae    c0100c64 <mm_brk+0x24>
c0100c53:	89 da                	mov    %ebx,%edx
c0100c55:	83 ec 08             	sub    $0x8,%esp
c0100c58:	29 c2                	sub    %eax,%edx
c0100c5a:	52                   	push   %edx
c0100c5b:	50                   	push   %eax
c0100c5c:	e8 ef f3 ff ff       	call   c0100050 <mm_malloc>
c0100c61:	83 c4 10             	add    $0x10,%esp
c0100c64:	89 1d 00 e0 12 c0    	mov    %ebx,0xc012e000
c0100c6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c6d:	c9                   	leave  
c0100c6e:	c3                   	ret    
c0100c6f:	90                   	nop

c0100c70 <init_mm>:
c0100c70:	55                   	push   %ebp
c0100c71:	89 e5                	mov    %esp,%ebp
c0100c73:	53                   	push   %ebx
c0100c74:	83 ec 04             	sub    $0x4,%esp
c0100c77:	e8 54 00 00 00       	call   c0100cd0 <get_kpdir>
c0100c7c:	83 ec 04             	sub    $0x4,%esp
c0100c7f:	89 c3                	mov    %eax,%ebx
c0100c81:	68 00 10 00 00       	push   $0x1000
c0100c86:	6a 00                	push   $0x0
c0100c88:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c0100c8e:	68 00 f0 12 c0       	push   $0xc012f000
c0100c93:	e8 00 08 00 00       	call   c0101498 <memset>
c0100c98:	83 c4 0c             	add    $0xc,%esp
c0100c9b:	68 80 00 00 00       	push   $0x80
c0100ca0:	53                   	push   %ebx
c0100ca1:	68 00 fc 12 c0       	push   $0xc012fc00
c0100ca6:	e8 a5 07 00 00       	call   c0101450 <memcpy>
c0100cab:	b8 00 f0 12 00       	mov    $0x12f000,%eax
c0100cb0:	83 c4 10             	add    $0x10,%esp
c0100cb3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100cb6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100cbb:	a3 04 e0 12 c0       	mov    %eax,0xc012e004
c0100cc0:	c9                   	leave  
c0100cc1:	c3                   	ret    
c0100cc2:	66 90                	xchg   %ax,%ax
c0100cc4:	66 90                	xchg   %ax,%ax
c0100cc6:	66 90                	xchg   %ax,%ax
c0100cc8:	66 90                	xchg   %ax,%ax
c0100cca:	66 90                	xchg   %ax,%ax
c0100ccc:	66 90                	xchg   %ax,%ax
c0100cce:	66 90                	xchg   %ax,%ax

c0100cd0 <get_kpdir>:
c0100cd0:	55                   	push   %ebp
c0100cd1:	b8 00 10 15 c0       	mov    $0xc0151000,%eax
c0100cd6:	89 e5                	mov    %esp,%ebp
c0100cd8:	5d                   	pop    %ebp
c0100cd9:	c3                   	ret    
c0100cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100ce0 <init_page>:
c0100ce0:	55                   	push   %ebp
c0100ce1:	89 e5                	mov    %esp,%ebp
c0100ce3:	57                   	push   %edi
c0100ce4:	83 ec 08             	sub    $0x8,%esp
c0100ce7:	68 00 10 00 00       	push   $0x1000
c0100cec:	6a 00                	push   $0x0
c0100cee:	68 00 10 15 00       	push   $0x151000
c0100cf3:	e8 a0 07 00 00       	call   c0101498 <memset>
c0100cf8:	b9 00 10 15 00       	mov    $0x151000,%ecx
c0100cfd:	83 c4 10             	add    $0x10,%esp
c0100d00:	ba 00 10 13 00       	mov    $0x131000,%edx
c0100d05:	8d 76 00             	lea    0x0(%esi),%esi
c0100d08:	89 d0                	mov    %edx,%eax
c0100d0a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c0100d10:	83 c1 04             	add    $0x4,%ecx
c0100d13:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d18:	83 c8 07             	or     $0x7,%eax
c0100d1b:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0100d1e:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c0100d24:	81 fa 00 10 15 00    	cmp    $0x151000,%edx
c0100d2a:	75 dc                	jne    c0100d08 <init_page+0x28>
c0100d2c:	bf fc 0f 15 00       	mov    $0x150ffc,%edi
c0100d31:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c0100d36:	fd                   	std    
c0100d37:	ab                   	stos   %eax,%es:(%edi)
c0100d38:	2d 00 10 00 00       	sub    $0x1000,%eax
c0100d3d:	7d f8                	jge    c0100d37 <init_page+0x57>
c0100d3f:	b8 00 10 15 00       	mov    $0x151000,%eax
c0100d44:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100d49:	0f 22 d8             	mov    %eax,%cr3
c0100d4c:	0f 20 c0             	mov    %cr0,%eax
c0100d4f:	0d 00 00 00 80       	or     $0x80000000,%eax
c0100d54:	0f 22 c0             	mov    %eax,%cr0
c0100d57:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0100d5a:	c9                   	leave  
c0100d5b:	c3                   	ret    
c0100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d60 <init_segment>:
c0100d60:	55                   	push   %ebp
c0100d61:	89 e5                	mov    %esp,%ebp
c0100d63:	83 ec 0c             	sub    $0xc,%esp
c0100d66:	6a 18                	push   $0x18
c0100d68:	6a 00                	push   $0x0
c0100d6a:	68 08 00 13 c0       	push   $0xc0130008
c0100d6f:	e8 24 07 00 00       	call   c0101498 <memset>
c0100d74:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d79:	31 c9                	xor    %ecx,%ecx
c0100d7b:	b8 08 00 13 c0       	mov    $0xc0130008,%eax
c0100d80:	66 89 15 10 00 13 c0 	mov    %dx,0xc0130010
c0100d87:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0100d8c:	66 89 0d 12 00 13 c0 	mov    %cx,0xc0130012
c0100d93:	66 89 15 18 00 13 c0 	mov    %dx,0xc0130018
c0100d9a:	ba 17 00 00 00       	mov    $0x17,%edx
c0100d9f:	31 c9                	xor    %ecx,%ecx
c0100da1:	66 89 15 00 00 13 c0 	mov    %dx,0xc0130000
c0100da8:	66 a3 02 00 13 c0    	mov    %ax,0xc0130002
c0100dae:	c1 e8 10             	shr    $0x10,%eax
c0100db1:	66 a3 04 00 13 c0    	mov    %ax,0xc0130004
c0100db7:	c6 05 14 00 13 c0 00 	movb   $0x0,0xc0130014
c0100dbe:	b8 00 00 13 c0       	mov    $0xc0130000,%eax
c0100dc3:	c6 05 15 00 13 c0 9a 	movb   $0x9a,0xc0130015
c0100dca:	c6 05 16 00 13 c0 cf 	movb   $0xcf,0xc0130016
c0100dd1:	c6 05 17 00 13 c0 00 	movb   $0x0,0xc0130017
c0100dd8:	66 89 0d 1a 00 13 c0 	mov    %cx,0xc013001a
c0100ddf:	c6 05 1c 00 13 c0 00 	movb   $0x0,0xc013001c
c0100de6:	c6 05 1d 00 13 c0 92 	movb   $0x92,0xc013001d
c0100ded:	c6 05 1e 00 13 c0 cf 	movb   $0xcf,0xc013001e
c0100df4:	c6 05 1f 00 13 c0 00 	movb   $0x0,0xc013001f
c0100dfb:	0f 01 10             	lgdtl  (%eax)
c0100dfe:	83 c4 10             	add    $0x10,%esp
c0100e01:	c9                   	leave  
c0100e02:	c3                   	ret    
c0100e03:	66 90                	xchg   %ax,%ax
c0100e05:	66 90                	xchg   %ax,%ax
c0100e07:	66 90                	xchg   %ax,%ax
c0100e09:	66 90                	xchg   %ax,%ax
c0100e0b:	66 90                	xchg   %ax,%ax
c0100e0d:	66 90                	xchg   %ax,%ax
c0100e0f:	90                   	nop

c0100e10 <loader>:
c0100e10:	55                   	push   %ebp
c0100e11:	89 e5                	mov    %esp,%ebp
c0100e13:	57                   	push   %edi
c0100e14:	56                   	push   %esi
c0100e15:	53                   	push   %ebx
c0100e16:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c0100e1c:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c0100e22:	68 00 10 00 00       	push   $0x1000
c0100e27:	6a 00                	push   $0x0
c0100e29:	53                   	push   %ebx
c0100e2a:	e8 81 02 00 00       	call   c01010b0 <ide_read>
c0100e2f:	83 c4 10             	add    $0x10,%esp
c0100e32:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c0100e39:	45 4c 46 
c0100e3c:	74 06                	je     c0100e44 <loader+0x34>
c0100e3e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e43:	d6                   	(bad)  
c0100e44:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c0100e4a:	83 fa 34             	cmp    $0x34,%edx
c0100e4d:	74 06                	je     c0100e55 <loader+0x45>
c0100e4f:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e54:	d6                   	(bad)  
c0100e55:	31 f6                	xor    %esi,%esi
c0100e57:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c0100e5e:	00 
c0100e5f:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c0100e63:	75 1c                	jne    c0100e81 <loader+0x71>
c0100e65:	eb 71                	jmp    c0100ed8 <loader+0xc8>
c0100e67:	89 f6                	mov    %esi,%esi
c0100e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100e70:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0100e77:	83 c6 01             	add    $0x1,%esi
c0100e7a:	83 c3 20             	add    $0x20,%ebx
c0100e7d:	39 f0                	cmp    %esi,%eax
c0100e7f:	7e 57                	jle    c0100ed8 <loader+0xc8>
c0100e81:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0100e85:	75 e9                	jne    c0100e70 <loader+0x60>
c0100e87:	83 ec 08             	sub    $0x8,%esp
c0100e8a:	ff 33                	pushl  (%ebx)
c0100e8c:	ff 73 f4             	pushl  -0xc(%ebx)
c0100e8f:	e8 bc f1 ff ff       	call   c0100050 <mm_malloc>
c0100e94:	83 c4 0c             	add    $0xc,%esp
c0100e97:	ff 73 fc             	pushl  -0x4(%ebx)
c0100e9a:	ff 73 f0             	pushl  -0x10(%ebx)
c0100e9d:	50                   	push   %eax
c0100e9e:	89 c7                	mov    %eax,%edi
c0100ea0:	e8 0b 02 00 00       	call   c01010b0 <ide_read>
c0100ea5:	8b 53 fc             	mov    -0x4(%ebx),%edx
c0100ea8:	8b 0b                	mov    (%ebx),%ecx
c0100eaa:	83 c4 0c             	add    $0xc,%esp
c0100ead:	29 d1                	sub    %edx,%ecx
c0100eaf:	01 fa                	add    %edi,%edx
c0100eb1:	51                   	push   %ecx
c0100eb2:	6a 00                	push   $0x0
c0100eb4:	52                   	push   %edx
c0100eb5:	e8 de 05 00 00       	call   c0101498 <memset>
c0100eba:	8b 03                	mov    (%ebx),%eax
c0100ebc:	03 43 f4             	add    -0xc(%ebx),%eax
c0100ebf:	83 c4 10             	add    $0x10,%esp
c0100ec2:	83 e8 01             	sub    $0x1,%eax
c0100ec5:	3b 05 00 e0 12 c0    	cmp    0xc012e000,%eax
c0100ecb:	76 a3                	jbe    c0100e70 <loader+0x60>
c0100ecd:	a3 00 e0 12 c0       	mov    %eax,0xc012e000
c0100ed2:	eb 9c                	jmp    c0100e70 <loader+0x60>
c0100ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100ed8:	83 ec 08             	sub    $0x8,%esp
c0100edb:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0100ee1:	68 00 00 10 00       	push   $0x100000
c0100ee6:	68 00 00 f0 bf       	push   $0xbff00000
c0100eeb:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0100ef1:	e8 5a f1 ff ff       	call   c0100050 <mm_malloc>
c0100ef6:	e8 05 fc ff ff       	call   c0100b00 <create_video_mapping>
c0100efb:	e8 30 fd ff ff       	call   c0100c30 <get_ucr3>
c0100f00:	0f 22 d8             	mov    %eax,%cr3
c0100f03:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0100f09:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100f0c:	5b                   	pop    %ebx
c0100f0d:	5e                   	pop    %esi
c0100f0e:	5f                   	pop    %edi
c0100f0f:	5d                   	pop    %ebp
c0100f10:	c3                   	ret    
c0100f11:	66 90                	xchg   %ax,%ax
c0100f13:	66 90                	xchg   %ax,%ax
c0100f15:	66 90                	xchg   %ax,%ax
c0100f17:	66 90                	xchg   %ax,%ax
c0100f19:	66 90                	xchg   %ax,%ax
c0100f1b:	66 90                	xchg   %ax,%ax
c0100f1d:	66 90                	xchg   %ax,%ax
c0100f1f:	90                   	nop

c0100f20 <sbrk>:
c0100f20:	55                   	push   %ebp
c0100f21:	89 e5                	mov    %esp,%ebp
c0100f23:	83 ec 08             	sub    $0x8,%esp
c0100f26:	68 7e 80 10 c0       	push   $0xc010807e
c0100f2b:	6a 08                	push   $0x8
c0100f2d:	68 68 80 10 c0       	push   $0xc0108068
c0100f32:	68 d4 7d 10 c0       	push   $0xc0107dd4
c0100f37:	e8 14 00 00 00       	call   c0100f50 <printk>
c0100f3c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100f41:	d6                   	(bad)  
c0100f42:	30 c0                	xor    %al,%al
c0100f44:	c9                   	leave  
c0100f45:	c3                   	ret    
c0100f46:	66 90                	xchg   %ax,%ax
c0100f48:	66 90                	xchg   %ax,%ax
c0100f4a:	66 90                	xchg   %ax,%ax
c0100f4c:	66 90                	xchg   %ax,%ax
c0100f4e:	66 90                	xchg   %ax,%ax

c0100f50 <printk>:
c0100f50:	55                   	push   %ebp
c0100f51:	89 e5                	mov    %esp,%ebp
c0100f53:	56                   	push   %esi
c0100f54:	53                   	push   %ebx
c0100f55:	8d 45 0c             	lea    0xc(%ebp),%eax
c0100f58:	50                   	push   %eax
c0100f59:	ff 75 08             	pushl  0x8(%ebp)
c0100f5c:	68 00 01 00 00       	push   $0x100
c0100f61:	68 00 20 15 c0       	push   $0xc0152000
c0100f66:	e8 45 06 00 00       	call   c01015b0 <vsnprintf>
c0100f6b:	83 c4 10             	add    $0x10,%esp
c0100f6e:	85 c0                	test   %eax,%eax
c0100f70:	89 c6                	mov    %eax,%esi
c0100f72:	7e 26                	jle    c0100f9a <printk+0x4a>
c0100f74:	31 db                	xor    %ebx,%ebx
c0100f76:	8d 76 00             	lea    0x0(%esi),%esi
c0100f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100f80:	0f be 93 00 20 15 c0 	movsbl -0x3feae000(%ebx),%edx
c0100f87:	83 ec 0c             	sub    $0xc,%esp
c0100f8a:	83 c3 01             	add    $0x1,%ebx
c0100f8d:	52                   	push   %edx
c0100f8e:	e8 5d 00 00 00       	call   c0100ff0 <serial_printc>
c0100f93:	83 c4 10             	add    $0x10,%esp
c0100f96:	39 f3                	cmp    %esi,%ebx
c0100f98:	75 e6                	jne    c0100f80 <printk+0x30>
c0100f9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0100f9d:	5b                   	pop    %ebx
c0100f9e:	5e                   	pop    %esi
c0100f9f:	5d                   	pop    %ebp
c0100fa0:	c3                   	ret    
c0100fa1:	66 90                	xchg   %ax,%ax
c0100fa3:	66 90                	xchg   %ax,%ax
c0100fa5:	66 90                	xchg   %ax,%ax
c0100fa7:	66 90                	xchg   %ax,%ax
c0100fa9:	66 90                	xchg   %ax,%ax
c0100fab:	66 90                	xchg   %ax,%ax
c0100fad:	66 90                	xchg   %ax,%ax
c0100faf:	90                   	nop

c0100fb0 <init_serial>:
c0100fb0:	55                   	push   %ebp
c0100fb1:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0100fb6:	31 c0                	xor    %eax,%eax
c0100fb8:	89 e5                	mov    %esp,%ebp
c0100fba:	ee                   	out    %al,(%dx)
c0100fbb:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0100fc0:	b2 fb                	mov    $0xfb,%dl
c0100fc2:	ee                   	out    %al,(%dx)
c0100fc3:	b8 01 00 00 00       	mov    $0x1,%eax
c0100fc8:	b2 f8                	mov    $0xf8,%dl
c0100fca:	ee                   	out    %al,(%dx)
c0100fcb:	31 c0                	xor    %eax,%eax
c0100fcd:	b2 f9                	mov    $0xf9,%dl
c0100fcf:	ee                   	out    %al,(%dx)
c0100fd0:	b8 03 00 00 00       	mov    $0x3,%eax
c0100fd5:	b2 fb                	mov    $0xfb,%dl
c0100fd7:	ee                   	out    %al,(%dx)
c0100fd8:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c0100fdd:	b2 fa                	mov    $0xfa,%dl
c0100fdf:	ee                   	out    %al,(%dx)
c0100fe0:	b8 0b 00 00 00       	mov    $0xb,%eax
c0100fe5:	b2 fc                	mov    $0xfc,%dl
c0100fe7:	ee                   	out    %al,(%dx)
c0100fe8:	5d                   	pop    %ebp
c0100fe9:	c3                   	ret    
c0100fea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100ff0 <serial_printc>:
c0100ff0:	55                   	push   %ebp
c0100ff1:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0100ff6:	89 e5                	mov    %esp,%ebp
c0100ff8:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ffb:	90                   	nop
c0100ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101000:	ec                   	in     (%dx),%al
c0101001:	a8 20                	test   $0x20,%al
c0101003:	74 fb                	je     c0101000 <serial_printc+0x10>
c0101005:	ba f8 03 00 00       	mov    $0x3f8,%edx
c010100a:	89 c8                	mov    %ecx,%eax
c010100c:	ee                   	out    %al,(%dx)
c010100d:	5d                   	pop    %ebp
c010100e:	c3                   	ret    
c010100f:	90                   	nop

c0101010 <ramdisk_read>:
c0101010:	55                   	push   %ebp
c0101011:	89 e5                	mov    %esp,%ebp
c0101013:	53                   	push   %ebx
c0101014:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101017:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010101a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010101d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101020:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101025:	76 06                	jbe    c010102d <ramdisk_read+0x1d>
c0101027:	b8 01 00 00 00       	mov    $0x1,%eax
c010102c:	d6                   	(bad)  
c010102d:	89 5d 08             	mov    %ebx,0x8(%ebp)
c0101030:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101033:	89 55 0c             	mov    %edx,0xc(%ebp)
c0101036:	5b                   	pop    %ebx
c0101037:	5d                   	pop    %ebp
c0101038:	e9 13 04 00 00       	jmp    c0101450 <memcpy>
c010103d:	8d 76 00             	lea    0x0(%esi),%esi

c0101040 <ramdisk_write>:
c0101040:	55                   	push   %ebp
c0101041:	89 e5                	mov    %esp,%ebp
c0101043:	53                   	push   %ebx
c0101044:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101047:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010104a:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010104d:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c0101050:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c0101055:	76 06                	jbe    c010105d <ramdisk_write+0x1d>
c0101057:	b8 01 00 00 00       	mov    $0x1,%eax
c010105c:	d6                   	(bad)  
c010105d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0101060:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101063:	89 55 08             	mov    %edx,0x8(%ebp)
c0101066:	5b                   	pop    %ebx
c0101067:	5d                   	pop    %ebp
c0101068:	e9 e3 03 00 00       	jmp    c0101450 <memcpy>
c010106d:	66 90                	xchg   %ax,%ax
c010106f:	90                   	nop

c0101070 <ide_intr>:
c0101070:	55                   	push   %ebp
c0101071:	c7 05 04 21 15 c0 01 	movl   $0x1,0xc0152104
c0101078:	00 00 00 
c010107b:	89 e5                	mov    %esp,%ebp
c010107d:	5d                   	pop    %ebp
c010107e:	c3                   	ret    
c010107f:	90                   	nop

c0101080 <ide_writeback>:
c0101080:	a1 00 21 15 c0       	mov    0xc0152100,%eax
c0101085:	83 c0 01             	add    $0x1,%eax
c0101088:	83 f8 64             	cmp    $0x64,%eax
c010108b:	a3 00 21 15 c0       	mov    %eax,0xc0152100
c0101090:	74 06                	je     c0101098 <ide_writeback+0x18>
c0101092:	c3                   	ret    
c0101093:	90                   	nop
c0101094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101098:	55                   	push   %ebp
c0101099:	89 e5                	mov    %esp,%ebp
c010109b:	83 ec 08             	sub    $0x8,%esp
c010109e:	e8 dd 01 00 00       	call   c0101280 <buf_writeback>
c01010a3:	c7 05 00 21 15 c0 00 	movl   $0x0,0xc0152100
c01010aa:	00 00 00 
c01010ad:	c9                   	leave  
c01010ae:	c3                   	ret    
c01010af:	90                   	nop

c01010b0 <ide_read>:
c01010b0:	55                   	push   %ebp
c01010b1:	89 e5                	mov    %esp,%ebp
c01010b3:	57                   	push   %edi
c01010b4:	56                   	push   %esi
c01010b5:	53                   	push   %ebx
c01010b6:	83 ec 0c             	sub    $0xc,%esp
c01010b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01010bc:	8b 45 10             	mov    0x10(%ebp),%eax
c01010bf:	8b 7d 08             	mov    0x8(%ebp),%edi
c01010c2:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c01010c5:	29 df                	sub    %ebx,%edi
c01010c7:	85 c0                	test   %eax,%eax
c01010c9:	74 1b                	je     c01010e6 <ide_read+0x36>
c01010cb:	90                   	nop
c01010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01010d0:	83 ec 0c             	sub    $0xc,%esp
c01010d3:	53                   	push   %ebx
c01010d4:	e8 07 02 00 00       	call   c01012e0 <read_byte>
c01010d9:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c01010dc:	83 c3 01             	add    $0x1,%ebx
c01010df:	83 c4 10             	add    $0x10,%esp
c01010e2:	39 f3                	cmp    %esi,%ebx
c01010e4:	75 ea                	jne    c01010d0 <ide_read+0x20>
c01010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01010e9:	5b                   	pop    %ebx
c01010ea:	5e                   	pop    %esi
c01010eb:	5f                   	pop    %edi
c01010ec:	5d                   	pop    %ebp
c01010ed:	c3                   	ret    
c01010ee:	66 90                	xchg   %ax,%ax

c01010f0 <ide_write>:
c01010f0:	55                   	push   %ebp
c01010f1:	89 e5                	mov    %esp,%ebp
c01010f3:	57                   	push   %edi
c01010f4:	56                   	push   %esi
c01010f5:	53                   	push   %ebx
c01010f6:	83 ec 0c             	sub    $0xc,%esp
c01010f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01010fc:	8b 45 10             	mov    0x10(%ebp),%eax
c01010ff:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101102:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101105:	29 df                	sub    %ebx,%edi
c0101107:	85 c0                	test   %eax,%eax
c0101109:	74 1d                	je     c0101128 <ide_write+0x38>
c010110b:	90                   	nop
c010110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101110:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c0101114:	83 ec 08             	sub    $0x8,%esp
c0101117:	50                   	push   %eax
c0101118:	53                   	push   %ebx
c0101119:	83 c3 01             	add    $0x1,%ebx
c010111c:	e8 ef 01 00 00       	call   c0101310 <write_byte>
c0101121:	83 c4 10             	add    $0x10,%esp
c0101124:	39 f3                	cmp    %esi,%ebx
c0101126:	75 e8                	jne    c0101110 <ide_write+0x20>
c0101128:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010112b:	5b                   	pop    %ebx
c010112c:	5e                   	pop    %esi
c010112d:	5f                   	pop    %edi
c010112e:	5d                   	pop    %ebp
c010112f:	c3                   	ret    

c0101130 <clear_ide_intr>:
c0101130:	55                   	push   %ebp
c0101131:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c0101138:	00 00 00 
c010113b:	89 e5                	mov    %esp,%ebp
c010113d:	5d                   	pop    %ebp
c010113e:	c3                   	ret    
c010113f:	90                   	nop

c0101140 <wait_ide_intr>:
c0101140:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101145:	55                   	push   %ebp
c0101146:	89 e5                	mov    %esp,%ebp
c0101148:	85 c0                	test   %eax,%eax
c010114a:	75 0e                	jne    c010115a <wait_ide_intr+0x1a>
c010114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101150:	f4                   	hlt    
c0101151:	a1 04 21 15 c0       	mov    0xc0152104,%eax
c0101156:	85 c0                	test   %eax,%eax
c0101158:	74 f6                	je     c0101150 <wait_ide_intr+0x10>
c010115a:	c7 05 04 21 15 c0 00 	movl   $0x0,0xc0152104
c0101161:	00 00 00 
c0101164:	5d                   	pop    %ebp
c0101165:	c3                   	ret    
c0101166:	8d 76 00             	lea    0x0(%esi),%esi
c0101169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101170 <init_ide>:
c0101170:	55                   	push   %ebp
c0101171:	89 e5                	mov    %esp,%ebp
c0101173:	83 ec 08             	sub    $0x8,%esp
c0101176:	e8 d5 00 00 00       	call   c0101250 <buf_init>
c010117b:	83 ec 08             	sub    $0x8,%esp
c010117e:	68 80 10 10 c0       	push   $0xc0101080
c0101183:	6a 00                	push   $0x0
c0101185:	e8 c6 f3 ff ff       	call   c0100550 <add_irq_handle>
c010118a:	58                   	pop    %eax
c010118b:	5a                   	pop    %edx
c010118c:	68 70 10 10 c0       	push   $0xc0101070
c0101191:	6a 0e                	push   $0xe
c0101193:	e8 b8 f3 ff ff       	call   c0100550 <add_irq_handle>
c0101198:	83 c4 10             	add    $0x10,%esp
c010119b:	c9                   	leave  
c010119c:	c3                   	ret    
c010119d:	66 90                	xchg   %ax,%ax
c010119f:	90                   	nop

c01011a0 <buf_fetch>:
c01011a0:	55                   	push   %ebp
c01011a1:	89 c2                	mov    %eax,%edx
c01011a3:	89 e5                	mov    %esp,%ebp
c01011a5:	57                   	push   %edi
c01011a6:	56                   	push   %esi
c01011a7:	53                   	push   %ebx
c01011a8:	89 c3                	mov    %eax,%ebx
c01011aa:	83 e3 7f             	and    $0x7f,%ebx
c01011ad:	89 d8                	mov    %ebx,%eax
c01011af:	83 ec 1c             	sub    $0x1c,%esp
c01011b2:	c1 e0 09             	shl    $0x9,%eax
c01011b5:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c01011b8:	8d 81 40 21 15 c0    	lea    -0x3feadec0(%ecx),%eax
c01011be:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c01011c2:	74 5c                	je     c0101220 <buf_fetch+0x80>
c01011c4:	89 d7                	mov    %edx,%edi
c01011c6:	89 da                	mov    %ebx,%edx
c01011c8:	c1 e2 09             	shl    $0x9,%edx
c01011cb:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01011ce:	8d 91 40 21 15 c0    	lea    -0x3feadec0(%ecx),%edx
c01011d4:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c01011da:	74 54                	je     c0101230 <buf_fetch+0x90>
c01011dc:	8d 72 06             	lea    0x6(%edx),%esi
c01011df:	83 ec 08             	sub    $0x8,%esp
c01011e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01011e5:	57                   	push   %edi
c01011e6:	56                   	push   %esi
c01011e7:	e8 a4 01 00 00       	call   c0101390 <disk_do_read>
c01011ec:	89 da                	mov    %ebx,%edx
c01011ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011f1:	83 c4 10             	add    $0x10,%esp
c01011f4:	c1 e2 09             	shl    $0x9,%edx
c01011f7:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c01011fa:	c6 81 44 21 15 c0 01 	movb   $0x1,-0x3feadebc(%ecx)
c0101201:	89 b9 40 21 15 c0    	mov    %edi,-0x3feadec0(%ecx)
c0101207:	c6 81 45 21 15 c0 00 	movb   $0x0,-0x3feadebb(%ecx)
c010120e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101211:	5b                   	pop    %ebx
c0101212:	5e                   	pop    %esi
c0101213:	5f                   	pop    %edi
c0101214:	5d                   	pop    %ebp
c0101215:	c3                   	ret    
c0101216:	8d 76 00             	lea    0x0(%esi),%esi
c0101219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101220:	39 91 40 21 15 c0    	cmp    %edx,-0x3feadec0(%ecx)
c0101226:	75 9c                	jne    c01011c4 <buf_fetch+0x24>
c0101228:	eb e4                	jmp    c010120e <buf_fetch+0x6e>
c010122a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101230:	8d 72 06             	lea    0x6(%edx),%esi
c0101233:	83 ec 08             	sub    $0x8,%esp
c0101236:	ff b1 40 21 15 c0    	pushl  -0x3feadec0(%ecx)
c010123c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010123f:	56                   	push   %esi
c0101240:	e8 8b 01 00 00       	call   c01013d0 <disk_do_write>
c0101245:	83 c4 10             	add    $0x10,%esp
c0101248:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010124b:	eb 92                	jmp    c01011df <buf_fetch+0x3f>
c010124d:	8d 76 00             	lea    0x0(%esi),%esi

c0101250 <buf_init>:
c0101250:	55                   	push   %ebp
c0101251:	b8 44 21 15 c0       	mov    $0xc0152144,%eax
c0101256:	89 e5                	mov    %esp,%ebp
c0101258:	90                   	nop
c0101259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101260:	c6 00 00             	movb   $0x0,(%eax)
c0101263:	05 08 02 00 00       	add    $0x208,%eax
c0101268:	3d 44 25 16 c0       	cmp    $0xc0162544,%eax
c010126d:	75 f1                	jne    c0101260 <buf_init+0x10>
c010126f:	5d                   	pop    %ebp
c0101270:	c3                   	ret    
c0101271:	eb 0d                	jmp    c0101280 <buf_writeback>
c0101273:	90                   	nop
c0101274:	90                   	nop
c0101275:	90                   	nop
c0101276:	90                   	nop
c0101277:	90                   	nop
c0101278:	90                   	nop
c0101279:	90                   	nop
c010127a:	90                   	nop
c010127b:	90                   	nop
c010127c:	90                   	nop
c010127d:	90                   	nop
c010127e:	90                   	nop
c010127f:	90                   	nop

c0101280 <buf_writeback>:
c0101280:	55                   	push   %ebp
c0101281:	89 e5                	mov    %esp,%ebp
c0101283:	53                   	push   %ebx
c0101284:	bb 46 21 15 c0       	mov    $0xc0152146,%ebx
c0101289:	83 ec 04             	sub    $0x4,%esp
c010128c:	eb 10                	jmp    c010129e <buf_writeback+0x1e>
c010128e:	66 90                	xchg   %ax,%ax
c0101290:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101296:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c010129c:	74 32                	je     c01012d0 <buf_writeback+0x50>
c010129e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c01012a2:	75 ec                	jne    c0101290 <buf_writeback+0x10>
c01012a4:	83 ec 08             	sub    $0x8,%esp
c01012a7:	ff 73 fa             	pushl  -0x6(%ebx)
c01012aa:	53                   	push   %ebx
c01012ab:	81 c3 08 02 00 00    	add    $0x208,%ebx
c01012b1:	e8 1a 01 00 00       	call   c01013d0 <disk_do_write>
c01012b6:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c01012bd:	83 c4 10             	add    $0x10,%esp
c01012c0:	81 fb 46 25 16 c0    	cmp    $0xc0162546,%ebx
c01012c6:	75 d6                	jne    c010129e <buf_writeback+0x1e>
c01012c8:	90                   	nop
c01012c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01012d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01012d3:	c9                   	leave  
c01012d4:	c3                   	ret    
c01012d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01012d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01012e0 <read_byte>:
c01012e0:	55                   	push   %ebp
c01012e1:	89 e5                	mov    %esp,%ebp
c01012e3:	53                   	push   %ebx
c01012e4:	83 ec 04             	sub    $0x4,%esp
c01012e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01012ea:	89 d8                	mov    %ebx,%eax
c01012ec:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c01012f2:	c1 e8 09             	shr    $0x9,%eax
c01012f5:	e8 a6 fe ff ff       	call   c01011a0 <buf_fetch>
c01012fa:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c01012ff:	83 c4 04             	add    $0x4,%esp
c0101302:	5b                   	pop    %ebx
c0101303:	5d                   	pop    %ebp
c0101304:	c3                   	ret    
c0101305:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101310 <write_byte>:
c0101310:	55                   	push   %ebp
c0101311:	89 e5                	mov    %esp,%ebp
c0101313:	56                   	push   %esi
c0101314:	53                   	push   %ebx
c0101315:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101318:	8b 75 0c             	mov    0xc(%ebp),%esi
c010131b:	89 d8                	mov    %ebx,%eax
c010131d:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101323:	c1 e8 09             	shr    $0x9,%eax
c0101326:	e8 75 fe ff ff       	call   c01011a0 <buf_fetch>
c010132b:	89 f2                	mov    %esi,%edx
c010132d:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101331:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101335:	5b                   	pop    %ebx
c0101336:	5e                   	pop    %esi
c0101337:	5d                   	pop    %ebp
c0101338:	c3                   	ret    
c0101339:	66 90                	xchg   %ax,%ax
c010133b:	66 90                	xchg   %ax,%ax
c010133d:	66 90                	xchg   %ax,%ax
c010133f:	90                   	nop

c0101340 <ide_prepare>:
c0101340:	55                   	push   %ebp
c0101341:	89 c1                	mov    %eax,%ecx
c0101343:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101348:	89 e5                	mov    %esp,%ebp
c010134a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101350:	ec                   	in     (%dx),%al
c0101351:	83 e0 c0             	and    $0xffffffc0,%eax
c0101354:	3c 40                	cmp    $0x40,%al
c0101356:	75 f8                	jne    c0101350 <ide_prepare+0x10>
c0101358:	ba f1 01 00 00       	mov    $0x1f1,%edx
c010135d:	31 c0                	xor    %eax,%eax
c010135f:	ee                   	out    %al,(%dx)
c0101360:	b8 01 00 00 00       	mov    $0x1,%eax
c0101365:	b2 f2                	mov    $0xf2,%dl
c0101367:	ee                   	out    %al,(%dx)
c0101368:	b2 f3                	mov    $0xf3,%dl
c010136a:	89 c8                	mov    %ecx,%eax
c010136c:	ee                   	out    %al,(%dx)
c010136d:	89 c8                	mov    %ecx,%eax
c010136f:	b2 f4                	mov    $0xf4,%dl
c0101371:	c1 e8 08             	shr    $0x8,%eax
c0101374:	ee                   	out    %al,(%dx)
c0101375:	89 c8                	mov    %ecx,%eax
c0101377:	b2 f5                	mov    $0xf5,%dl
c0101379:	c1 e8 10             	shr    $0x10,%eax
c010137c:	ee                   	out    %al,(%dx)
c010137d:	89 c8                	mov    %ecx,%eax
c010137f:	b2 f6                	mov    $0xf6,%dl
c0101381:	c1 e8 18             	shr    $0x18,%eax
c0101384:	83 c8 e0             	or     $0xffffffe0,%eax
c0101387:	ee                   	out    %al,(%dx)
c0101388:	5d                   	pop    %ebp
c0101389:	c3                   	ret    
c010138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101390 <disk_do_read>:
c0101390:	55                   	push   %ebp
c0101391:	89 e5                	mov    %esp,%ebp
c0101393:	53                   	push   %ebx
c0101394:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101397:	e8 a4 ff ff ff       	call   c0101340 <ide_prepare>
c010139c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01013a1:	b8 20 00 00 00       	mov    $0x20,%eax
c01013a6:	ee                   	out    %al,(%dx)
c01013a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01013aa:	b2 f0                	mov    $0xf0,%dl
c01013ac:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01013b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01013b8:	ed                   	in     (%dx),%eax
c01013b9:	89 01                	mov    %eax,(%ecx)
c01013bb:	83 c1 04             	add    $0x4,%ecx
c01013be:	39 d9                	cmp    %ebx,%ecx
c01013c0:	75 f6                	jne    c01013b8 <disk_do_read+0x28>
c01013c2:	5b                   	pop    %ebx
c01013c3:	5d                   	pop    %ebp
c01013c4:	c3                   	ret    
c01013c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01013c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01013d0 <disk_do_write>:
c01013d0:	55                   	push   %ebp
c01013d1:	89 e5                	mov    %esp,%ebp
c01013d3:	53                   	push   %ebx
c01013d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01013d7:	e8 64 ff ff ff       	call   c0101340 <ide_prepare>
c01013dc:	ba f7 01 00 00       	mov    $0x1f7,%edx
c01013e1:	b8 30 00 00 00       	mov    $0x30,%eax
c01013e6:	ee                   	out    %al,(%dx)
c01013e7:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01013ea:	b2 f0                	mov    $0xf0,%dl
c01013ec:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c01013f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01013f8:	8b 01                	mov    (%ecx),%eax
c01013fa:	ef                   	out    %eax,(%dx)
c01013fb:	83 c1 04             	add    $0x4,%ecx
c01013fe:	39 d9                	cmp    %ebx,%ecx
c0101400:	75 f6                	jne    c01013f8 <disk_do_write+0x28>
c0101402:	5b                   	pop    %ebx
c0101403:	5d                   	pop    %ebp
c0101404:	c3                   	ret    
c0101405:	66 90                	xchg   %ax,%ax
c0101407:	66 90                	xchg   %ax,%ax
c0101409:	66 90                	xchg   %ax,%ax
c010140b:	66 90                	xchg   %ax,%ax
c010140d:	66 90                	xchg   %ax,%ax
c010140f:	90                   	nop

c0101410 <dma_prepare>:
c0101410:	55                   	push   %ebp
c0101411:	89 e5                	mov    %esp,%ebp
c0101413:	83 ec 08             	sub    $0x8,%esp
c0101416:	68 ec 80 10 c0       	push   $0xc01080ec
c010141b:	6a 1d                	push   $0x1d
c010141d:	68 83 80 10 c0       	push   $0xc0108083
c0101422:	68 a0 80 10 c0       	push   $0xc01080a0
c0101427:	e8 24 fb ff ff       	call   c0100f50 <printk>
c010142c:	b8 01 00 00 00       	mov    $0x1,%eax
c0101431:	d6                   	(bad)  
c0101432:	83 c4 10             	add    $0x10,%esp
c0101435:	c9                   	leave  
c0101436:	c3                   	ret    
c0101437:	89 f6                	mov    %esi,%esi
c0101439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101440 <dma_issue_read>:
c0101440:	55                   	push   %ebp
c0101441:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101446:	89 e5                	mov    %esp,%ebp
c0101448:	ec                   	in     (%dx),%al
c0101449:	83 c8 09             	or     $0x9,%eax
c010144c:	ee                   	out    %al,(%dx)
c010144d:	5d                   	pop    %ebp
c010144e:	c3                   	ret    
c010144f:	90                   	nop

c0101450 <memcpy>:
c0101450:	55                   	push   %ebp
c0101451:	89 e5                	mov    %esp,%ebp
c0101453:	56                   	push   %esi
c0101454:	57                   	push   %edi
c0101455:	53                   	push   %ebx
c0101456:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101459:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010145c:	8b 75 0c             	mov    0xc(%ebp),%esi
c010145f:	fc                   	cld    
c0101460:	83 f9 08             	cmp    $0x8,%ecx
c0101463:	76 26                	jbe    c010148b <memcpy+0x3b>
c0101465:	89 fa                	mov    %edi,%edx
c0101467:	89 cb                	mov    %ecx,%ebx
c0101469:	83 e2 03             	and    $0x3,%edx
c010146c:	74 10                	je     c010147e <memcpy+0x2e>
c010146e:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101473:	29 d1                	sub    %edx,%ecx
c0101475:	83 e1 03             	and    $0x3,%ecx
c0101478:	29 cb                	sub    %ecx,%ebx
c010147a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010147c:	89 d9                	mov    %ebx,%ecx
c010147e:	c1 e9 02             	shr    $0x2,%ecx
c0101481:	8d 76 00             	lea    0x0(%esi),%esi
c0101484:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0101486:	89 d9                	mov    %ebx,%ecx
c0101488:	83 e1 03             	and    $0x3,%ecx
c010148b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010148d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101490:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101493:	5b                   	pop    %ebx
c0101494:	5f                   	pop    %edi
c0101495:	5e                   	pop    %esi
c0101496:	c9                   	leave  
c0101497:	c3                   	ret    

c0101498 <memset>:
c0101498:	55                   	push   %ebp
c0101499:	89 e5                	mov    %esp,%ebp
c010149b:	57                   	push   %edi
c010149c:	8b 7d 08             	mov    0x8(%ebp),%edi
c010149f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c01014a3:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01014a6:	fc                   	cld    
c01014a7:	83 f9 10             	cmp    $0x10,%ecx
c01014aa:	76 69                	jbe    c0101515 <memset+0x7d>
c01014ac:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014b2:	74 4c                	je     c0101500 <memset+0x68>
c01014b4:	88 07                	mov    %al,(%edi)
c01014b6:	47                   	inc    %edi
c01014b7:	49                   	dec    %ecx
c01014b8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014be:	74 40                	je     c0101500 <memset+0x68>
c01014c0:	88 07                	mov    %al,(%edi)
c01014c2:	47                   	inc    %edi
c01014c3:	49                   	dec    %ecx
c01014c4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014ca:	74 34                	je     c0101500 <memset+0x68>
c01014cc:	88 07                	mov    %al,(%edi)
c01014ce:	47                   	inc    %edi
c01014cf:	49                   	dec    %ecx
c01014d0:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014d6:	74 28                	je     c0101500 <memset+0x68>
c01014d8:	88 07                	mov    %al,(%edi)
c01014da:	47                   	inc    %edi
c01014db:	49                   	dec    %ecx
c01014dc:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014e2:	74 1c                	je     c0101500 <memset+0x68>
c01014e4:	88 07                	mov    %al,(%edi)
c01014e6:	47                   	inc    %edi
c01014e7:	49                   	dec    %ecx
c01014e8:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014ee:	74 10                	je     c0101500 <memset+0x68>
c01014f0:	88 07                	mov    %al,(%edi)
c01014f2:	47                   	inc    %edi
c01014f3:	49                   	dec    %ecx
c01014f4:	f7 c7 07 00 00 00    	test   $0x7,%edi
c01014fa:	74 04                	je     c0101500 <memset+0x68>
c01014fc:	88 07                	mov    %al,(%edi)
c01014fe:	47                   	inc    %edi
c01014ff:	49                   	dec    %ecx
c0101500:	88 c4                	mov    %al,%ah
c0101502:	89 c2                	mov    %eax,%edx
c0101504:	c1 e2 10             	shl    $0x10,%edx
c0101507:	09 d0                	or     %edx,%eax
c0101509:	89 ca                	mov    %ecx,%edx
c010150b:	c1 e9 02             	shr    $0x2,%ecx
c010150e:	83 e2 03             	and    $0x3,%edx
c0101511:	f3 ab                	rep stos %eax,%es:(%edi)
c0101513:	89 d1                	mov    %edx,%ecx
c0101515:	f3 aa                	rep stos %al,%es:(%edi)
c0101517:	8b 45 08             	mov    0x8(%ebp),%eax
c010151a:	8d 65 fc             	lea    -0x4(%ebp),%esp
c010151d:	5f                   	pop    %edi
c010151e:	c9                   	leave  
c010151f:	c3                   	ret    

c0101520 <_vsnprintf_r>:
c0101520:	55                   	push   %ebp
c0101521:	89 e5                	mov    %esp,%ebp
c0101523:	56                   	push   %esi
c0101524:	53                   	push   %ebx
c0101525:	83 c4 80             	add    $0xffffff80,%esp
c0101528:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010152b:	8b 75 08             	mov    0x8(%ebp),%esi
c010152e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101531:	85 db                	test   %ebx,%ebx
c0101533:	78 63                	js     c0101598 <_vsnprintf_r+0x78>
c0101535:	ba 08 02 00 00       	mov    $0x208,%edx
c010153a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c010153f:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
c0101543:	8d 53 ff             	lea    -0x1(%ebx),%edx
c0101546:	89 45 90             	mov    %eax,-0x70(%ebp)
c0101549:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010154c:	31 c0                	xor    %eax,%eax
c010154e:	85 db                	test   %ebx,%ebx
c0101550:	0f 45 c2             	cmovne %edx,%eax
c0101553:	89 45 98             	mov    %eax,-0x68(%ebp)
c0101556:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0101559:	8b 45 18             	mov    0x18(%ebp),%eax
c010155c:	89 34 24             	mov    %esi,(%esp)
c010155f:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
c0101563:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101567:	8b 45 14             	mov    0x14(%ebp),%eax
c010156a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010156e:	8d 45 90             	lea    -0x70(%ebp),%eax
c0101571:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101575:	e8 86 00 00 00       	call   c0101600 <_svfprintf_r>
c010157a:	83 f8 ff             	cmp    $0xffffffff,%eax
c010157d:	7c 11                	jl     c0101590 <_vsnprintf_r+0x70>
c010157f:	85 db                	test   %ebx,%ebx
c0101581:	74 06                	je     c0101589 <_vsnprintf_r+0x69>
c0101583:	8b 55 90             	mov    -0x70(%ebp),%edx
c0101586:	c6 02 00             	movb   $0x0,(%edx)
c0101589:	83 ec 80             	sub    $0xffffff80,%esp
c010158c:	5b                   	pop    %ebx
c010158d:	5e                   	pop    %esi
c010158e:	5d                   	pop    %ebp
c010158f:	c3                   	ret    
c0101590:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c0101596:	eb e7                	jmp    c010157f <_vsnprintf_r+0x5f>
c0101598:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c010159e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01015a3:	eb e4                	jmp    c0101589 <_vsnprintf_r+0x69>
c01015a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01015a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01015b0 <vsnprintf>:
c01015b0:	55                   	push   %ebp
c01015b1:	89 e5                	mov    %esp,%ebp
c01015b3:	83 ec 28             	sub    $0x28,%esp
c01015b6:	e8 35 00 00 00       	call   c01015f0 <__getreent>
c01015bb:	8b 55 14             	mov    0x14(%ebp),%edx
c01015be:	89 54 24 10          	mov    %edx,0x10(%esp)
c01015c2:	8b 55 10             	mov    0x10(%ebp),%edx
c01015c5:	89 04 24             	mov    %eax,(%esp)
c01015c8:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01015cc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01015cf:	89 54 24 08          	mov    %edx,0x8(%esp)
c01015d3:	8b 55 08             	mov    0x8(%ebp),%edx
c01015d6:	89 54 24 04          	mov    %edx,0x4(%esp)
c01015da:	e8 41 ff ff ff       	call   c0101520 <_vsnprintf_r>
c01015df:	c9                   	leave  
c01015e0:	c3                   	ret    
c01015e1:	66 90                	xchg   %ax,%ax
c01015e3:	66 90                	xchg   %ax,%ax
c01015e5:	66 90                	xchg   %ax,%ax
c01015e7:	66 90                	xchg   %ax,%ax
c01015e9:	66 90                	xchg   %ax,%ax
c01015eb:	66 90                	xchg   %ax,%ax
c01015ed:	66 90                	xchg   %ax,%ax
c01015ef:	90                   	nop

c01015f0 <__getreent>:
c01015f0:	55                   	push   %ebp
c01015f1:	a1 60 a5 10 c0       	mov    0xc010a560,%eax
c01015f6:	89 e5                	mov    %esp,%ebp
c01015f8:	5d                   	pop    %ebp
c01015f9:	c3                   	ret    
c01015fa:	66 90                	xchg   %ax,%ax
c01015fc:	66 90                	xchg   %ax,%ax
c01015fe:	66 90                	xchg   %ax,%ax

c0101600 <_svfprintf_r>:
c0101600:	55                   	push   %ebp
c0101601:	89 e5                	mov    %esp,%ebp
c0101603:	57                   	push   %edi
c0101604:	56                   	push   %esi
c0101605:	53                   	push   %ebx
c0101606:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
c010160c:	8b 45 08             	mov    0x8(%ebp),%eax
c010160f:	89 04 24             	mov    %eax,(%esp)
c0101612:	e8 89 33 00 00       	call   c01049a0 <_localeconv_r>
c0101617:	8b 00                	mov    (%eax),%eax
c0101619:	89 04 24             	mov    %eax,(%esp)
c010161c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
c0101622:	e8 d9 4a 00 00       	call   c0106100 <strlen>
c0101627:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
c010162d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101630:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0101634:	74 0b                	je     c0101641 <_svfprintf_r+0x41>
c0101636:	8b 40 10             	mov    0x10(%eax),%eax
c0101639:	85 c0                	test   %eax,%eax
c010163b:	0f 84 62 18 00 00    	je     c0102ea3 <_svfprintf_r+0x18a3>
c0101641:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101644:	8d 55 a7             	lea    -0x59(%ebp),%edx
c0101647:	89 c7                	mov    %eax,%edi
c0101649:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c010164f:	90                   	nop
c0101650:	90                   	nop
c0101651:	29 d0                	sub    %edx,%eax
c0101653:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c010165a:	00 00 00 
c010165d:	90                   	nop
c010165e:	90                   	nop
c010165f:	90                   	nop
c0101660:	90                   	nop
c0101661:	90                   	nop
c0101662:	90                   	nop
c0101663:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c010166a:	00 00 00 
c010166d:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
c0101674:	00 00 00 
c0101677:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
c010167e:	00 00 00 
c0101681:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
c0101688:	00 00 00 
c010168b:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c0101692:	00 00 00 
c0101695:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
c010169b:	8b 45 10             	mov    0x10(%ebp),%eax
c010169e:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01016a1:	0f b6 00             	movzbl (%eax),%eax
c01016a4:	3c 25                	cmp    $0x25,%al
c01016a6:	74 4d                	je     c01016f5 <_svfprintf_r+0xf5>
c01016a8:	84 c0                	test   %al,%al
c01016aa:	75 08                	jne    c01016b4 <_svfprintf_r+0xb4>
c01016ac:	eb 47                	jmp    c01016f5 <_svfprintf_r+0xf5>
c01016ae:	66 90                	xchg   %ax,%ax
c01016b0:	84 c0                	test   %al,%al
c01016b2:	74 0a                	je     c01016be <_svfprintf_r+0xbe>
c01016b4:	83 c3 01             	add    $0x1,%ebx
c01016b7:	0f b6 03             	movzbl (%ebx),%eax
c01016ba:	3c 25                	cmp    $0x25,%al
c01016bc:	75 f2                	jne    c01016b0 <_svfprintf_r+0xb0>
c01016be:	89 de                	mov    %ebx,%esi
c01016c0:	2b 75 10             	sub    0x10(%ebp),%esi
c01016c3:	74 30                	je     c01016f5 <_svfprintf_r+0xf5>
c01016c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01016c8:	83 c7 08             	add    $0x8,%edi
c01016cb:	89 77 fc             	mov    %esi,-0x4(%edi)
c01016ce:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
c01016d4:	89 47 f8             	mov    %eax,-0x8(%edi)
c01016d7:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01016dd:	83 c0 01             	add    $0x1,%eax
c01016e0:	83 f8 07             	cmp    $0x7,%eax
c01016e3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01016e9:	0f 8f 91 00 00 00    	jg     c0101780 <_svfprintf_r+0x180>
c01016ef:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
c01016f5:	80 3b 00             	cmpb   $0x0,(%ebx)
c01016f8:	0f 84 aa 00 00 00    	je     c01017a8 <_svfprintf_r+0x1a8>
c01016fe:	8d 43 01             	lea    0x1(%ebx),%eax
c0101701:	be 20 00 00 00       	mov    $0x20,%esi
c0101706:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010170d:	31 db                	xor    %ebx,%ebx
c010170f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0101716:	ff ff ff 
c0101719:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101720:	00 00 00 
c0101723:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
c010172a:	00 00 00 
c010172d:	8d 48 01             	lea    0x1(%eax),%ecx
c0101730:	0f be 00             	movsbl (%eax),%eax
c0101733:	8d 50 e0             	lea    -0x20(%eax),%edx
c0101736:	83 fa 58             	cmp    $0x58,%edx
c0101739:	0f 87 8f 07 00 00    	ja     c0101ece <_svfprintf_r+0x8ce>
c010173f:	ff 24 95 3c 81 10 c0 	jmp    *-0x3fef7ec4(,%edx,4)
c0101746:	66 90                	xchg   %ax,%ax
c0101748:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c010174f:	89 c8                	mov    %ecx,%eax
c0101751:	eb da                	jmp    c010172d <_svfprintf_r+0x12d>
c0101753:	8b 45 14             	mov    0x14(%ebp),%eax
c0101756:	8b 55 14             	mov    0x14(%ebp),%edx
c0101759:	8b 00                	mov    (%eax),%eax
c010175b:	83 c2 04             	add    $0x4,%edx
c010175e:	89 55 14             	mov    %edx,0x14(%ebp)
c0101761:	85 c0                	test   %eax,%eax
c0101763:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
c0101769:	79 e4                	jns    c010174f <_svfprintf_r+0x14f>
c010176b:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
c0101771:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
c0101778:	89 c8                	mov    %ecx,%eax
c010177a:	eb b1                	jmp    c010172d <_svfprintf_r+0x12d>
c010177c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101780:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101786:	89 44 24 08          	mov    %eax,0x8(%esp)
c010178a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010178d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101791:	8b 45 08             	mov    0x8(%ebp),%eax
c0101794:	89 04 24             	mov    %eax,(%esp)
c0101797:	e8 e4 49 00 00       	call   c0106180 <__ssprint_r>
c010179c:	85 c0                	test   %eax,%eax
c010179e:	75 30                	jne    c01017d0 <_svfprintf_r+0x1d0>
c01017a0:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01017a3:	e9 47 ff ff ff       	jmp    c01016ef <_svfprintf_r+0xef>
c01017a8:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01017ae:	85 c0                	test   %eax,%eax
c01017b0:	74 1e                	je     c01017d0 <_svfprintf_r+0x1d0>
c01017b2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01017b8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01017bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01017bf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01017c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01017c6:	89 04 24             	mov    %eax,(%esp)
c01017c9:	e8 b2 49 00 00       	call   c0106180 <__ssprint_r>
c01017ce:	66 90                	xchg   %ax,%ax
c01017d0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01017d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01017d8:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
c01017dc:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
c01017e3:	81 c4 1c 01 00 00    	add    $0x11c,%esp
c01017e9:	5b                   	pop    %ebx
c01017ea:	5e                   	pop    %esi
c01017eb:	5f                   	pop    %edi
c01017ec:	5d                   	pop    %ebp
c01017ed:	c3                   	ret    
c01017ee:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c01017f3:	89 c8                	mov    %ecx,%eax
c01017f5:	e9 33 ff ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c01017fa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101800:	8b 45 14             	mov    0x14(%ebp),%eax
c0101803:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101806:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010180d:	8d 70 04             	lea    0x4(%eax),%esi
c0101810:	8b 00                	mov    (%eax),%eax
c0101812:	85 c0                	test   %eax,%eax
c0101814:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010181a:	0f 84 7f 18 00 00    	je     c010309f <_svfprintf_r+0x1a9f>
c0101820:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101826:	85 c0                	test   %eax,%eax
c0101828:	0f 88 b6 17 00 00    	js     c0102fe4 <_svfprintf_r+0x19e4>
c010182e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101832:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0101838:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010183f:	00 
c0101840:	89 04 24             	mov    %eax,(%esp)
c0101843:	e8 f8 38 00 00       	call   c0105140 <memchr>
c0101848:	85 c0                	test   %eax,%eax
c010184a:	0f 84 a0 19 00 00    	je     c01031f0 <_svfprintf_r+0x1bf0>
c0101850:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101856:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c010185c:	39 d0                	cmp    %edx,%eax
c010185e:	0f 4f c2             	cmovg  %edx,%eax
c0101861:	89 c2                	mov    %eax,%edx
c0101863:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010186a:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0101870:	31 c0                	xor    %eax,%eax
c0101872:	85 d2                	test   %edx,%edx
c0101874:	0f 49 c2             	cmovns %edx,%eax
c0101877:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c010187d:	89 75 14             	mov    %esi,0x14(%ebp)
c0101880:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101887:	00 00 00 
c010188a:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101891:	00 00 00 
c0101894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101898:	84 db                	test   %bl,%bl
c010189a:	74 07                	je     c01018a3 <_svfprintf_r+0x2a3>
c010189c:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
c01018a3:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01018a9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01018af:	89 c8                	mov    %ecx,%eax
c01018b1:	89 f2                	mov    %esi,%edx
c01018b3:	83 c0 02             	add    $0x2,%eax
c01018b6:	83 e2 02             	and    $0x2,%edx
c01018b9:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
c01018bf:	89 f2                	mov    %esi,%edx
c01018c1:	0f 44 c1             	cmove  %ecx,%eax
c01018c4:	81 e2 84 00 00 00    	and    $0x84,%edx
c01018ca:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01018d0:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
c01018d6:	0f 85 1c 06 00 00    	jne    c0101ef8 <_svfprintf_r+0x8f8>
c01018dc:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c01018e2:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01018e8:	85 f6                	test   %esi,%esi
c01018ea:	0f 8e 08 06 00 00    	jle    c0101ef8 <_svfprintf_r+0x8f8>
c01018f0:	83 fe 10             	cmp    $0x10,%esi
c01018f3:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01018f9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01018ff:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101905:	7f 11                	jg     c0101918 <_svfprintf_r+0x318>
c0101907:	eb 6b                	jmp    c0101974 <_svfprintf_r+0x374>
c0101909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101910:	83 ee 10             	sub    $0x10,%esi
c0101913:	83 fe 10             	cmp    $0x10,%esi
c0101916:	7e 5c                	jle    c0101974 <_svfprintf_r+0x374>
c0101918:	83 c0 01             	add    $0x1,%eax
c010191b:	83 c1 10             	add    $0x10,%ecx
c010191e:	c7 07 b0 82 10 c0    	movl   $0xc01082b0,(%edi)
c0101924:	83 c7 08             	add    $0x8,%edi
c0101927:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010192e:	83 f8 07             	cmp    $0x7,%eax
c0101931:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101937:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010193d:	7e d1                	jle    c0101910 <_svfprintf_r+0x310>
c010193f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101942:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0101946:	89 44 24 04          	mov    %eax,0x4(%esp)
c010194a:	8b 45 08             	mov    0x8(%ebp),%eax
c010194d:	89 04 24             	mov    %eax,(%esp)
c0101950:	e8 2b 48 00 00       	call   c0106180 <__ssprint_r>
c0101955:	85 c0                	test   %eax,%eax
c0101957:	0f 85 73 fe ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010195d:	83 ee 10             	sub    $0x10,%esi
c0101960:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101966:	83 fe 10             	cmp    $0x10,%esi
c0101969:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010196f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0101972:	7f a4                	jg     c0101918 <_svfprintf_r+0x318>
c0101974:	83 c0 01             	add    $0x1,%eax
c0101977:	01 f1                	add    %esi,%ecx
c0101979:	83 f8 07             	cmp    $0x7,%eax
c010197c:	c7 07 b0 82 10 c0    	movl   $0xc01082b0,(%edi)
c0101982:	89 77 04             	mov    %esi,0x4(%edi)
c0101985:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010198b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101991:	0f 8f 16 0e 00 00    	jg     c01027ad <_svfprintf_r+0x11ad>
c0101997:	83 c7 08             	add    $0x8,%edi
c010199a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01019a1:	e9 58 05 00 00       	jmp    c0101efe <_svfprintf_r+0x8fe>
c01019a6:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01019ad:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01019b3:	8b 45 14             	mov    0x14(%ebp),%eax
c01019b6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01019b9:	0f 85 fd 04 00 00    	jne    c0101ebc <_svfprintf_r+0x8bc>
c01019bf:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01019c6:	0f 84 f0 04 00 00    	je     c0101ebc <_svfprintf_r+0x8bc>
c01019cc:	0f b7 08             	movzwl (%eax),%ecx
c01019cf:	83 c0 04             	add    $0x4,%eax
c01019d2:	89 45 14             	mov    %eax,0x14(%ebp)
c01019d5:	b8 01 00 00 00       	mov    $0x1,%eax
c01019da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01019e0:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01019e7:	31 db                	xor    %ebx,%ebx
c01019e9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01019ef:	89 f2                	mov    %esi,%edx
c01019f1:	80 e2 7f             	and    $0x7f,%dl
c01019f4:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
c01019fb:	0f 48 d6             	cmovs  %esi,%edx
c01019fe:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
c0101a04:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0101a0a:	85 d2                	test   %edx,%edx
c0101a0c:	75 08                	jne    c0101a16 <_svfprintf_r+0x416>
c0101a0e:	85 c9                	test   %ecx,%ecx
c0101a10:	0f 84 ea 08 00 00    	je     c0102300 <_svfprintf_r+0xd00>
c0101a16:	3c 01                	cmp    $0x1,%al
c0101a18:	0f 84 6a 0d 00 00    	je     c0102788 <_svfprintf_r+0x1188>
c0101a1e:	3c 02                	cmp    $0x2,%al
c0101a20:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101a23:	0f 85 bf 0b 00 00    	jne    c01025e8 <_svfprintf_r+0xfe8>
c0101a29:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
c0101a2f:	90                   	nop
c0101a30:	89 ca                	mov    %ecx,%edx
c0101a32:	83 e8 01             	sub    $0x1,%eax
c0101a35:	83 e2 0f             	and    $0xf,%edx
c0101a38:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c0101a3c:	c1 e9 04             	shr    $0x4,%ecx
c0101a3f:	85 c9                	test   %ecx,%ecx
c0101a41:	88 10                	mov    %dl,(%eax)
c0101a43:	75 eb                	jne    c0101a30 <_svfprintf_r+0x430>
c0101a45:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0101a48:	29 c2                	sub    %eax,%edx
c0101a4a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101a50:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0101a56:	66 90                	xchg   %ax,%ax
c0101a58:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0101a5e:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
c0101a64:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101a6b:	00 00 00 
c0101a6e:	39 c2                	cmp    %eax,%edx
c0101a70:	0f 4d c2             	cmovge %edx,%eax
c0101a73:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101a79:	e9 1a fe ff ff       	jmp    c0101898 <_svfprintf_r+0x298>
c0101a7e:	84 db                	test   %bl,%bl
c0101a80:	89 c8                	mov    %ecx,%eax
c0101a82:	0f 44 de             	cmove  %esi,%ebx
c0101a85:	e9 a3 fc ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c0101a8a:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
c0101a91:	89 c8                	mov    %ecx,%eax
c0101a93:	e9 95 fc ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c0101a98:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
c0101a9f:	00 00 00 
c0101aa2:	89 c8                	mov    %ecx,%eax
c0101aa4:	e9 84 fc ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c0101aa9:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101aaf:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101ab2:	31 ff                	xor    %edi,%edi
c0101ab4:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101abb:	00 00 00 
c0101abe:	66 90                	xchg   %ax,%ax
c0101ac0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
c0101ac3:	83 c1 01             	add    $0x1,%ecx
c0101ac6:	8d 3c 42             	lea    (%edx,%eax,2),%edi
c0101ac9:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
c0101acd:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101ad0:	83 fa 09             	cmp    $0x9,%edx
c0101ad3:	76 eb                	jbe    c0101ac0 <_svfprintf_r+0x4c0>
c0101ad5:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
c0101adb:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101ae1:	e9 4d fc ff ff       	jmp    c0101733 <_svfprintf_r+0x133>
c0101ae6:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101aed:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101af4:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101afa:	8b 45 14             	mov    0x14(%ebp),%eax
c0101afd:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b00:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101b06:	0f 85 61 02 00 00    	jne    c0101d6d <_svfprintf_r+0x76d>
c0101b0c:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101b13:	0f 84 54 02 00 00    	je     c0101d6d <_svfprintf_r+0x76d>
c0101b19:	0f bf 08             	movswl (%eax),%ecx
c0101b1c:	83 c0 04             	add    $0x4,%eax
c0101b1f:	89 45 14             	mov    %eax,0x14(%ebp)
c0101b22:	85 c9                	test   %ecx,%ecx
c0101b24:	0f 88 53 02 00 00    	js     c0101d7d <_svfprintf_r+0x77d>
c0101b2a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101b31:	b8 01 00 00 00       	mov    $0x1,%eax
c0101b36:	e9 ae fe ff ff       	jmp    c01019e9 <_svfprintf_r+0x3e9>
c0101b3b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
c0101b42:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101b48:	8b 45 14             	mov    0x14(%ebp),%eax
c0101b4b:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101b4e:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101b54:	0f 84 15 10 00 00    	je     c0102b6f <_svfprintf_r+0x156f>
c0101b5a:	db 28                	fldt   (%eax)
c0101b5c:	83 c0 0c             	add    $0xc,%eax
c0101b5f:	89 45 14             	mov    %eax,0x14(%ebp)
c0101b62:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0101b68:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101b6e:	dd 1c 24             	fstpl  (%esp)
c0101b71:	e8 aa 44 00 00       	call   c0106020 <__fpclassifyd>
c0101b76:	83 f8 01             	cmp    $0x1,%eax
c0101b79:	0f 85 82 0f 00 00    	jne    c0102b01 <_svfprintf_r+0x1501>
c0101b7f:	d9 ee                	fldz   
c0101b81:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0101b87:	d9 c9                	fxch   %st(1)
c0101b89:	df e9                	fucomip %st(1),%st
c0101b8b:	dd d8                	fstp   %st(0)
c0101b8d:	0f 87 59 15 00 00    	ja     c01030ec <_svfprintf_r+0x1aec>
c0101b93:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0101b9a:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0101ba1:	ba fe 80 10 c0       	mov    $0xc01080fe,%edx
c0101ba6:	b8 02 81 10 c0       	mov    $0xc0108102,%eax
c0101bab:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0101bb2:	00 00 00 
c0101bb5:	0f 4e c2             	cmovle %edx,%eax
c0101bb8:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101bbe:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0101bc5:	ff ff ff 
c0101bc8:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0101bcf:	00 00 00 
c0101bd2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101bd9:	00 00 00 
c0101bdc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101be3:	00 00 00 
c0101be6:	e9 ad fc ff ff       	jmp    c0101898 <_svfprintf_r+0x298>
c0101beb:	8d 41 01             	lea    0x1(%ecx),%eax
c0101bee:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0101bf4:	0f be 01             	movsbl (%ecx),%eax
c0101bf7:	83 f8 2a             	cmp    $0x2a,%eax
c0101bfa:	0f 84 84 18 00 00    	je     c0103484 <_svfprintf_r+0x1e84>
c0101c00:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c03:	31 c9                	xor    %ecx,%ecx
c0101c05:	83 fa 09             	cmp    $0x9,%edx
c0101c08:	0f 87 a8 16 00 00    	ja     c01032b6 <_svfprintf_r+0x1cb6>
c0101c0e:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
c0101c14:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0101c1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101c20:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
c0101c23:	83 c7 01             	add    $0x1,%edi
c0101c26:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
c0101c29:	0f be 47 ff          	movsbl -0x1(%edi),%eax
c0101c2d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0101c30:	83 fa 09             	cmp    $0x9,%edx
c0101c33:	76 eb                	jbe    c0101c20 <_svfprintf_r+0x620>
c0101c35:	85 c9                	test   %ecx,%ecx
c0101c37:	89 ca                	mov    %ecx,%edx
c0101c39:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0101c3e:	0f 48 d1             	cmovs  %ecx,%edx
c0101c41:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0101c47:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
c0101c4d:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0101c53:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0101c59:	e9 d5 fa ff ff       	jmp    c0101733 <_svfprintf_r+0x133>
c0101c5e:	8b 45 14             	mov    0x14(%ebp),%eax
c0101c61:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101c64:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101c6b:	8b 08                	mov    (%eax),%ecx
c0101c6d:	83 c0 04             	add    $0x4,%eax
c0101c70:	89 45 14             	mov    %eax,0x14(%ebp)
c0101c73:	b8 02 00 00 00       	mov    $0x2,%eax
c0101c78:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101c7f:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
c0101c86:	c7 85 18 ff ff ff 1f 	movl   $0xc010811f,-0xe8(%ebp)
c0101c8d:	81 10 c0 
c0101c90:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
c0101c97:	00 00 00 
c0101c9a:	e9 41 fd ff ff       	jmp    c01019e0 <_svfprintf_r+0x3e0>
c0101c9f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101ca6:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101cac:	8b 45 14             	mov    0x14(%ebp),%eax
c0101caf:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101cb2:	0f 85 87 00 00 00    	jne    c0101d3f <_svfprintf_r+0x73f>
c0101cb8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101cbf:	74 7e                	je     c0101d3f <_svfprintf_r+0x73f>
c0101cc1:	0f b7 08             	movzwl (%eax),%ecx
c0101cc4:	83 c0 04             	add    $0x4,%eax
c0101cc7:	89 45 14             	mov    %eax,0x14(%ebp)
c0101cca:	31 c0                	xor    %eax,%eax
c0101ccc:	e9 0f fd ff ff       	jmp    c01019e0 <_svfprintf_r+0x3e0>
c0101cd1:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
c0101cd8:	89 c8                	mov    %ecx,%eax
c0101cda:	e9 4e fa ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c0101cdf:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101ce6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101ce9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101cef:	0f 85 97 0b 00 00    	jne    c010288c <_svfprintf_r+0x128c>
c0101cf5:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101cfc:	0f 84 8a 0b 00 00    	je     c010288c <_svfprintf_r+0x128c>
c0101d02:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d05:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
c0101d0c:	8b 00                	mov    (%eax),%eax
c0101d0e:	66 89 10             	mov    %dx,(%eax)
c0101d11:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d14:	83 c0 04             	add    $0x4,%eax
c0101d17:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d1a:	e9 7c f9 ff ff       	jmp    c010169b <_svfprintf_r+0x9b>
c0101d1f:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101d26:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d2d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101d33:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d36:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d39:	0f 84 79 ff ff ff    	je     c0101cb8 <_svfprintf_r+0x6b8>
c0101d3f:	8b 08                	mov    (%eax),%ecx
c0101d41:	83 c0 04             	add    $0x4,%eax
c0101d44:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d47:	31 c0                	xor    %eax,%eax
c0101d49:	e9 92 fc ff ff       	jmp    c01019e0 <_svfprintf_r+0x3e0>
c0101d4e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101d55:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101d5b:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d5e:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101d61:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101d67:	0f 84 9f fd ff ff    	je     c0101b0c <_svfprintf_r+0x50c>
c0101d6d:	8b 08                	mov    (%eax),%ecx
c0101d6f:	83 c0 04             	add    $0x4,%eax
c0101d72:	89 45 14             	mov    %eax,0x14(%ebp)
c0101d75:	85 c9                	test   %ecx,%ecx
c0101d77:	0f 89 ad fd ff ff    	jns    c0101b2a <_svfprintf_r+0x52a>
c0101d7d:	f7 d9                	neg    %ecx
c0101d7f:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0101d84:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c0101d8b:	b8 01 00 00 00       	mov    $0x1,%eax
c0101d90:	e9 54 fc ff ff       	jmp    c01019e9 <_svfprintf_r+0x3e9>
c0101d95:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
c0101d9c:	89 c8                	mov    %ecx,%eax
c0101d9e:	e9 8a f9 ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c0101da3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101daa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101db0:	8b 45 14             	mov    0x14(%ebp),%eax
c0101db3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101db6:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101dbc:	c7 85 18 ff ff ff 1f 	movl   $0xc010811f,-0xe8(%ebp)
c0101dc3:	81 10 c0 
c0101dc6:	75 71                	jne    c0101e39 <_svfprintf_r+0x839>
c0101dc8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0101dcf:	74 68                	je     c0101e39 <_svfprintf_r+0x839>
c0101dd1:	0f b7 08             	movzwl (%eax),%ecx
c0101dd4:	83 c0 04             	add    $0x4,%eax
c0101dd7:	89 45 14             	mov    %eax,0x14(%ebp)
c0101dda:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0101de1:	b8 02 00 00 00       	mov    $0x2,%eax
c0101de6:	0f 84 f4 fb ff ff    	je     c01019e0 <_svfprintf_r+0x3e0>
c0101dec:	85 c9                	test   %ecx,%ecx
c0101dee:	0f 84 ec fb ff ff    	je     c01019e0 <_svfprintf_r+0x3e0>
c0101df4:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
c0101dfb:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0101e02:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0101e09:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
c0101e0f:	e9 cc fb ff ff       	jmp    c01019e0 <_svfprintf_r+0x3e0>
c0101e14:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101e1b:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e21:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e24:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e27:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101e2d:	c7 85 18 ff ff ff 0e 	movl   $0xc010810e,-0xe8(%ebp)
c0101e34:	81 10 c0 
c0101e37:	74 8f                	je     c0101dc8 <_svfprintf_r+0x7c8>
c0101e39:	8b 08                	mov    (%eax),%ecx
c0101e3b:	83 c0 04             	add    $0x4,%eax
c0101e3e:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e41:	eb 97                	jmp    c0101dda <_svfprintf_r+0x7da>
c0101e43:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101e49:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e4c:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101e4f:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101e56:	8b 00                	mov    (%eax),%eax
c0101e58:	88 45 80             	mov    %al,-0x80(%ebp)
c0101e5b:	8b 45 14             	mov    0x14(%ebp),%eax
c0101e5e:	83 c0 04             	add    $0x4,%eax
c0101e61:	89 45 14             	mov    %eax,0x14(%ebp)
c0101e64:	8d 45 80             	lea    -0x80(%ebp),%eax
c0101e67:	31 db                	xor    %ebx,%ebx
c0101e69:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
c0101e70:	00 00 00 
c0101e73:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0101e7a:	00 00 00 
c0101e7d:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0101e84:	00 00 00 
c0101e87:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0101e8e:	00 00 00 
c0101e91:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0101e97:	e9 07 fa ff ff       	jmp    c01018a3 <_svfprintf_r+0x2a3>
c0101e9c:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101ea3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0101eaa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101eb0:	8b 45 14             	mov    0x14(%ebp),%eax
c0101eb3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101eb6:	0f 84 03 fb ff ff    	je     c01019bf <_svfprintf_r+0x3bf>
c0101ebc:	8b 08                	mov    (%eax),%ecx
c0101ebe:	83 c0 04             	add    $0x4,%eax
c0101ec1:	89 45 14             	mov    %eax,0x14(%ebp)
c0101ec4:	b8 01 00 00 00       	mov    $0x1,%eax
c0101ec9:	e9 12 fb ff ff       	jmp    c01019e0 <_svfprintf_r+0x3e0>
c0101ece:	85 c0                	test   %eax,%eax
c0101ed0:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0101ed6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0101ed9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0101edf:	0f 84 c3 f8 ff ff    	je     c01017a8 <_svfprintf_r+0x1a8>
c0101ee5:	88 45 80             	mov    %al,-0x80(%ebp)
c0101ee8:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101eef:	e9 70 ff ff ff       	jmp    c0101e64 <_svfprintf_r+0x864>
c0101ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101ef8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0101efe:	84 db                	test   %bl,%bl
c0101f00:	74 33                	je     c0101f35 <_svfprintf_r+0x935>
c0101f02:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
c0101f08:	83 c1 01             	add    $0x1,%ecx
c0101f0b:	89 07                	mov    %eax,(%edi)
c0101f0d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101f13:	83 c7 08             	add    $0x8,%edi
c0101f16:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0101f1d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101f23:	83 c0 01             	add    $0x1,%eax
c0101f26:	83 f8 07             	cmp    $0x7,%eax
c0101f29:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101f2f:	0f 8f 7b 06 00 00    	jg     c01025b0 <_svfprintf_r+0xfb0>
c0101f35:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
c0101f3b:	85 db                	test   %ebx,%ebx
c0101f3d:	74 33                	je     c0101f72 <_svfprintf_r+0x972>
c0101f3f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0101f45:	83 c1 02             	add    $0x2,%ecx
c0101f48:	89 07                	mov    %eax,(%edi)
c0101f4a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101f50:	83 c7 08             	add    $0x8,%edi
c0101f53:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
c0101f5a:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101f60:	83 c0 01             	add    $0x1,%eax
c0101f63:	83 f8 07             	cmp    $0x7,%eax
c0101f66:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101f6c:	0f 8f 06 06 00 00    	jg     c0102578 <_svfprintf_r+0xf78>
c0101f72:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
c0101f79:	00 00 00 
c0101f7c:	0f 84 c6 03 00 00    	je     c0102348 <_svfprintf_r+0xd48>
c0101f82:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0101f88:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
c0101f8e:	85 f6                	test   %esi,%esi
c0101f90:	0f 8e d2 00 00 00    	jle    c0102068 <_svfprintf_r+0xa68>
c0101f96:	83 fe 10             	cmp    $0x10,%esi
c0101f99:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101f9f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0101fa5:	7f 11                	jg     c0101fb8 <_svfprintf_r+0x9b8>
c0101fa7:	eb 6b                	jmp    c0102014 <_svfprintf_r+0xa14>
c0101fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101fb0:	83 ee 10             	sub    $0x10,%esi
c0101fb3:	83 fe 10             	cmp    $0x10,%esi
c0101fb6:	7e 5c                	jle    c0102014 <_svfprintf_r+0xa14>
c0101fb8:	83 c0 01             	add    $0x1,%eax
c0101fbb:	83 c1 10             	add    $0x10,%ecx
c0101fbe:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c0101fc4:	83 c7 08             	add    $0x8,%edi
c0101fc7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0101fce:	83 f8 07             	cmp    $0x7,%eax
c0101fd1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0101fd7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101fdd:	7e d1                	jle    c0101fb0 <_svfprintf_r+0x9b0>
c0101fdf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fe2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0101fe6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101fea:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fed:	89 04 24             	mov    %eax,(%esp)
c0101ff0:	e8 8b 41 00 00       	call   c0106180 <__ssprint_r>
c0101ff5:	85 c0                	test   %eax,%eax
c0101ff7:	0f 85 d3 f7 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0101ffd:	83 ee 10             	sub    $0x10,%esi
c0102000:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102006:	83 fe 10             	cmp    $0x10,%esi
c0102009:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010200f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102012:	7f a4                	jg     c0101fb8 <_svfprintf_r+0x9b8>
c0102014:	83 c0 01             	add    $0x1,%eax
c0102017:	01 f1                	add    %esi,%ecx
c0102019:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c010201f:	83 c7 08             	add    $0x8,%edi
c0102022:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102025:	83 f8 07             	cmp    $0x7,%eax
c0102028:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010202e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102034:	7e 32                	jle    c0102068 <_svfprintf_r+0xa68>
c0102036:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010203c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102040:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102043:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102047:	8b 45 08             	mov    0x8(%ebp),%eax
c010204a:	89 04 24             	mov    %eax,(%esp)
c010204d:	e8 2e 41 00 00       	call   c0106180 <__ssprint_r>
c0102052:	85 c0                	test   %eax,%eax
c0102054:	0f 85 76 f7 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010205a:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102060:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102063:	90                   	nop
c0102064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102068:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
c010206f:	01 00 00 
c0102072:	0f 85 50 01 00 00    	jne    c01021c8 <_svfprintf_r+0xbc8>
c0102078:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010207e:	89 07                	mov    %eax,(%edi)
c0102080:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
c0102086:	01 c1                	add    %eax,%ecx
c0102088:	89 47 04             	mov    %eax,0x4(%edi)
c010208b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102091:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102097:	83 c0 01             	add    $0x1,%eax
c010209a:	83 f8 07             	cmp    $0x7,%eax
c010209d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01020a3:	0f 8f 6a 04 00 00    	jg     c0102513 <_svfprintf_r+0xf13>
c01020a9:	83 c7 08             	add    $0x8,%edi
c01020ac:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
c01020b3:	0f 84 d7 00 00 00    	je     c0102190 <_svfprintf_r+0xb90>
c01020b9:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c01020bf:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01020c5:	85 f6                	test   %esi,%esi
c01020c7:	0f 8e c3 00 00 00    	jle    c0102190 <_svfprintf_r+0xb90>
c01020cd:	83 fe 10             	cmp    $0x10,%esi
c01020d0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01020d6:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01020dc:	7f 0a                	jg     c01020e8 <_svfprintf_r+0xae8>
c01020de:	eb 64                	jmp    c0102144 <_svfprintf_r+0xb44>
c01020e0:	83 ee 10             	sub    $0x10,%esi
c01020e3:	83 fe 10             	cmp    $0x10,%esi
c01020e6:	7e 5c                	jle    c0102144 <_svfprintf_r+0xb44>
c01020e8:	83 c0 01             	add    $0x1,%eax
c01020eb:	83 c1 10             	add    $0x10,%ecx
c01020ee:	c7 07 b0 82 10 c0    	movl   $0xc01082b0,(%edi)
c01020f4:	83 c7 08             	add    $0x8,%edi
c01020f7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01020fe:	83 f8 07             	cmp    $0x7,%eax
c0102101:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102107:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010210d:	7e d1                	jle    c01020e0 <_svfprintf_r+0xae0>
c010210f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102112:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102116:	89 44 24 04          	mov    %eax,0x4(%esp)
c010211a:	8b 45 08             	mov    0x8(%ebp),%eax
c010211d:	89 04 24             	mov    %eax,(%esp)
c0102120:	e8 5b 40 00 00       	call   c0106180 <__ssprint_r>
c0102125:	85 c0                	test   %eax,%eax
c0102127:	0f 85 a3 f6 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010212d:	83 ee 10             	sub    $0x10,%esi
c0102130:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102136:	83 fe 10             	cmp    $0x10,%esi
c0102139:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010213f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102142:	7f a4                	jg     c01020e8 <_svfprintf_r+0xae8>
c0102144:	83 c0 01             	add    $0x1,%eax
c0102147:	01 f1                	add    %esi,%ecx
c0102149:	83 f8 07             	cmp    $0x7,%eax
c010214c:	c7 07 b0 82 10 c0    	movl   $0xc01082b0,(%edi)
c0102152:	89 77 04             	mov    %esi,0x4(%edi)
c0102155:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010215b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102161:	7e 2d                	jle    c0102190 <_svfprintf_r+0xb90>
c0102163:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102169:	89 44 24 08          	mov    %eax,0x8(%esp)
c010216d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102170:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102174:	8b 45 08             	mov    0x8(%ebp),%eax
c0102177:	89 04 24             	mov    %eax,(%esp)
c010217a:	e8 01 40 00 00       	call   c0106180 <__ssprint_r>
c010217f:	85 c0                	test   %eax,%eax
c0102181:	0f 85 49 f6 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102187:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010218d:	8d 76 00             	lea    0x0(%esi),%esi
c0102190:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
c0102196:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
c010219c:	39 c2                	cmp    %eax,%edx
c010219e:	0f 4d c2             	cmovge %edx,%eax
c01021a1:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
c01021a7:	85 c9                	test   %ecx,%ecx
c01021a9:	0f 85 99 03 00 00    	jne    c0102548 <_svfprintf_r+0xf48>
c01021af:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01021b6:	00 00 00 
c01021b9:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01021bc:	e9 da f4 ff ff       	jmp    c010169b <_svfprintf_r+0x9b>
c01021c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01021c8:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c01021cf:	0f 8e 5b 02 00 00    	jle    c0102430 <_svfprintf_r+0xe30>
c01021d5:	d9 ee                	fldz   
c01021d7:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01021dd:	df e9                	fucomip %st(1),%st
c01021df:	dd d8                	fstp   %st(0)
c01021e1:	0f 8a 59 04 00 00    	jp     c0102640 <_svfprintf_r+0x1040>
c01021e7:	0f 85 53 04 00 00    	jne    c0102640 <_svfprintf_r+0x1040>
c01021ed:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01021f3:	83 c1 01             	add    $0x1,%ecx
c01021f6:	83 c7 08             	add    $0x8,%edi
c01021f9:	c7 47 f8 37 81 10 c0 	movl   $0xc0108137,-0x8(%edi)
c0102200:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102207:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010220d:	83 c0 01             	add    $0x1,%eax
c0102210:	83 f8 07             	cmp    $0x7,%eax
c0102213:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102219:	0f 8f 63 09 00 00    	jg     c0102b82 <_svfprintf_r+0x1582>
c010221f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102225:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
c010222b:	7c 0d                	jl     c010223a <_svfprintf_r+0xc3a>
c010222d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102234:	0f 84 72 fe ff ff    	je     c01020ac <_svfprintf_r+0xaac>
c010223a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102240:	83 c7 08             	add    $0x8,%edi
c0102243:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102246:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010224c:	89 47 fc             	mov    %eax,-0x4(%edi)
c010224f:	01 c1                	add    %eax,%ecx
c0102251:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102257:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010225d:	83 c0 01             	add    $0x1,%eax
c0102260:	83 f8 07             	cmp    $0x7,%eax
c0102263:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102269:	0f 8f dc 0b 00 00    	jg     c0102e4b <_svfprintf_r+0x184b>
c010226f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102275:	8d 70 ff             	lea    -0x1(%eax),%esi
c0102278:	85 f6                	test   %esi,%esi
c010227a:	0f 8e 2c fe ff ff    	jle    c01020ac <_svfprintf_r+0xaac>
c0102280:	83 fe 10             	cmp    $0x10,%esi
c0102283:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102289:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010228f:	7f 13                	jg     c01022a4 <_svfprintf_r+0xca4>
c0102291:	e9 e6 05 00 00       	jmp    c010287c <_svfprintf_r+0x127c>
c0102296:	66 90                	xchg   %ax,%ax
c0102298:	83 ee 10             	sub    $0x10,%esi
c010229b:	83 fe 10             	cmp    $0x10,%esi
c010229e:	0f 8e d8 05 00 00    	jle    c010287c <_svfprintf_r+0x127c>
c01022a4:	83 c0 01             	add    $0x1,%eax
c01022a7:	83 c1 10             	add    $0x10,%ecx
c01022aa:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c01022b0:	83 c7 08             	add    $0x8,%edi
c01022b3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01022ba:	83 f8 07             	cmp    $0x7,%eax
c01022bd:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01022c3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01022c9:	7e cd                	jle    c0102298 <_svfprintf_r+0xc98>
c01022cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022ce:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01022d2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01022d9:	89 04 24             	mov    %eax,(%esp)
c01022dc:	e8 9f 3e 00 00       	call   c0106180 <__ssprint_r>
c01022e1:	85 c0                	test   %eax,%eax
c01022e3:	0f 85 e7 f4 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c01022e9:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01022ef:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01022f2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01022f8:	eb 9e                	jmp    c0102298 <_svfprintf_r+0xc98>
c01022fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102300:	84 c0                	test   %al,%al
c0102302:	75 2c                	jne    c0102330 <_svfprintf_r+0xd30>
c0102304:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010230b:	74 23                	je     c0102330 <_svfprintf_r+0xd30>
c010230d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102313:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0102317:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010231d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102320:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102326:	e9 2d f7 ff ff       	jmp    c0101a58 <_svfprintf_r+0x458>
c010232b:	90                   	nop
c010232c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102330:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102333:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
c010233a:	00 00 00 
c010233d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102343:	e9 10 f7 ff ff       	jmp    c0101a58 <_svfprintf_r+0x458>
c0102348:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c010234e:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102354:	85 f6                	test   %esi,%esi
c0102356:	0f 8e 26 fc ff ff    	jle    c0101f82 <_svfprintf_r+0x982>
c010235c:	83 fe 10             	cmp    $0x10,%esi
c010235f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102365:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c010236b:	7f 0b                	jg     c0102378 <_svfprintf_r+0xd78>
c010236d:	eb 65                	jmp    c01023d4 <_svfprintf_r+0xdd4>
c010236f:	90                   	nop
c0102370:	83 ee 10             	sub    $0x10,%esi
c0102373:	83 fe 10             	cmp    $0x10,%esi
c0102376:	7e 5c                	jle    c01023d4 <_svfprintf_r+0xdd4>
c0102378:	83 c0 01             	add    $0x1,%eax
c010237b:	83 c1 10             	add    $0x10,%ecx
c010237e:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c0102384:	83 c7 08             	add    $0x8,%edi
c0102387:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010238e:	83 f8 07             	cmp    $0x7,%eax
c0102391:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102397:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010239d:	7e d1                	jle    c0102370 <_svfprintf_r+0xd70>
c010239f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023a2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01023a6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01023aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01023ad:	89 04 24             	mov    %eax,(%esp)
c01023b0:	e8 cb 3d 00 00       	call   c0106180 <__ssprint_r>
c01023b5:	85 c0                	test   %eax,%eax
c01023b7:	0f 85 13 f4 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c01023bd:	83 ee 10             	sub    $0x10,%esi
c01023c0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01023c6:	83 fe 10             	cmp    $0x10,%esi
c01023c9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01023cf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01023d2:	7f a4                	jg     c0102378 <_svfprintf_r+0xd78>
c01023d4:	83 c0 01             	add    $0x1,%eax
c01023d7:	01 f1                	add    %esi,%ecx
c01023d9:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c01023df:	83 c7 08             	add    $0x8,%edi
c01023e2:	89 77 fc             	mov    %esi,-0x4(%edi)
c01023e5:	83 f8 07             	cmp    $0x7,%eax
c01023e8:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01023ee:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01023f4:	0f 8e 88 fb ff ff    	jle    c0101f82 <_svfprintf_r+0x982>
c01023fa:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102400:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102404:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102407:	89 44 24 04          	mov    %eax,0x4(%esp)
c010240b:	8b 45 08             	mov    0x8(%ebp),%eax
c010240e:	89 04 24             	mov    %eax,(%esp)
c0102411:	e8 6a 3d 00 00       	call   c0106180 <__ssprint_r>
c0102416:	85 c0                	test   %eax,%eax
c0102418:	0f 85 b2 f3 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010241e:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102424:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102427:	e9 56 fb ff ff       	jmp    c0101f82 <_svfprintf_r+0x982>
c010242c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102430:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
c0102437:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010243d:	0f 8e df 05 00 00    	jle    c0102a22 <_svfprintf_r+0x1422>
c0102443:	89 07                	mov    %eax,(%edi)
c0102445:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010244b:	8d 51 01             	lea    0x1(%ecx),%edx
c010244e:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102455:	83 c7 08             	add    $0x8,%edi
c0102458:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010245e:	83 c0 01             	add    $0x1,%eax
c0102461:	83 f8 07             	cmp    $0x7,%eax
c0102464:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010246a:	0f 8f 59 06 00 00    	jg     c0102ac9 <_svfprintf_r+0x14c9>
c0102470:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
c0102476:	83 c0 01             	add    $0x1,%eax
c0102479:	83 c7 08             	add    $0x8,%edi
c010247c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102482:	89 5f f8             	mov    %ebx,-0x8(%edi)
c0102485:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
c010248b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c010248e:	01 da                	add    %ebx,%edx
c0102490:	83 f8 07             	cmp    $0x7,%eax
c0102493:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102499:	0f 8f f2 05 00 00    	jg     c0102a91 <_svfprintf_r+0x1491>
c010249f:	d9 ee                	fldz   
c01024a1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01024a7:	df e9                	fucomip %st(1),%st
c01024a9:	dd d8                	fstp   %st(0)
c01024ab:	7a 06                	jp     c01024b3 <_svfprintf_r+0xeb3>
c01024ad:	0f 84 33 03 00 00    	je     c01027e6 <_svfprintf_r+0x11e6>
c01024b3:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
c01024b9:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c01024bf:	83 c1 01             	add    $0x1,%ecx
c01024c2:	89 0f                	mov    %ecx,(%edi)
c01024c4:	8d 4b ff             	lea    -0x1(%ebx),%ecx
c01024c7:	89 4f 04             	mov    %ecx,0x4(%edi)
c01024ca:	01 ca                	add    %ecx,%edx
c01024cc:	83 c0 01             	add    $0x1,%eax
c01024cf:	83 f8 07             	cmp    $0x7,%eax
c01024d2:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01024d8:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01024de:	0f 8f 75 05 00 00    	jg     c0102a59 <_svfprintf_r+0x1459>
c01024e4:	83 c7 08             	add    $0x8,%edi
c01024e7:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
c01024ed:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
c01024f3:	89 0f                	mov    %ecx,(%edi)
c01024f5:	89 5f 04             	mov    %ebx,0x4(%edi)
c01024f8:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
c01024fb:	83 c0 01             	add    $0x1,%eax
c01024fe:	83 f8 07             	cmp    $0x7,%eax
c0102501:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102507:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010250d:	0f 8e 96 fb ff ff    	jle    c01020a9 <_svfprintf_r+0xaa9>
c0102513:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102519:	89 44 24 08          	mov    %eax,0x8(%esp)
c010251d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102520:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102524:	8b 45 08             	mov    0x8(%ebp),%eax
c0102527:	89 04 24             	mov    %eax,(%esp)
c010252a:	e8 51 3c 00 00       	call   c0106180 <__ssprint_r>
c010252f:	85 c0                	test   %eax,%eax
c0102531:	0f 85 99 f2 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102537:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010253d:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102540:	e9 67 fb ff ff       	jmp    c01020ac <_svfprintf_r+0xaac>
c0102545:	8d 76 00             	lea    0x0(%esi),%esi
c0102548:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010254e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102552:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102555:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102559:	8b 45 08             	mov    0x8(%ebp),%eax
c010255c:	89 04 24             	mov    %eax,(%esp)
c010255f:	e8 1c 3c 00 00       	call   c0106180 <__ssprint_r>
c0102564:	85 c0                	test   %eax,%eax
c0102566:	0f 84 43 fc ff ff    	je     c01021af <_svfprintf_r+0xbaf>
c010256c:	e9 5f f2 ff ff       	jmp    c01017d0 <_svfprintf_r+0x1d0>
c0102571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102578:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010257e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102582:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102585:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102589:	8b 45 08             	mov    0x8(%ebp),%eax
c010258c:	89 04 24             	mov    %eax,(%esp)
c010258f:	e8 ec 3b 00 00       	call   c0106180 <__ssprint_r>
c0102594:	85 c0                	test   %eax,%eax
c0102596:	0f 85 34 f2 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010259c:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025a2:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01025a5:	e9 c8 f9 ff ff       	jmp    c0101f72 <_svfprintf_r+0x972>
c01025aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01025b0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01025b6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01025ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c01025bd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01025c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01025c4:	89 04 24             	mov    %eax,(%esp)
c01025c7:	e8 b4 3b 00 00       	call   c0106180 <__ssprint_r>
c01025cc:	85 c0                	test   %eax,%eax
c01025ce:	0f 85 fc f1 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c01025d4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01025da:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01025dd:	e9 53 f9 ff ff       	jmp    c0101f35 <_svfprintf_r+0x935>
c01025e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01025e8:	89 c2                	mov    %eax,%edx
c01025ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01025f0:	89 c8                	mov    %ecx,%eax
c01025f2:	83 ea 01             	sub    $0x1,%edx
c01025f5:	83 e0 07             	and    $0x7,%eax
c01025f8:	c1 e9 03             	shr    $0x3,%ecx
c01025fb:	83 c0 30             	add    $0x30,%eax
c01025fe:	85 c9                	test   %ecx,%ecx
c0102600:	88 02                	mov    %al,(%edx)
c0102602:	75 ec                	jne    c01025f0 <_svfprintf_r+0xff0>
c0102604:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010260b:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
c0102611:	0f 84 5b 01 00 00    	je     c0102772 <_svfprintf_r+0x1172>
c0102617:	3c 30                	cmp    $0x30,%al
c0102619:	74 0b                	je     c0102626 <_svfprintf_r+0x1026>
c010261b:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
c0102622:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0102626:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102629:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c010262f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102635:	e9 1e f4 ff ff       	jmp    c0101a58 <_svfprintf_r+0x458>
c010263a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102640:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102646:	85 db                	test   %ebx,%ebx
c0102648:	0f 8e 66 05 00 00    	jle    c0102bb4 <_svfprintf_r+0x15b4>
c010264e:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0102654:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c010265a:	01 d0                	add    %edx,%eax
c010265c:	89 c3                	mov    %eax,%ebx
c010265e:	29 d3                	sub    %edx,%ebx
c0102660:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102666:	89 d0                	mov    %edx,%eax
c0102668:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c010266e:	39 d3                	cmp    %edx,%ebx
c0102670:	0f 4f da             	cmovg  %edx,%ebx
c0102673:	85 db                	test   %ebx,%ebx
c0102675:	7e 28                	jle    c010269f <_svfprintf_r+0x109f>
c0102677:	89 07                	mov    %eax,(%edi)
c0102679:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010267f:	01 d9                	add    %ebx,%ecx
c0102681:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102684:	83 c7 08             	add    $0x8,%edi
c0102687:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010268d:	83 c0 01             	add    $0x1,%eax
c0102690:	83 f8 07             	cmp    $0x7,%eax
c0102693:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102699:	0f 8f 58 09 00 00    	jg     c0102ff7 <_svfprintf_r+0x19f7>
c010269f:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
c01026a5:	31 c0                	xor    %eax,%eax
c01026a7:	85 db                	test   %ebx,%ebx
c01026a9:	0f 49 c3             	cmovns %ebx,%eax
c01026ac:	29 c6                	sub    %eax,%esi
c01026ae:	85 f6                	test   %esi,%esi
c01026b0:	0f 8e 40 02 00 00    	jle    c01028f6 <_svfprintf_r+0x12f6>
c01026b6:	83 fe 10             	cmp    $0x10,%esi
c01026b9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01026bf:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01026c5:	7f 15                	jg     c01026dc <_svfprintf_r+0x10dc>
c01026c7:	e9 db 01 00 00       	jmp    c01028a7 <_svfprintf_r+0x12a7>
c01026cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01026d0:	83 ee 10             	sub    $0x10,%esi
c01026d3:	83 fe 10             	cmp    $0x10,%esi
c01026d6:	0f 8e cb 01 00 00    	jle    c01028a7 <_svfprintf_r+0x12a7>
c01026dc:	83 c0 01             	add    $0x1,%eax
c01026df:	83 c1 10             	add    $0x10,%ecx
c01026e2:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c01026e8:	83 c7 08             	add    $0x8,%edi
c01026eb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01026f2:	83 f8 07             	cmp    $0x7,%eax
c01026f5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01026fb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102701:	7e cd                	jle    c01026d0 <_svfprintf_r+0x10d0>
c0102703:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102706:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010270a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010270e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102711:	89 04 24             	mov    %eax,(%esp)
c0102714:	e8 67 3a 00 00       	call   c0106180 <__ssprint_r>
c0102719:	85 c0                	test   %eax,%eax
c010271b:	0f 85 af f0 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102721:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102727:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010272a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102730:	eb 9e                	jmp    c01026d0 <_svfprintf_r+0x10d0>
c0102732:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102735:	be cd cc cc cc       	mov    $0xcccccccd,%esi
c010273a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102740:	89 c7                	mov    %eax,%edi
c0102742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102748:	89 c8                	mov    %ecx,%eax
c010274a:	83 ef 01             	sub    $0x1,%edi
c010274d:	f7 e6                	mul    %esi
c010274f:	c1 ea 03             	shr    $0x3,%edx
c0102752:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0102755:	01 c0                	add    %eax,%eax
c0102757:	29 c1                	sub    %eax,%ecx
c0102759:	83 c1 30             	add    $0x30,%ecx
c010275c:	85 d2                	test   %edx,%edx
c010275e:	88 0f                	mov    %cl,(%edi)
c0102760:	89 d1                	mov    %edx,%ecx
c0102762:	75 e4                	jne    c0102748 <_svfprintf_r+0x1148>
c0102764:	89 fa                	mov    %edi,%edx
c0102766:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
c010276c:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0102772:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102775:	29 d0                	sub    %edx,%eax
c0102777:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010277d:	e9 d6 f2 ff ff       	jmp    c0101a58 <_svfprintf_r+0x458>
c0102782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102788:	83 f9 09             	cmp    $0x9,%ecx
c010278b:	77 a5                	ja     c0102732 <_svfprintf_r+0x1132>
c010278d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102793:	83 c1 30             	add    $0x30,%ecx
c0102796:	88 4d a7             	mov    %cl,-0x59(%ebp)
c0102799:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010279f:	8d 45 a7             	lea    -0x59(%ebp),%eax
c01027a2:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01027a8:	e9 ab f2 ff ff       	jmp    c0101a58 <_svfprintf_r+0x458>
c01027ad:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01027b3:	89 44 24 08          	mov    %eax,0x8(%esp)
c01027b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027ba:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027be:	8b 45 08             	mov    0x8(%ebp),%eax
c01027c1:	89 04 24             	mov    %eax,(%esp)
c01027c4:	e8 b7 39 00 00       	call   c0106180 <__ssprint_r>
c01027c9:	85 c0                	test   %eax,%eax
c01027cb:	0f 85 ff ef ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c01027d1:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01027d8:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01027db:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01027e1:	e9 18 f7 ff ff       	jmp    c0101efe <_svfprintf_r+0x8fe>
c01027e6:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c01027ec:	8d 73 ff             	lea    -0x1(%ebx),%esi
c01027ef:	85 f6                	test   %esi,%esi
c01027f1:	0f 8e f0 fc ff ff    	jle    c01024e7 <_svfprintf_r+0xee7>
c01027f7:	83 fe 10             	cmp    $0x10,%esi
c01027fa:	7e 70                	jle    c010286c <_svfprintf_r+0x126c>
c01027fc:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102802:	eb 0c                	jmp    c0102810 <_svfprintf_r+0x1210>
c0102804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102808:	83 ee 10             	sub    $0x10,%esi
c010280b:	83 fe 10             	cmp    $0x10,%esi
c010280e:	7e 5c                	jle    c010286c <_svfprintf_r+0x126c>
c0102810:	83 c0 01             	add    $0x1,%eax
c0102813:	83 c2 10             	add    $0x10,%edx
c0102816:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c010281c:	83 c7 08             	add    $0x8,%edi
c010281f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102826:	83 f8 07             	cmp    $0x7,%eax
c0102829:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010282f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102835:	7e d1                	jle    c0102808 <_svfprintf_r+0x1208>
c0102837:	8b 45 0c             	mov    0xc(%ebp),%eax
c010283a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010283e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102842:	8b 45 08             	mov    0x8(%ebp),%eax
c0102845:	89 04 24             	mov    %eax,(%esp)
c0102848:	e8 33 39 00 00       	call   c0106180 <__ssprint_r>
c010284d:	85 c0                	test   %eax,%eax
c010284f:	0f 85 7b ef ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102855:	83 ee 10             	sub    $0x10,%esi
c0102858:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010285e:	83 fe 10             	cmp    $0x10,%esi
c0102861:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102867:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010286a:	7f a4                	jg     c0102810 <_svfprintf_r+0x1210>
c010286c:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c0102872:	01 f2                	add    %esi,%edx
c0102874:	89 77 04             	mov    %esi,0x4(%edi)
c0102877:	e9 50 fc ff ff       	jmp    c01024cc <_svfprintf_r+0xecc>
c010287c:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c0102882:	01 f1                	add    %esi,%ecx
c0102884:	89 77 04             	mov    %esi,0x4(%edi)
c0102887:	e9 6f fc ff ff       	jmp    c01024fb <_svfprintf_r+0xefb>
c010288c:	8b 45 14             	mov    0x14(%ebp),%eax
c010288f:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
c0102895:	8b 00                	mov    (%eax),%eax
c0102897:	89 10                	mov    %edx,(%eax)
c0102899:	8b 45 14             	mov    0x14(%ebp),%eax
c010289c:	83 c0 04             	add    $0x4,%eax
c010289f:	89 45 14             	mov    %eax,0x14(%ebp)
c01028a2:	e9 f4 ed ff ff       	jmp    c010169b <_svfprintf_r+0x9b>
c01028a7:	83 c0 01             	add    $0x1,%eax
c01028aa:	01 f1                	add    %esi,%ecx
c01028ac:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c01028b2:	83 c7 08             	add    $0x8,%edi
c01028b5:	89 77 fc             	mov    %esi,-0x4(%edi)
c01028b8:	83 f8 07             	cmp    $0x7,%eax
c01028bb:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01028c1:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01028c7:	7e 2d                	jle    c01028f6 <_svfprintf_r+0x12f6>
c01028c9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01028cf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01028d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028d6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01028da:	8b 45 08             	mov    0x8(%ebp),%eax
c01028dd:	89 04 24             	mov    %eax,(%esp)
c01028e0:	e8 9b 38 00 00       	call   c0106180 <__ssprint_r>
c01028e5:	85 c0                	test   %eax,%eax
c01028e7:	0f 85 e3 ee ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c01028ed:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01028f3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01028f6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01028fc:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
c0102902:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
c0102908:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
c010290e:	89 c6                	mov    %eax,%esi
c0102910:	7c 0d                	jl     c010291f <_svfprintf_r+0x131f>
c0102912:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102919:	0f 84 5e 05 00 00    	je     c0102e7d <_svfprintf_r+0x187d>
c010291f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102925:	89 07                	mov    %eax,(%edi)
c0102927:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010292d:	01 c1                	add    %eax,%ecx
c010292f:	89 47 04             	mov    %eax,0x4(%edi)
c0102932:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102938:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010293e:	83 c0 01             	add    $0x1,%eax
c0102941:	83 f8 07             	cmp    $0x7,%eax
c0102944:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010294a:	0f 8f d9 06 00 00    	jg     c0103029 <_svfprintf_r+0x1a29>
c0102950:	83 c7 08             	add    $0x8,%edi
c0102953:	89 d0                	mov    %edx,%eax
c0102955:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010295b:	89 f2                	mov    %esi,%edx
c010295d:	29 f3                	sub    %esi,%ebx
c010295f:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c0102965:	29 c6                	sub    %eax,%esi
c0102967:	39 de                	cmp    %ebx,%esi
c0102969:	0f 4e de             	cmovle %esi,%ebx
c010296c:	85 db                	test   %ebx,%ebx
c010296e:	7e 29                	jle    c0102999 <_svfprintf_r+0x1399>
c0102970:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102976:	01 d9                	add    %ebx,%ecx
c0102978:	83 c7 08             	add    $0x8,%edi
c010297b:	89 57 f8             	mov    %edx,-0x8(%edi)
c010297e:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102981:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102987:	83 c0 01             	add    $0x1,%eax
c010298a:	83 f8 07             	cmp    $0x7,%eax
c010298d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102993:	0f 8f c8 06 00 00    	jg     c0103061 <_svfprintf_r+0x1a61>
c0102999:	31 c0                	xor    %eax,%eax
c010299b:	85 db                	test   %ebx,%ebx
c010299d:	0f 49 c3             	cmovns %ebx,%eax
c01029a0:	29 c6                	sub    %eax,%esi
c01029a2:	85 f6                	test   %esi,%esi
c01029a4:	0f 8e 02 f7 ff ff    	jle    c01020ac <_svfprintf_r+0xaac>
c01029aa:	83 fe 10             	cmp    $0x10,%esi
c01029ad:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01029b3:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01029b9:	7f 11                	jg     c01029cc <_svfprintf_r+0x13cc>
c01029bb:	e9 bc fe ff ff       	jmp    c010287c <_svfprintf_r+0x127c>
c01029c0:	83 ee 10             	sub    $0x10,%esi
c01029c3:	83 fe 10             	cmp    $0x10,%esi
c01029c6:	0f 8e b0 fe ff ff    	jle    c010287c <_svfprintf_r+0x127c>
c01029cc:	83 c0 01             	add    $0x1,%eax
c01029cf:	83 c1 10             	add    $0x10,%ecx
c01029d2:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c01029d8:	83 c7 08             	add    $0x8,%edi
c01029db:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01029e2:	83 f8 07             	cmp    $0x7,%eax
c01029e5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01029eb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01029f1:	7e cd                	jle    c01029c0 <_svfprintf_r+0x13c0>
c01029f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029f6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01029fa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01029fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a01:	89 04 24             	mov    %eax,(%esp)
c0102a04:	e8 77 37 00 00       	call   c0106180 <__ssprint_r>
c0102a09:	85 c0                	test   %eax,%eax
c0102a0b:	0f 85 bf ed ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102a11:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102a17:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102a1a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a20:	eb 9e                	jmp    c01029c0 <_svfprintf_r+0x13c0>
c0102a22:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102a29:	0f 85 14 fa ff ff    	jne    c0102443 <_svfprintf_r+0xe43>
c0102a2f:	89 07                	mov    %eax,(%edi)
c0102a31:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a37:	8d 51 01             	lea    0x1(%ecx),%edx
c0102a3a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102a41:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102a47:	83 c0 01             	add    $0x1,%eax
c0102a4a:	83 f8 07             	cmp    $0x7,%eax
c0102a4d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a53:	0f 8e 8b fa ff ff    	jle    c01024e4 <_svfprintf_r+0xee4>
c0102a59:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102a5f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a66:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102a6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a6d:	89 04 24             	mov    %eax,(%esp)
c0102a70:	e8 0b 37 00 00       	call   c0106180 <__ssprint_r>
c0102a75:	85 c0                	test   %eax,%eax
c0102a77:	0f 85 53 ed ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102a7d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102a83:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102a86:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a8c:	e9 56 fa ff ff       	jmp    c01024e7 <_svfprintf_r+0xee7>
c0102a91:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102a97:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102aa2:	8b 45 08             	mov    0x8(%ebp),%eax
c0102aa5:	89 04 24             	mov    %eax,(%esp)
c0102aa8:	e8 d3 36 00 00       	call   c0106180 <__ssprint_r>
c0102aad:	85 c0                	test   %eax,%eax
c0102aaf:	0f 85 1b ed ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102ab5:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102abb:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102abe:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102ac4:	e9 d6 f9 ff ff       	jmp    c010249f <_svfprintf_r+0xe9f>
c0102ac9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102acf:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ad6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ada:	8b 45 08             	mov    0x8(%ebp),%eax
c0102add:	89 04 24             	mov    %eax,(%esp)
c0102ae0:	e8 9b 36 00 00       	call   c0106180 <__ssprint_r>
c0102ae5:	85 c0                	test   %eax,%eax
c0102ae7:	0f 85 e3 ec ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102aed:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102af3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102af6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102afc:	e9 6f f9 ff ff       	jmp    c0102470 <_svfprintf_r+0xe70>
c0102b01:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102b07:	dd 1c 24             	fstpl  (%esp)
c0102b0a:	e8 11 35 00 00       	call   c0106020 <__fpclassifyd>
c0102b0f:	85 c0                	test   %eax,%eax
c0102b11:	0f 85 a3 01 00 00    	jne    c0102cba <_svfprintf_r+0x16ba>
c0102b17:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c0102b1e:	ba 06 81 10 c0       	mov    $0xc0108106,%edx
c0102b23:	b8 0a 81 10 c0       	mov    $0xc010810a,%eax
c0102b28:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102b2f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0102b36:	00 00 00 
c0102b39:	0f 4e c2             	cmovle %edx,%eax
c0102b3c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102b42:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0102b49:	ff ff ff 
c0102b4c:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0102b53:	00 00 00 
c0102b56:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102b5d:	00 00 00 
c0102b60:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0102b67:	00 00 00 
c0102b6a:	e9 29 ed ff ff       	jmp    c0101898 <_svfprintf_r+0x298>
c0102b6f:	dd 00                	fldl   (%eax)
c0102b71:	83 c0 08             	add    $0x8,%eax
c0102b74:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0102b7a:	89 45 14             	mov    %eax,0x14(%ebp)
c0102b7d:	e9 e6 ef ff ff       	jmp    c0101b68 <_svfprintf_r+0x568>
c0102b82:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102b88:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102b8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102b93:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b96:	89 04 24             	mov    %eax,(%esp)
c0102b99:	e8 e2 35 00 00       	call   c0106180 <__ssprint_r>
c0102b9e:	85 c0                	test   %eax,%eax
c0102ba0:	0f 85 2a ec ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102ba6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102bac:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102baf:	e9 6b f6 ff ff       	jmp    c010221f <_svfprintf_r+0xc1f>
c0102bb4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102bba:	83 c1 01             	add    $0x1,%ecx
c0102bbd:	83 c7 08             	add    $0x8,%edi
c0102bc0:	c7 47 f8 37 81 10 c0 	movl   $0xc0108137,-0x8(%edi)
c0102bc7:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102bce:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102bd4:	83 c0 01             	add    $0x1,%eax
c0102bd7:	83 f8 07             	cmp    $0x7,%eax
c0102bda:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102be0:	0f 8f ef 02 00 00    	jg     c0102ed5 <_svfprintf_r+0x18d5>
c0102be6:	85 db                	test   %ebx,%ebx
c0102be8:	75 17                	jne    c0102c01 <_svfprintf_r+0x1601>
c0102bea:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
c0102bf0:	85 d2                	test   %edx,%edx
c0102bf2:	75 0d                	jne    c0102c01 <_svfprintf_r+0x1601>
c0102bf4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102bfb:	0f 84 ab f4 ff ff    	je     c01020ac <_svfprintf_r+0xaac>
c0102c01:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102c07:	83 c7 08             	add    $0x8,%edi
c0102c0a:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102c0d:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0102c13:	89 47 fc             	mov    %eax,-0x4(%edi)
c0102c16:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c0102c19:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c1f:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102c25:	83 c0 01             	add    $0x1,%eax
c0102c28:	83 f8 07             	cmp    $0x7,%eax
c0102c2b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c31:	0f 8f 60 03 00 00    	jg     c0102f97 <_svfprintf_r+0x1997>
c0102c37:	f7 db                	neg    %ebx
c0102c39:	85 db                	test   %ebx,%ebx
c0102c3b:	0f 8e 21 03 00 00    	jle    c0102f62 <_svfprintf_r+0x1962>
c0102c41:	83 fb 10             	cmp    $0x10,%ebx
c0102c44:	0f 8e c3 02 00 00    	jle    c0102f0d <_svfprintf_r+0x190d>
c0102c4a:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
c0102c50:	eb 12                	jmp    c0102c64 <_svfprintf_r+0x1664>
c0102c52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102c58:	83 eb 10             	sub    $0x10,%ebx
c0102c5b:	83 fb 10             	cmp    $0x10,%ebx
c0102c5e:	0f 8e a9 02 00 00    	jle    c0102f0d <_svfprintf_r+0x190d>
c0102c64:	83 c0 01             	add    $0x1,%eax
c0102c67:	83 c2 10             	add    $0x10,%edx
c0102c6a:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c0102c70:	83 c7 08             	add    $0x8,%edi
c0102c73:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102c7a:	83 f8 07             	cmp    $0x7,%eax
c0102c7d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102c83:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c89:	7e cd                	jle    c0102c58 <_svfprintf_r+0x1658>
c0102c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c8e:	89 74 24 08          	mov    %esi,0x8(%esp)
c0102c92:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c96:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c99:	89 04 24             	mov    %eax,(%esp)
c0102c9c:	e8 df 34 00 00       	call   c0106180 <__ssprint_r>
c0102ca1:	85 c0                	test   %eax,%eax
c0102ca3:	0f 85 27 eb ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102ca9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102caf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102cb2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102cb8:	eb 9e                	jmp    c0102c58 <_svfprintf_r+0x1658>
c0102cba:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
c0102cc0:	83 e3 df             	and    $0xffffffdf,%ebx
c0102cc3:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
c0102cca:	0f 84 05 03 00 00    	je     c0102fd5 <_svfprintf_r+0x19d5>
c0102cd0:	83 fb 47             	cmp    $0x47,%ebx
c0102cd3:	75 16                	jne    c0102ceb <_svfprintf_r+0x16eb>
c0102cd5:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0102cdb:	b8 01 00 00 00       	mov    $0x1,%eax
c0102ce0:	85 d2                	test   %edx,%edx
c0102ce2:	0f 45 c2             	cmovne %edx,%eax
c0102ce5:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102ceb:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102cf1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102cf7:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
c0102cfd:	80 cc 01             	or     $0x1,%ah
c0102d00:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
c0102d06:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0102d0c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
c0102d13:	85 c0                	test   %eax,%eax
c0102d15:	0f 88 ba 05 00 00    	js     c01032d5 <_svfprintf_r+0x1cd5>
c0102d1b:	83 fb 46             	cmp    $0x46,%ebx
c0102d1e:	0f 94 c0             	sete   %al
c0102d21:	89 c6                	mov    %eax,%esi
c0102d23:	0f 84 d4 03 00 00    	je     c01030fd <_svfprintf_r+0x1afd>
c0102d29:	83 fb 45             	cmp    $0x45,%ebx
c0102d2c:	0f 85 99 05 00 00    	jne    c01032cb <_svfprintf_r+0x1ccb>
c0102d32:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0102d38:	dd 54 24 04          	fstl   0x4(%esp)
c0102d3c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0102d43:	00 
c0102d44:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0102d4a:	8d 70 01             	lea    0x1(%eax),%esi
c0102d4d:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0102d53:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c0102d57:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0102d5d:	89 44 24 18          	mov    %eax,0x18(%esp)
c0102d61:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c0102d67:	89 44 24 14          	mov    %eax,0x14(%esp)
c0102d6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d6e:	89 74 24 10          	mov    %esi,0x10(%esp)
c0102d72:	89 04 24             	mov    %eax,(%esp)
c0102d75:	e8 56 09 00 00       	call   c01036d0 <_dtoa_r>
c0102d7a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102d80:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
c0102d83:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0102d89:	d9 ee                	fldz   
c0102d8b:	d9 c9                	fxch   %st(1)
c0102d8d:	df e9                	fucomip %st(1),%st
c0102d8f:	dd d8                	fstp   %st(0)
c0102d91:	0f 8a fd 00 00 00    	jp     c0102e94 <_svfprintf_r+0x1894>
c0102d97:	89 c8                	mov    %ecx,%eax
c0102d99:	0f 85 f5 00 00 00    	jne    c0102e94 <_svfprintf_r+0x1894>
c0102d9f:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0102da5:	83 fb 47             	cmp    $0x47,%ebx
c0102da8:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c0102dae:	0f 84 1e 04 00 00    	je     c01031d2 <_svfprintf_r+0x1bd2>
c0102db4:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c0102dbb:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0102dc1:	0f 8e 65 04 00 00    	jle    c010322c <_svfprintf_r+0x1c2c>
c0102dc7:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
c0102dce:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c0102dd4:	0f 84 3c 05 00 00    	je     c0103316 <_svfprintf_r+0x1d16>
c0102dda:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
c0102de0:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
c0102de6:	0f 8f f7 04 00 00    	jg     c01032e3 <_svfprintf_r+0x1ce3>
c0102dec:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0102df2:	83 e0 01             	and    $0x1,%eax
c0102df5:	0f 85 e2 05 00 00    	jne    c01033dd <_svfprintf_r+0x1ddd>
c0102dfb:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0102e01:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0102e08:	00 00 00 
c0102e0b:	85 d2                	test   %edx,%edx
c0102e0d:	0f 49 c2             	cmovns %edx,%eax
c0102e10:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0102e16:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
c0102e1d:	0f 85 68 03 00 00    	jne    c010318b <_svfprintf_r+0x1b8b>
c0102e23:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0102e29:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0102e2f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102e36:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102e3d:	00 00 00 
c0102e40:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0102e46:	e9 4d ea ff ff       	jmp    c0101898 <_svfprintf_r+0x298>
c0102e4b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102e51:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102e55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102e58:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102e5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102e5f:	89 04 24             	mov    %eax,(%esp)
c0102e62:	e8 19 33 00 00       	call   c0106180 <__ssprint_r>
c0102e67:	85 c0                	test   %eax,%eax
c0102e69:	0f 85 61 e9 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102e6f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102e75:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102e78:	e9 f2 f3 ff ff       	jmp    c010226f <_svfprintf_r+0xc6f>
c0102e7d:	89 d0                	mov    %edx,%eax
c0102e7f:	e9 d1 fa ff ff       	jmp    c0102955 <_svfprintf_r+0x1355>
c0102e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102e88:	8d 50 01             	lea    0x1(%eax),%edx
c0102e8b:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
c0102e91:	c6 00 30             	movb   $0x30,(%eax)
c0102e94:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0102e9a:	39 c1                	cmp    %eax,%ecx
c0102e9c:	77 ea                	ja     c0102e88 <_svfprintf_r+0x1888>
c0102e9e:	e9 fc fe ff ff       	jmp    c0102d9f <_svfprintf_r+0x179f>
c0102ea3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ea6:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c0102ead:	00 
c0102eae:	89 04 24             	mov    %eax,(%esp)
c0102eb1:	e8 4a 1b 00 00       	call   c0104a00 <_malloc_r>
c0102eb6:	8b 55 0c             	mov    0xc(%ebp),%edx
c0102eb9:	85 c0                	test   %eax,%eax
c0102ebb:	89 02                	mov    %eax,(%edx)
c0102ebd:	89 42 10             	mov    %eax,0x10(%edx)
c0102ec0:	0f 84 15 06 00 00    	je     c01034db <_svfprintf_r+0x1edb>
c0102ec6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ec9:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0102ed0:	e9 6c e7 ff ff       	jmp    c0101641 <_svfprintf_r+0x41>
c0102ed5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102edb:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102edf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ee2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ee6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ee9:	89 04 24             	mov    %eax,(%esp)
c0102eec:	e8 8f 32 00 00       	call   c0106180 <__ssprint_r>
c0102ef1:	85 c0                	test   %eax,%eax
c0102ef3:	0f 85 d7 e8 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102ef9:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102eff:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f02:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102f08:	e9 d9 fc ff ff       	jmp    c0102be6 <_svfprintf_r+0x15e6>
c0102f0d:	83 c0 01             	add    $0x1,%eax
c0102f10:	01 da                	add    %ebx,%edx
c0102f12:	c7 07 a0 82 10 c0    	movl   $0xc01082a0,(%edi)
c0102f18:	83 c7 08             	add    $0x8,%edi
c0102f1b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102f1e:	83 f8 07             	cmp    $0x7,%eax
c0102f21:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102f27:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f2d:	7e 33                	jle    c0102f62 <_svfprintf_r+0x1962>
c0102f2f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102f35:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102f39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f3c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f43:	89 04 24             	mov    %eax,(%esp)
c0102f46:	e8 35 32 00 00       	call   c0106180 <__ssprint_r>
c0102f4b:	85 c0                	test   %eax,%eax
c0102f4d:	0f 85 7d e8 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102f53:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102f59:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f5c:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102f62:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
c0102f68:	83 c0 01             	add    $0x1,%eax
c0102f6b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f71:	89 1f                	mov    %ebx,(%edi)
c0102f73:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102f79:	01 da                	add    %ebx,%edx
c0102f7b:	83 f8 07             	cmp    $0x7,%eax
c0102f7e:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102f81:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102f87:	0f 8f 86 f5 ff ff    	jg     c0102513 <_svfprintf_r+0xf13>
c0102f8d:	83 c7 08             	add    $0x8,%edi
c0102f90:	89 d1                	mov    %edx,%ecx
c0102f92:	e9 15 f1 ff ff       	jmp    c01020ac <_svfprintf_r+0xaac>
c0102f97:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102f9d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102fa1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102fa4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fa8:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fab:	89 04 24             	mov    %eax,(%esp)
c0102fae:	e8 cd 31 00 00       	call   c0106180 <__ssprint_r>
c0102fb3:	85 c0                	test   %eax,%eax
c0102fb5:	0f 85 15 e8 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0102fbb:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102fc1:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102fc4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0102fca:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102fd0:	e9 62 fc ff ff       	jmp    c0102c37 <_svfprintf_r+0x1637>
c0102fd5:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
c0102fdc:	00 00 00 
c0102fdf:	e9 07 fd ff ff       	jmp    c0102ceb <_svfprintf_r+0x16eb>
c0102fe4:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0102fea:	89 04 24             	mov    %eax,(%esp)
c0102fed:	e8 0e 31 00 00       	call   c0106100 <strlen>
c0102ff2:	e9 6a e8 ff ff       	jmp    c0101861 <_svfprintf_r+0x261>
c0102ff7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102ffd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103001:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103004:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103008:	8b 45 08             	mov    0x8(%ebp),%eax
c010300b:	89 04 24             	mov    %eax,(%esp)
c010300e:	e8 6d 31 00 00       	call   c0106180 <__ssprint_r>
c0103013:	85 c0                	test   %eax,%eax
c0103015:	0f 85 b5 e7 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010301b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103021:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103024:	e9 76 f6 ff ff       	jmp    c010269f <_svfprintf_r+0x109f>
c0103029:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010302f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103033:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103036:	89 44 24 04          	mov    %eax,0x4(%esp)
c010303a:	8b 45 08             	mov    0x8(%ebp),%eax
c010303d:	89 04 24             	mov    %eax,(%esp)
c0103040:	e8 3b 31 00 00       	call   c0106180 <__ssprint_r>
c0103045:	85 c0                	test   %eax,%eax
c0103047:	0f 85 83 e7 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c010304d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103053:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103056:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010305c:	e9 f4 f8 ff ff       	jmp    c0102955 <_svfprintf_r+0x1355>
c0103061:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103067:	89 44 24 08          	mov    %eax,0x8(%esp)
c010306b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010306e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103072:	8b 45 08             	mov    0x8(%ebp),%eax
c0103075:	89 04 24             	mov    %eax,(%esp)
c0103078:	e8 03 31 00 00       	call   c0106180 <__ssprint_r>
c010307d:	85 c0                	test   %eax,%eax
c010307f:	0f 85 4b e7 ff ff    	jne    c01017d0 <_svfprintf_r+0x1d0>
c0103085:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c010308b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010308e:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
c0103094:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010309a:	e9 fa f8 ff ff       	jmp    c0102999 <_svfprintf_r+0x1399>
c010309f:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01030a5:	b0 06                	mov    $0x6,%al
c01030a7:	89 75 14             	mov    %esi,0x14(%ebp)
c01030aa:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01030b1:	00 00 00 
c01030b4:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01030bb:	00 00 00 
c01030be:	83 fa 06             	cmp    $0x6,%edx
c01030c1:	0f 46 c2             	cmovbe %edx,%eax
c01030c4:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c01030ca:	85 c0                	test   %eax,%eax
c01030cc:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01030d2:	c7 85 28 ff ff ff 30 	movl   $0xc0108130,-0xd8(%ebp)
c01030d9:	81 10 c0 
c01030dc:	0f 49 d0             	cmovns %eax,%edx
c01030df:	31 db                	xor    %ebx,%ebx
c01030e1:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
c01030e7:	e9 b7 e7 ff ff       	jmp    c01018a3 <_svfprintf_r+0x2a3>
c01030ec:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01030f3:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c01030f8:	e9 9d ea ff ff       	jmp    c0101b9a <_svfprintf_r+0x59a>
c01030fd:	ba 03 00 00 00       	mov    $0x3,%edx
c0103102:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0103108:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c010310c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0103112:	89 44 24 18          	mov    %eax,0x18(%esp)
c0103116:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c010311c:	89 44 24 14          	mov    %eax,0x14(%esp)
c0103120:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103126:	dd 54 24 04          	fstl   0x4(%esp)
c010312a:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010312e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0103134:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103138:	8b 45 08             	mov    0x8(%ebp),%eax
c010313b:	89 04 24             	mov    %eax,(%esp)
c010313e:	e8 8d 05 00 00       	call   c01036d0 <_dtoa_r>
c0103143:	83 fb 47             	cmp    $0x47,%ebx
c0103146:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010314c:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103152:	75 09                	jne    c010315d <_svfprintf_r+0x1b5d>
c0103154:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010315b:	74 5b                	je     c01031b8 <_svfprintf_r+0x1bb8>
c010315d:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0103163:	89 f0                	mov    %esi,%eax
c0103165:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
c010316b:	01 d1                	add    %edx,%ecx
c010316d:	84 c0                	test   %al,%al
c010316f:	0f 84 14 fc ff ff    	je     c0102d89 <_svfprintf_r+0x1789>
c0103175:	80 3a 30             	cmpb   $0x30,(%edx)
c0103178:	0f 84 37 02 00 00    	je     c01033b5 <_svfprintf_r+0x1db5>
c010317e:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103184:	01 c1                	add    %eax,%ecx
c0103186:	e9 fe fb ff ff       	jmp    c0102d89 <_svfprintf_r+0x1789>
c010318b:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103191:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0103197:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c010319c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01031a3:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01031aa:	00 00 00 
c01031ad:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c01031b3:	e9 e4 e6 ff ff       	jmp    c010189c <_svfprintf_r+0x29c>
c01031b8:	dd d8                	fstp   %st(0)
c01031ba:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01031c0:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c01031c6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01031cc:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
c01031d2:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01031d8:	83 f8 fd             	cmp    $0xfffffffd,%eax
c01031db:	7c 48                	jl     c0103225 <_svfprintf_r+0x1c25>
c01031dd:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
c01031e3:	7c 40                	jl     c0103225 <_svfprintf_r+0x1c25>
c01031e5:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c01031eb:	e9 ea fb ff ff       	jmp    c0102dda <_svfprintf_r+0x17da>
c01031f0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01031f6:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01031fd:	89 75 14             	mov    %esi,0x14(%ebp)
c0103200:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103207:	00 00 00 
c010320a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103210:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103216:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010321d:	00 00 00 
c0103220:	e9 73 e6 ff ff       	jmp    c0101898 <_svfprintf_r+0x298>
c0103225:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
c010322c:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010322f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
c0103236:	85 c9                	test   %ecx,%ecx
c0103238:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010323e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
c0103244:	0f 88 2c 02 00 00    	js     c0103476 <_svfprintf_r+0x1e76>
c010324a:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
c0103251:	83 f9 09             	cmp    $0x9,%ecx
c0103254:	0f 8f ea 00 00 00    	jg     c0103344 <_svfprintf_r+0x1d44>
c010325a:	83 c1 30             	add    $0x30,%ecx
c010325d:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
c0103264:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
c010326a:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
c0103270:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103276:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
c010327c:	29 d0                	sub    %edx,%eax
c010327e:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
c0103284:	89 da                	mov    %ebx,%edx
c0103286:	01 c2                	add    %eax,%edx
c0103288:	83 fb 01             	cmp    $0x1,%ebx
c010328b:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103291:	0f 8e 21 02 00 00    	jle    c01034b8 <_svfprintf_r+0x1eb8>
c0103297:	31 c0                	xor    %eax,%eax
c0103299:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
c01032a0:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
c01032a7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01032ae:	00 00 00 
c01032b1:	e9 60 fb ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c01032b6:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01032bc:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01032c3:	00 00 00 
c01032c6:	e9 68 e4 ff ff       	jmp    c0101733 <_svfprintf_r+0x133>
c01032cb:	ba 02 00 00 00       	mov    $0x2,%edx
c01032d0:	e9 2d fe ff ff       	jmp    c0103102 <_svfprintf_r+0x1b02>
c01032d5:	d9 e0                	fchs   
c01032d7:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
c01032de:	e9 38 fa ff ff       	jmp    c0102d1b <_svfprintf_r+0x171b>
c01032e3:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
c01032e9:	ba 01 00 00 00       	mov    $0x1,%edx
c01032ee:	85 c9                	test   %ecx,%ecx
c01032f0:	0f 8e 5a 01 00 00    	jle    c0103450 <_svfprintf_r+0x1e50>
c01032f6:	31 c0                	xor    %eax,%eax
c01032f8:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
c01032fe:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103305:	00 00 00 
c0103308:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c010330e:	0f 49 c2             	cmovns %edx,%eax
c0103311:	e9 00 fb ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c0103316:	85 c0                	test   %eax,%eax
c0103318:	0f 8e 06 01 00 00    	jle    c0103424 <_svfprintf_r+0x1e24>
c010331e:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0103324:	85 f6                	test   %esi,%esi
c0103326:	0f 85 d4 00 00 00    	jne    c0103400 <_svfprintf_r+0x1e00>
c010332c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103333:	0f 85 c7 00 00 00    	jne    c0103400 <_svfprintf_r+0x1e00>
c0103339:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c010333f:	e9 d2 fa ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c0103344:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
c010334a:	89 f3                	mov    %esi,%ebx
c010334c:	b8 67 66 66 66       	mov    $0x66666667,%eax
c0103351:	83 eb 01             	sub    $0x1,%ebx
c0103354:	f7 e9                	imul   %ecx
c0103356:	89 c8                	mov    %ecx,%eax
c0103358:	c1 f8 1f             	sar    $0x1f,%eax
c010335b:	c1 fa 02             	sar    $0x2,%edx
c010335e:	29 c2                	sub    %eax,%edx
c0103360:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0103363:	01 c0                	add    %eax,%eax
c0103365:	29 c1                	sub    %eax,%ecx
c0103367:	83 fa 09             	cmp    $0x9,%edx
c010336a:	8d 41 30             	lea    0x30(%ecx),%eax
c010336d:	89 d1                	mov    %edx,%ecx
c010336f:	88 03                	mov    %al,(%ebx)
c0103371:	7f d9                	jg     c010334c <_svfprintf_r+0x1d4c>
c0103373:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0103376:	83 c1 30             	add    $0x30,%ecx
c0103379:	39 f0                	cmp    %esi,%eax
c010337b:	88 4b ff             	mov    %cl,-0x1(%ebx)
c010337e:	0f 83 6a 01 00 00    	jae    c01034ee <_svfprintf_r+0x1eee>
c0103384:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c010338a:	eb 07                	jmp    c0103393 <_svfprintf_r+0x1d93>
c010338c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103390:	0f b6 08             	movzbl (%eax),%ecx
c0103393:	83 c0 01             	add    $0x1,%eax
c0103396:	83 c2 01             	add    $0x1,%edx
c0103399:	39 f0                	cmp    %esi,%eax
c010339b:	88 4a ff             	mov    %cl,-0x1(%edx)
c010339e:	75 f0                	jne    c0103390 <_svfprintf_r+0x1d90>
c01033a0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01033a6:	29 d8                	sub    %ebx,%eax
c01033a8:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c01033ae:	01 d0                	add    %edx,%eax
c01033b0:	e9 bb fe ff ff       	jmp    c0103270 <_svfprintf_r+0x1c70>
c01033b5:	d9 ee                	fldz   
c01033b7:	d9 c9                	fxch   %st(1)
c01033b9:	db e9                	fucomi %st(1),%st
c01033bb:	dd d9                	fstp   %st(1)
c01033bd:	7a 06                	jp     c01033c5 <_svfprintf_r+0x1dc5>
c01033bf:	0f 84 b9 fd ff ff    	je     c010317e <_svfprintf_r+0x1b7e>
c01033c5:	b8 01 00 00 00       	mov    $0x1,%eax
c01033ca:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
c01033d0:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c01033d6:	01 c1                	add    %eax,%ecx
c01033d8:	e9 ac f9 ff ff       	jmp    c0102d89 <_svfprintf_r+0x1789>
c01033dd:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c01033e3:	31 c0                	xor    %eax,%eax
c01033e5:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c01033ec:	00 00 00 
c01033ef:	83 c2 01             	add    $0x1,%edx
c01033f2:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c01033f8:	0f 49 c2             	cmovns %edx,%eax
c01033fb:	e9 16 fa ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c0103400:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103406:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c010340c:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c0103410:	89 c2                	mov    %eax,%edx
c0103412:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103418:	31 c0                	xor    %eax,%eax
c010341a:	85 d2                	test   %edx,%edx
c010341c:	0f 49 c2             	cmovns %edx,%eax
c010341f:	e9 f2 f9 ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c0103424:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010342a:	85 db                	test   %ebx,%ebx
c010342c:	75 2f                	jne    c010345d <_svfprintf_r+0x1e5d>
c010342e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103435:	75 26                	jne    c010345d <_svfprintf_r+0x1e5d>
c0103437:	b8 01 00 00 00       	mov    $0x1,%eax
c010343c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0103443:	00 00 00 
c0103446:	e9 cb f9 ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c010344b:	90                   	nop
c010344c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103450:	b2 02                	mov    $0x2,%dl
c0103452:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
c0103458:	e9 99 fe ff ff       	jmp    c01032f6 <_svfprintf_r+0x1cf6>
c010345d:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103463:	31 c0                	xor    %eax,%eax
c0103465:	83 c2 02             	add    $0x2,%edx
c0103468:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c010346e:	0f 49 c2             	cmovns %edx,%eax
c0103471:	e9 a0 f9 ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c0103476:	f7 d9                	neg    %ecx
c0103478:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
c010347f:	e9 cd fd ff ff       	jmp    c0103251 <_svfprintf_r+0x1c51>
c0103484:	8b 55 14             	mov    0x14(%ebp),%edx
c0103487:	8b 45 14             	mov    0x14(%ebp),%eax
c010348a:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0103490:	8b 12                	mov    (%edx),%edx
c0103492:	83 c0 04             	add    $0x4,%eax
c0103495:	89 45 14             	mov    %eax,0x14(%ebp)
c0103498:	85 d2                	test   %edx,%edx
c010349a:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c01034a0:	0f 89 a9 e2 ff ff    	jns    c010174f <_svfprintf_r+0x14f>
c01034a6:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c01034ad:	ff ff ff 
c01034b0:	89 c8                	mov    %ecx,%eax
c01034b2:	e9 76 e2 ff ff       	jmp    c010172d <_svfprintf_r+0x12d>
c01034b7:	90                   	nop
c01034b8:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c01034be:	83 e0 01             	and    $0x1,%eax
c01034c1:	0f 85 d0 fd ff ff    	jne    c0103297 <_svfprintf_r+0x1c97>
c01034c7:	85 d2                	test   %edx,%edx
c01034c9:	0f 49 c2             	cmovns %edx,%eax
c01034cc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01034d3:	00 00 00 
c01034d6:	e9 3b f9 ff ff       	jmp    c0102e16 <_svfprintf_r+0x1816>
c01034db:	8b 45 08             	mov    0x8(%ebp),%eax
c01034de:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01034e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01034e9:	e9 f5 e2 ff ff       	jmp    c01017e3 <_svfprintf_r+0x1e3>
c01034ee:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
c01034f4:	e9 77 fd ff ff       	jmp    c0103270 <_svfprintf_r+0x1c70>
c01034f9:	66 90                	xchg   %ax,%ax
c01034fb:	66 90                	xchg   %ax,%ax
c01034fd:	66 90                	xchg   %ax,%ax
c01034ff:	90                   	nop

c0103500 <quorem>:
c0103500:	55                   	push   %ebp
c0103501:	89 c1                	mov    %eax,%ecx
c0103503:	89 e5                	mov    %esp,%ebp
c0103505:	57                   	push   %edi
c0103506:	89 d7                	mov    %edx,%edi
c0103508:	56                   	push   %esi
c0103509:	53                   	push   %ebx
c010350a:	83 ec 3c             	sub    $0x3c,%esp
c010350d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0103510:	8b 42 10             	mov    0x10(%edx),%eax
c0103513:	3b 41 10             	cmp    0x10(%ecx),%eax
c0103516:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0103519:	89 ca                	mov    %ecx,%edx
c010351b:	0f 8f 9f 01 00 00    	jg     c01036c0 <quorem+0x1c0>
c0103521:	83 e8 01             	sub    $0x1,%eax
c0103524:	83 c7 14             	add    $0x14,%edi
c0103527:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010352a:	c1 e0 02             	shl    $0x2,%eax
c010352d:	83 c2 14             	add    $0x14,%edx
c0103530:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
c0103533:	01 d0                	add    %edx,%eax
c0103535:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0103538:	8b 13                	mov    (%ebx),%edx
c010353a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010353d:	8b 00                	mov    (%eax),%eax
c010353f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0103542:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103545:	31 d2                	xor    %edx,%edx
c0103547:	f7 f1                	div    %ecx
c0103549:	85 c0                	test   %eax,%eax
c010354b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010354e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103551:	0f 84 b5 00 00 00    	je     c010360c <quorem+0x10c>
c0103557:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010355a:	31 f6                	xor    %esi,%esi
c010355c:	89 fa                	mov    %edi,%edx
c010355e:	89 7d c0             	mov    %edi,-0x40(%ebp)
c0103561:	89 f7                	mov    %esi,%edi
c0103563:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c010356a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103570:	83 c2 04             	add    $0x4,%edx
c0103573:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103576:	83 c0 04             	add    $0x4,%eax
c0103579:	0f b7 ce             	movzwl %si,%ecx
c010357c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c0103580:	03 4d dc             	add    -0x24(%ebp),%ecx
c0103583:	c1 ee 10             	shr    $0x10,%esi
c0103586:	0f af 75 e0          	imul   -0x20(%ebp),%esi
c010358a:	89 cb                	mov    %ecx,%ebx
c010358c:	0f b7 c9             	movzwl %cx,%ecx
c010358f:	c1 eb 10             	shr    $0x10,%ebx
c0103592:	29 cf                	sub    %ecx,%edi
c0103594:	01 f3                	add    %esi,%ebx
c0103596:	89 de                	mov    %ebx,%esi
c0103598:	0f b7 db             	movzwl %bx,%ebx
c010359b:	c1 ee 10             	shr    $0x10,%esi
c010359e:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01035a1:	8b 70 fc             	mov    -0x4(%eax),%esi
c01035a4:	0f b7 ce             	movzwl %si,%ecx
c01035a7:	01 f9                	add    %edi,%ecx
c01035a9:	c1 ee 10             	shr    $0x10,%esi
c01035ac:	29 de                	sub    %ebx,%esi
c01035ae:	89 cb                	mov    %ecx,%ebx
c01035b0:	c1 fb 10             	sar    $0x10,%ebx
c01035b3:	0f b7 c9             	movzwl %cx,%ecx
c01035b6:	01 de                	add    %ebx,%esi
c01035b8:	89 f7                	mov    %esi,%edi
c01035ba:	c1 e6 10             	shl    $0x10,%esi
c01035bd:	09 ce                	or     %ecx,%esi
c01035bf:	c1 ff 10             	sar    $0x10,%edi
c01035c2:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
c01035c5:	89 70 fc             	mov    %esi,-0x4(%eax)
c01035c8:	73 a6                	jae    c0103570 <quorem+0x70>
c01035ca:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01035cd:	8b 7d c0             	mov    -0x40(%ebp),%edi
c01035d0:	8b 10                	mov    (%eax),%edx
c01035d2:	85 d2                	test   %edx,%edx
c01035d4:	75 36                	jne    c010360c <quorem+0x10c>
c01035d6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01035d9:	89 c2                	mov    %eax,%edx
c01035db:	83 e8 04             	sub    $0x4,%eax
c01035de:	39 c1                	cmp    %eax,%ecx
c01035e0:	73 21                	jae    c0103603 <quorem+0x103>
c01035e2:	8b 72 fc             	mov    -0x4(%edx),%esi
c01035e5:	85 f6                	test   %esi,%esi
c01035e7:	75 1a                	jne    c0103603 <quorem+0x103>
c01035e9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01035ec:	eb 08                	jmp    c01035f6 <quorem+0xf6>
c01035ee:	66 90                	xchg   %ax,%ax
c01035f0:	8b 18                	mov    (%eax),%ebx
c01035f2:	85 db                	test   %ebx,%ebx
c01035f4:	75 0a                	jne    c0103600 <quorem+0x100>
c01035f6:	83 e8 04             	sub    $0x4,%eax
c01035f9:	83 ea 01             	sub    $0x1,%edx
c01035fc:	39 c1                	cmp    %eax,%ecx
c01035fe:	72 f0                	jb     c01035f0 <quorem+0xf0>
c0103600:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103603:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103606:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103609:	89 50 10             	mov    %edx,0x10(%eax)
c010360c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010360f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103613:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103616:	89 04 24             	mov    %eax,(%esp)
c0103619:	e8 a2 23 00 00       	call   c01059c0 <__mcmp>
c010361e:	85 c0                	test   %eax,%eax
c0103620:	0f 88 8e 00 00 00    	js     c01036b4 <quorem+0x1b4>
c0103626:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103629:	31 f6                	xor    %esi,%esi
c010362b:	83 c0 01             	add    $0x1,%eax
c010362e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103631:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103638:	83 c7 04             	add    $0x4,%edi
c010363b:	8b 4f fc             	mov    -0x4(%edi),%ecx
c010363e:	83 c0 04             	add    $0x4,%eax
c0103641:	8b 58 fc             	mov    -0x4(%eax),%ebx
c0103644:	0f b7 d1             	movzwl %cx,%edx
c0103647:	29 d6                	sub    %edx,%esi
c0103649:	0f b7 d3             	movzwl %bx,%edx
c010364c:	01 f2                	add    %esi,%edx
c010364e:	c1 e9 10             	shr    $0x10,%ecx
c0103651:	c1 eb 10             	shr    $0x10,%ebx
c0103654:	29 cb                	sub    %ecx,%ebx
c0103656:	89 d1                	mov    %edx,%ecx
c0103658:	c1 f9 10             	sar    $0x10,%ecx
c010365b:	0f b7 d2             	movzwl %dx,%edx
c010365e:	01 cb                	add    %ecx,%ebx
c0103660:	89 de                	mov    %ebx,%esi
c0103662:	c1 e3 10             	shl    $0x10,%ebx
c0103665:	09 d3                	or     %edx,%ebx
c0103667:	c1 fe 10             	sar    $0x10,%esi
c010366a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
c010366d:	89 58 fc             	mov    %ebx,-0x4(%eax)
c0103670:	73 c6                	jae    c0103638 <quorem+0x138>
c0103672:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103675:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103678:	8d 14 b8             	lea    (%eax,%edi,4),%edx
c010367b:	8b 02                	mov    (%edx),%eax
c010367d:	85 c0                	test   %eax,%eax
c010367f:	75 33                	jne    c01036b4 <quorem+0x1b4>
c0103681:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103684:	8d 42 fc             	lea    -0x4(%edx),%eax
c0103687:	39 c1                	cmp    %eax,%ecx
c0103689:	73 20                	jae    c01036ab <quorem+0x1ab>
c010368b:	8b 72 fc             	mov    -0x4(%edx),%esi
c010368e:	85 f6                	test   %esi,%esi
c0103690:	75 19                	jne    c01036ab <quorem+0x1ab>
c0103692:	89 fa                	mov    %edi,%edx
c0103694:	eb 08                	jmp    c010369e <quorem+0x19e>
c0103696:	66 90                	xchg   %ax,%ax
c0103698:	8b 18                	mov    (%eax),%ebx
c010369a:	85 db                	test   %ebx,%ebx
c010369c:	75 0a                	jne    c01036a8 <quorem+0x1a8>
c010369e:	83 e8 04             	sub    $0x4,%eax
c01036a1:	83 ea 01             	sub    $0x1,%edx
c01036a4:	39 c1                	cmp    %eax,%ecx
c01036a6:	72 f0                	jb     c0103698 <quorem+0x198>
c01036a8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c01036ab:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01036ae:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c01036b1:	89 78 10             	mov    %edi,0x10(%eax)
c01036b4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01036b7:	83 c4 3c             	add    $0x3c,%esp
c01036ba:	5b                   	pop    %ebx
c01036bb:	5e                   	pop    %esi
c01036bc:	5f                   	pop    %edi
c01036bd:	5d                   	pop    %ebp
c01036be:	c3                   	ret    
c01036bf:	90                   	nop
c01036c0:	83 c4 3c             	add    $0x3c,%esp
c01036c3:	31 c0                	xor    %eax,%eax
c01036c5:	5b                   	pop    %ebx
c01036c6:	5e                   	pop    %esi
c01036c7:	5f                   	pop    %edi
c01036c8:	5d                   	pop    %ebp
c01036c9:	c3                   	ret    
c01036ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01036d0 <_dtoa_r>:
c01036d0:	55                   	push   %ebp
c01036d1:	89 e5                	mov    %esp,%ebp
c01036d3:	57                   	push   %edi
c01036d4:	56                   	push   %esi
c01036d5:	53                   	push   %ebx
c01036d6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
c01036dc:	8b 75 08             	mov    0x8(%ebp),%esi
c01036df:	dd 45 0c             	fldl   0xc(%ebp)
c01036e2:	8b 5d 20             	mov    0x20(%ebp),%ebx
c01036e5:	dd 5d c0             	fstpl  -0x40(%ebp)
c01036e8:	8b 46 40             	mov    0x40(%esi),%eax
c01036eb:	85 c0                	test   %eax,%eax
c01036ed:	74 23                	je     c0103712 <_dtoa_r+0x42>
c01036ef:	8b 4e 44             	mov    0x44(%esi),%ecx
c01036f2:	ba 01 00 00 00       	mov    $0x1,%edx
c01036f7:	d3 e2                	shl    %cl,%edx
c01036f9:	89 48 04             	mov    %ecx,0x4(%eax)
c01036fc:	89 50 08             	mov    %edx,0x8(%eax)
c01036ff:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103703:	89 34 24             	mov    %esi,(%esp)
c0103706:	e8 95 1b 00 00       	call   c01052a0 <_Bfree>
c010370b:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
c0103712:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0103715:	85 ff                	test   %edi,%edi
c0103717:	0f 88 3b 02 00 00    	js     c0103958 <_dtoa_r+0x288>
c010371d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0103723:	89 f8                	mov    %edi,%eax
c0103725:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
c010372a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
c010372f:	0f 84 e3 01 00 00    	je     c0103918 <_dtoa_r+0x248>
c0103735:	dd 45 c0             	fldl   -0x40(%ebp)
c0103738:	d9 ee                	fldz   
c010373a:	d9 c9                	fxch   %st(1)
c010373c:	db e9                	fucomi %st(1),%st
c010373e:	dd d9                	fstp   %st(1)
c0103740:	7a 36                	jp     c0103778 <_dtoa_r+0xa8>
c0103742:	75 34                	jne    c0103778 <_dtoa_r+0xa8>
c0103744:	dd d8                	fstp   %st(0)
c0103746:	8b 4d 24             	mov    0x24(%ebp),%ecx
c0103749:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010374c:	85 c9                	test   %ecx,%ecx
c010374e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0103754:	0f 84 4e 02 00 00    	je     c01039a8 <_dtoa_r+0x2d8>
c010375a:	8b 45 24             	mov    0x24(%ebp),%eax
c010375d:	c7 00 38 81 10 c0    	movl   $0xc0108138,(%eax)
c0103763:	b8 37 81 10 c0       	mov    $0xc0108137,%eax
c0103768:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c010376e:	5b                   	pop    %ebx
c010376f:	5e                   	pop    %esi
c0103770:	5f                   	pop    %edi
c0103771:	5d                   	pop    %ebp
c0103772:	c3                   	ret    
c0103773:	90                   	nop
c0103774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103778:	8d 45 e0             	lea    -0x20(%ebp),%eax
c010377b:	89 fb                	mov    %edi,%ebx
c010377d:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103781:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0103784:	dd 54 24 04          	fstl   0x4(%esp)
c0103788:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010378c:	dd 5d b8             	fstpl  -0x48(%ebp)
c010378f:	89 34 24             	mov    %esi,(%esp)
c0103792:	c1 eb 14             	shr    $0x14,%ebx
c0103795:	e8 76 25 00 00       	call   c0105d10 <__d2b>
c010379a:	85 db                	test   %ebx,%ebx
c010379c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010379f:	0f 85 db 01 00 00    	jne    c0103980 <_dtoa_r+0x2b0>
c01037a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01037a8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01037ab:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01037ae:	01 c3                	add    %eax,%ebx
c01037b0:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
c01037b6:	0f 8c ec 07 00 00    	jl     c0103fa8 <_dtoa_r+0x8d8>
c01037bc:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01037bf:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
c01037c4:	89 f8                	mov    %edi,%eax
c01037c6:	29 d9                	sub    %ebx,%ecx
c01037c8:	d3 e0                	shl    %cl,%eax
c01037ca:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
c01037d0:	d3 ea                	shr    %cl,%edx
c01037d2:	09 d0                	or     %edx,%eax
c01037d4:	31 d2                	xor    %edx,%edx
c01037d6:	83 eb 01             	sub    $0x1,%ebx
c01037d9:	89 55 cc             	mov    %edx,-0x34(%ebp)
c01037dc:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c01037df:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01037e2:	df 6d c8             	fildll -0x38(%ebp)
c01037e5:	dd 5d b8             	fstpl  -0x48(%ebp)
c01037e8:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
c01037ef:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c01037f6:	dd 45 b8             	fldl   -0x48(%ebp)
c01037f9:	d8 25 d0 82 10 c0    	fsubs  0xc01082d0
c01037ff:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
c0103802:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103805:	dc 0d e8 82 10 c0    	fmull  0xc01082e8
c010380b:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c010380f:	b4 0c                	mov    $0xc,%ah
c0103811:	dc 05 f0 82 10 c0    	faddl  0xc01082f0
c0103817:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c010381b:	db 45 d4             	fildl  -0x2c(%ebp)
c010381e:	dc 0d f8 82 10 c0    	fmull  0xc01082f8
c0103824:	de c1                	faddp  %st,%st(1)
c0103826:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103829:	db 55 b8             	fistl  -0x48(%ebp)
c010382c:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010382f:	d9 ee                	fldz   
c0103831:	df e9                	fucomip %st(1),%st
c0103833:	0f 87 27 07 00 00    	ja     c0103f60 <_dtoa_r+0x890>
c0103839:	dd d8                	fstp   %st(0)
c010383b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
c010383f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
c0103846:	77 24                	ja     c010386c <_dtoa_r+0x19c>
c0103848:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010384b:	dd 04 c5 c0 83 10 c0 	fldl   -0x3fef7c40(,%eax,8)
c0103852:	dd 45 c0             	fldl   -0x40(%ebp)
c0103855:	d9 c9                	fxch   %st(1)
c0103857:	df e9                	fucomip %st(1),%st
c0103859:	dd d8                	fstp   %st(0)
c010385b:	0f 86 5f 07 00 00    	jbe    c0103fc0 <_dtoa_r+0x8f0>
c0103861:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103865:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c010386c:	89 d0                	mov    %edx,%eax
c010386e:	29 d8                	sub    %ebx,%eax
c0103870:	83 e8 01             	sub    $0x1,%eax
c0103873:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
c010387a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010387d:	0f 88 0d 07 00 00    	js     c0103f90 <_dtoa_r+0x8c0>
c0103883:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103886:	85 c0                	test   %eax,%eax
c0103888:	0f 88 ea 06 00 00    	js     c0103f78 <_dtoa_r+0x8a8>
c010388e:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103891:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103894:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010389b:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
c010389f:	0f 87 0b 03 00 00    	ja     c0103bb0 <_dtoa_r+0x4e0>
c01038a5:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01038a9:	0f 8e 23 10 00 00    	jle    c01048d2 <_dtoa_r+0x1202>
c01038af:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
c01038b3:	31 c0                	xor    %eax,%eax
c01038b5:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
c01038b9:	0f 84 43 0d 00 00    	je     c0104602 <_dtoa_r+0xf32>
c01038bf:	0f 8e f3 00 00 00    	jle    c01039b8 <_dtoa_r+0x2e8>
c01038c5:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
c01038c9:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c01038d0:	0f 84 f3 00 00 00    	je     c01039c9 <_dtoa_r+0x2f9>
c01038d6:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01038da:	0f 85 d7 02 00 00    	jne    c0103bb7 <_dtoa_r+0x4e7>
c01038e0:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c01038e3:	03 5d 18             	add    0x18(%ebp),%ebx
c01038e6:	89 5d 90             	mov    %ebx,-0x70(%ebp)
c01038e9:	83 c3 01             	add    $0x1,%ebx
c01038ec:	83 fb 0e             	cmp    $0xe,%ebx
c01038ef:	0f 96 c2             	setbe  %dl
c01038f2:	85 db                	test   %ebx,%ebx
c01038f4:	89 5d a8             	mov    %ebx,-0x58(%ebp)
c01038f7:	0f 8e a7 08 00 00    	jle    c01041a4 <_dtoa_r+0xad4>
c01038fd:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103900:	83 fb 0e             	cmp    $0xe,%ebx
c0103903:	89 df                	mov    %ebx,%edi
c0103905:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0103909:	20 45 b4             	and    %al,-0x4c(%ebp)
c010390c:	e9 d6 00 00 00       	jmp    c01039e7 <_dtoa_r+0x317>
c0103911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103918:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010391b:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010391e:	85 d2                	test   %edx,%edx
c0103920:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
c0103926:	b8 c9 82 10 c0       	mov    $0xc01082c9,%eax
c010392b:	74 43                	je     c0103970 <_dtoa_r+0x2a0>
c010392d:	8b 5d 24             	mov    0x24(%ebp),%ebx
c0103930:	85 db                	test   %ebx,%ebx
c0103932:	0f 84 30 fe ff ff    	je     c0103768 <_dtoa_r+0x98>
c0103938:	8b 75 24             	mov    0x24(%ebp),%esi
c010393b:	8d 50 08             	lea    0x8(%eax),%edx
c010393e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
c0103942:	8d 48 03             	lea    0x3(%eax),%ecx
c0103945:	0f 44 d1             	cmove  %ecx,%edx
c0103948:	89 16                	mov    %edx,(%esi)
c010394a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103950:	5b                   	pop    %ebx
c0103951:	5e                   	pop    %esi
c0103952:	5f                   	pop    %edi
c0103953:	5d                   	pop    %ebp
c0103954:	c3                   	ret    
c0103955:	8d 76 00             	lea    0x0(%esi),%esi
c0103958:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
c010395e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
c0103964:	89 7d c4             	mov    %edi,-0x3c(%ebp)
c0103967:	e9 b7 fd ff ff       	jmp    c0103723 <_dtoa_r+0x53>
c010396c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103970:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
c0103976:	ba c0 82 10 c0       	mov    $0xc01082c0,%edx
c010397b:	0f 44 c2             	cmove  %edx,%eax
c010397e:	eb ad                	jmp    c010392d <_dtoa_r+0x25d>
c0103980:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0103983:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
c0103989:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010398c:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0103993:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0103998:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
c010399d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01039a0:	e9 51 fe ff ff       	jmp    c01037f6 <_dtoa_r+0x126>
c01039a5:	8d 76 00             	lea    0x0(%esi),%esi
c01039a8:	b8 37 81 10 c0       	mov    $0xc0108137,%eax
c01039ad:	e9 b6 fd ff ff       	jmp    c0103768 <_dtoa_r+0x98>
c01039b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01039b8:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c01039bc:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01039c3:	0f 85 ee 01 00 00    	jne    c0103bb7 <_dtoa_r+0x4e7>
c01039c9:	8b 55 18             	mov    0x18(%ebp),%edx
c01039cc:	85 d2                	test   %edx,%edx
c01039ce:	0f 8e b6 07 00 00    	jle    c010418a <_dtoa_r+0xaba>
c01039d4:	8b 7d 18             	mov    0x18(%ebp),%edi
c01039d7:	83 ff 0e             	cmp    $0xe,%edi
c01039da:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c01039de:	20 45 b4             	and    %al,-0x4c(%ebp)
c01039e1:	89 7d 90             	mov    %edi,-0x70(%ebp)
c01039e4:	89 7d a8             	mov    %edi,-0x58(%ebp)
c01039e7:	83 ff 17             	cmp    $0x17,%edi
c01039ea:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01039f1:	0f 86 e5 0e 00 00    	jbe    c01048dc <_dtoa_r+0x120c>
c01039f7:	b9 01 00 00 00       	mov    $0x1,%ecx
c01039fc:	b8 04 00 00 00       	mov    $0x4,%eax
c0103a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103a08:	01 c0                	add    %eax,%eax
c0103a0a:	89 ca                	mov    %ecx,%edx
c0103a0c:	8d 58 14             	lea    0x14(%eax),%ebx
c0103a0f:	39 fb                	cmp    %edi,%ebx
c0103a11:	8d 49 01             	lea    0x1(%ecx),%ecx
c0103a14:	76 f2                	jbe    c0103a08 <_dtoa_r+0x338>
c0103a16:	89 56 44             	mov    %edx,0x44(%esi)
c0103a19:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103a1d:	89 34 24             	mov    %esi,(%esp)
c0103a20:	e8 db 17 00 00       	call   c0105200 <_Balloc>
c0103a25:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
c0103a29:	89 c7                	mov    %eax,%edi
c0103a2b:	89 46 40             	mov    %eax,0x40(%esi)
c0103a2e:	0f 84 bb 01 00 00    	je     c0103bef <_dtoa_r+0x51f>
c0103a34:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0103a37:	dd 45 c0             	fldl   -0x40(%ebp)
c0103a3a:	85 db                	test   %ebx,%ebx
c0103a3c:	0f 8e de 07 00 00    	jle    c0104220 <_dtoa_r+0xb50>
c0103a42:	89 d8                	mov    %ebx,%eax
c0103a44:	83 e0 0f             	and    $0xf,%eax
c0103a47:	dd 04 c5 c0 83 10 c0 	fldl   -0x3fef7c40(,%eax,8)
c0103a4e:	89 d8                	mov    %ebx,%eax
c0103a50:	c1 f8 04             	sar    $0x4,%eax
c0103a53:	a8 10                	test   $0x10,%al
c0103a55:	0f 84 cd 05 00 00    	je     c0104028 <_dtoa_r+0x958>
c0103a5b:	dd 05 a0 83 10 c0    	fldl   0xc01083a0
c0103a61:	83 e0 0f             	and    $0xf,%eax
c0103a64:	b9 03 00 00 00       	mov    $0x3,%ecx
c0103a69:	d8 fa                	fdivr  %st(2),%st
c0103a6b:	85 c0                	test   %eax,%eax
c0103a6d:	74 22                	je     c0103a91 <_dtoa_r+0x3c1>
c0103a6f:	31 d2                	xor    %edx,%edx
c0103a71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103a78:	a8 01                	test   $0x1,%al
c0103a7a:	74 0e                	je     c0103a8a <_dtoa_r+0x3ba>
c0103a7c:	d9 c9                	fxch   %st(1)
c0103a7e:	dc 0c d5 80 83 10 c0 	fmull  -0x3fef7c80(,%edx,8)
c0103a85:	d9 c9                	fxch   %st(1)
c0103a87:	83 c1 01             	add    $0x1,%ecx
c0103a8a:	83 c2 01             	add    $0x1,%edx
c0103a8d:	d1 f8                	sar    %eax
c0103a8f:	75 e7                	jne    c0103a78 <_dtoa_r+0x3a8>
c0103a91:	de f1                	fdivp  %st,%st(1)
c0103a93:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103a96:	85 c0                	test   %eax,%eax
c0103a98:	74 0a                	je     c0103aa4 <_dtoa_r+0x3d4>
c0103a9a:	d9 e8                	fld1   
c0103a9c:	df e9                	fucomip %st(1),%st
c0103a9e:	0f 87 92 0b 00 00    	ja     c0104636 <_dtoa_r+0xf66>
c0103aa4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0103aa7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103aaa:	db 45 d4             	fildl  -0x2c(%ebp)
c0103aad:	d8 c9                	fmul   %st(1),%st
c0103aaf:	d8 05 dc 82 10 c0    	fadds  0xc01082dc
c0103ab5:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103ab8:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0103abf:	85 c0                	test   %eax,%eax
c0103ac1:	0f 84 89 05 00 00    	je     c0104050 <_dtoa_r+0x980>
c0103ac7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103aca:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0103acd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103ad0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103ad3:	85 c0                	test   %eax,%eax
c0103ad5:	0f 84 b5 07 00 00    	je     c0104290 <_dtoa_r+0xbc0>
c0103adb:	d9 05 e4 82 10 c0    	flds   0xc01082e4
c0103ae1:	8d 57 01             	lea    0x1(%edi),%edx
c0103ae4:	dc 34 cd b8 83 10 c0 	fdivl  -0x3fef7c48(,%ecx,8)
c0103aeb:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103aee:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103af2:	b4 0c                	mov    $0xc,%ah
c0103af4:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103af8:	dc 65 c0             	fsubl  -0x40(%ebp)
c0103afb:	d9 c9                	fxch   %st(1)
c0103afd:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103b00:	db 55 d4             	fistl  -0x2c(%ebp)
c0103b03:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103b06:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b09:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103b0c:	83 c0 30             	add    $0x30,%eax
c0103b0f:	db 45 d4             	fildl  -0x2c(%ebp)
c0103b12:	de e9                	fsubrp %st,%st(1)
c0103b14:	d9 c9                	fxch   %st(1)
c0103b16:	88 07                	mov    %al,(%edi)
c0103b18:	db e9                	fucomi %st(1),%st
c0103b1a:	77 7f                	ja     c0103b9b <_dtoa_r+0x4cb>
c0103b1c:	d9 c1                	fld    %st(1)
c0103b1e:	d8 2d d4 82 10 c0    	fsubrs 0xc01082d4
c0103b24:	d9 c9                	fxch   %st(1)
c0103b26:	db e9                	fucomi %st(1),%st
c0103b28:	dd d9                	fstp   %st(1)
c0103b2a:	0f 87 33 0c 00 00    	ja     c0104763 <_dtoa_r+0x1093>
c0103b30:	83 f9 01             	cmp    $0x1,%ecx
c0103b33:	0f 8e c4 06 00 00    	jle    c01041fd <_dtoa_r+0xb2d>
c0103b39:	01 f9                	add    %edi,%ecx
c0103b3b:	d9 05 d8 82 10 c0    	flds   0xc01082d8
c0103b41:	eb 25                	jmp    c0103b68 <_dtoa_r+0x498>
c0103b43:	90                   	nop
c0103b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103b48:	d9 c1                	fld    %st(1)
c0103b4a:	d8 2d d4 82 10 c0    	fsubrs 0xc01082d4
c0103b50:	d9 c9                	fxch   %st(1)
c0103b52:	db e9                	fucomi %st(1),%st
c0103b54:	dd d9                	fstp   %st(1)
c0103b56:	0f 87 14 0c 00 00    	ja     c0104770 <_dtoa_r+0x10a0>
c0103b5c:	39 ca                	cmp    %ecx,%edx
c0103b5e:	0f 84 a4 06 00 00    	je     c0104208 <_dtoa_r+0xb38>
c0103b64:	d9 c9                	fxch   %st(1)
c0103b66:	d9 ca                	fxch   %st(2)
c0103b68:	dc c9                	fmul   %st,%st(1)
c0103b6a:	83 c2 01             	add    $0x1,%edx
c0103b6d:	dc ca                	fmul   %st,%st(2)
c0103b6f:	d9 ca                	fxch   %st(2)
c0103b71:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103b74:	db 55 d4             	fistl  -0x2c(%ebp)
c0103b77:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103b7a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b7d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103b80:	83 c0 30             	add    $0x30,%eax
c0103b83:	db 45 d4             	fildl  -0x2c(%ebp)
c0103b86:	de e9                	fsubrp %st,%st(1)
c0103b88:	d9 c9                	fxch   %st(1)
c0103b8a:	88 42 ff             	mov    %al,-0x1(%edx)
c0103b8d:	db e9                	fucomi %st(1),%st
c0103b8f:	76 b7                	jbe    c0103b48 <_dtoa_r+0x478>
c0103b91:	dd d8                	fstp   %st(0)
c0103b93:	dd d8                	fstp   %st(0)
c0103b95:	dd d8                	fstp   %st(0)
c0103b97:	dd d8                	fstp   %st(0)
c0103b99:	eb 06                	jmp    c0103ba1 <_dtoa_r+0x4d1>
c0103b9b:	dd d8                	fstp   %st(0)
c0103b9d:	dd d8                	fstp   %st(0)
c0103b9f:	dd d8                	fstp   %st(0)
c0103ba1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103ba4:	89 fb                	mov    %edi,%ebx
c0103ba6:	89 d7                	mov    %edx,%edi
c0103ba8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103bab:	e9 70 03 00 00       	jmp    c0103f20 <_dtoa_r+0x850>
c0103bb0:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
c0103bb7:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c0103bbe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0103bc5:	00 
c0103bc6:	89 34 24             	mov    %esi,(%esp)
c0103bc9:	e8 32 16 00 00       	call   c0105200 <_Balloc>
c0103bce:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c0103bd5:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
c0103bdc:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
c0103be3:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
c0103bea:	89 c7                	mov    %eax,%edi
c0103bec:	89 46 40             	mov    %eax,0x40(%esi)
c0103bef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103bf2:	85 c0                	test   %eax,%eax
c0103bf4:	0f 88 2e 01 00 00    	js     c0103d28 <_dtoa_r+0x658>
c0103bfa:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
c0103bfe:	0f 8f 24 01 00 00    	jg     c0103d28 <_dtoa_r+0x658>
c0103c04:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103c07:	dd 04 c5 c0 83 10 c0 	fldl   -0x3fef7c40(,%eax,8)
c0103c0e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103c11:	85 c0                	test   %eax,%eax
c0103c13:	7f 0e                	jg     c0103c23 <_dtoa_r+0x553>
c0103c15:	8b 45 18             	mov    0x18(%ebp),%eax
c0103c18:	c1 e8 1f             	shr    $0x1f,%eax
c0103c1b:	84 c0                	test   %al,%al
c0103c1d:	0f 85 9d 07 00 00    	jne    c01043c0 <_dtoa_r+0xcf0>
c0103c23:	dd 45 c0             	fldl   -0x40(%ebp)
c0103c26:	d9 c0                	fld    %st(0)
c0103c28:	d8 f2                	fdiv   %st(2),%st
c0103c2a:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0103c2d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
c0103c31:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0103c35:	b4 0c                	mov    $0xc,%ah
c0103c37:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0103c3b:	8d 47 01             	lea    0x1(%edi),%eax
c0103c3e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103c41:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103c44:	db 5d d4             	fistpl -0x2c(%ebp)
c0103c47:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103c4a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103c4d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103c50:	8d 42 30             	lea    0x30(%edx),%eax
c0103c53:	db 45 d4             	fildl  -0x2c(%ebp)
c0103c56:	d8 ca                	fmul   %st(2),%st
c0103c58:	88 07                	mov    %al,(%edi)
c0103c5a:	de e9                	fsubrp %st,%st(1)
c0103c5c:	74 66                	je     c0103cc4 <_dtoa_r+0x5f4>
c0103c5e:	d8 0d d8 82 10 c0    	fmuls  0xc01082d8
c0103c64:	d9 ee                	fldz   
c0103c66:	d9 c9                	fxch   %st(1)
c0103c68:	db e9                	fucomi %st(1),%st
c0103c6a:	dd d9                	fstp   %st(1)
c0103c6c:	0f 8b 33 0c 00 00    	jnp    c01048a5 <_dtoa_r+0x11d5>
c0103c72:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0103c75:	8d 47 02             	lea    0x2(%edi),%eax
c0103c78:	d9 05 d8 82 10 c0    	flds   0xc01082d8
c0103c7e:	01 fb                	add    %edi,%ebx
c0103c80:	eb 19                	jmp    c0103c9b <_dtoa_r+0x5cb>
c0103c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103c88:	dc c9                	fmul   %st,%st(1)
c0103c8a:	83 c0 01             	add    $0x1,%eax
c0103c8d:	d9 ee                	fldz   
c0103c8f:	d9 ca                	fxch   %st(2)
c0103c91:	db ea                	fucomi %st(2),%st
c0103c93:	dd da                	fstp   %st(2)
c0103c95:	0f 8b 73 09 00 00    	jnp    c010460e <_dtoa_r+0xf3e>
c0103c9b:	d9 c1                	fld    %st(1)
c0103c9d:	39 d8                	cmp    %ebx,%eax
c0103c9f:	d8 f3                	fdiv   %st(3),%st
c0103ca1:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103ca4:	d9 6d d0             	fldcw  -0x30(%ebp)
c0103ca7:	db 5d d4             	fistpl -0x2c(%ebp)
c0103caa:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0103cad:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103cb0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103cb3:	8d 4a 30             	lea    0x30(%edx),%ecx
c0103cb6:	db 45 d4             	fildl  -0x2c(%ebp)
c0103cb9:	d8 cb                	fmul   %st(3),%st
c0103cbb:	88 48 ff             	mov    %cl,-0x1(%eax)
c0103cbe:	de ea                	fsubrp %st,%st(2)
c0103cc0:	75 c6                	jne    c0103c88 <_dtoa_r+0x5b8>
c0103cc2:	dd d8                	fstp   %st(0)
c0103cc4:	d8 c0                	fadd   %st(0),%st
c0103cc6:	db e9                	fucomi %st(1),%st
c0103cc8:	77 1e                	ja     c0103ce8 <_dtoa_r+0x618>
c0103cca:	d9 c9                	fxch   %st(1)
c0103ccc:	df e9                	fucomip %st(1),%st
c0103cce:	dd d8                	fstp   %st(0)
c0103cd0:	0f 8a 44 09 00 00    	jp     c010461a <_dtoa_r+0xf4a>
c0103cd6:	0f 85 3e 09 00 00    	jne    c010461a <_dtoa_r+0xf4a>
c0103cdc:	83 e2 01             	and    $0x1,%edx
c0103cdf:	90                   	nop
c0103ce0:	0f 84 34 09 00 00    	je     c010461a <_dtoa_r+0xf4a>
c0103ce6:	eb 04                	jmp    c0103cec <_dtoa_r+0x61c>
c0103ce8:	dd d8                	fstp   %st(0)
c0103cea:	dd d8                	fstp   %st(0)
c0103cec:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0103cef:	89 fb                	mov    %edi,%ebx
c0103cf1:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
c0103cf5:	89 cf                	mov    %ecx,%edi
c0103cf7:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c0103cfa:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
c0103cfd:	eb 0f                	jmp    c0103d0e <_dtoa_r+0x63e>
c0103cff:	90                   	nop
c0103d00:	39 d3                	cmp    %edx,%ebx
c0103d02:	0f 84 75 09 00 00    	je     c010467d <_dtoa_r+0xfad>
c0103d08:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0103d0c:	89 d7                	mov    %edx,%edi
c0103d0e:	3c 39                	cmp    $0x39,%al
c0103d10:	8d 57 ff             	lea    -0x1(%edi),%edx
c0103d13:	74 eb                	je     c0103d00 <_dtoa_r+0x630>
c0103d15:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0103d18:	83 c0 01             	add    $0x1,%eax
c0103d1b:	88 02                	mov    %al,(%edx)
c0103d1d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
c0103d20:	e9 fb 01 00 00       	jmp    c0103f20 <_dtoa_r+0x850>
c0103d25:	8d 76 00             	lea    0x0(%esi),%esi
c0103d28:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0103d2b:	85 c9                	test   %ecx,%ecx
c0103d2d:	0f 85 9d 02 00 00    	jne    c0103fd0 <_dtoa_r+0x900>
c0103d33:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0103d36:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0103d39:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0103d40:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103d43:	85 c0                	test   %eax,%eax
c0103d45:	7e 14                	jle    c0103d5b <_dtoa_r+0x68b>
c0103d47:	85 db                	test   %ebx,%ebx
c0103d49:	7e 10                	jle    c0103d5b <_dtoa_r+0x68b>
c0103d4b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103d4e:	39 d8                	cmp    %ebx,%eax
c0103d50:	0f 4f c3             	cmovg  %ebx,%eax
c0103d53:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103d56:	29 c3                	sub    %eax,%ebx
c0103d58:	29 45 ac             	sub    %eax,-0x54(%ebp)
c0103d5b:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103d5e:	85 c0                	test   %eax,%eax
c0103d60:	7e 61                	jle    c0103dc3 <_dtoa_r+0x6f3>
c0103d62:	8b 45 98             	mov    -0x68(%ebp),%eax
c0103d65:	85 c0                	test   %eax,%eax
c0103d67:	0f 84 72 04 00 00    	je     c01041df <_dtoa_r+0xb0f>
c0103d6d:	85 d2                	test   %edx,%edx
c0103d6f:	7e 47                	jle    c0103db8 <_dtoa_r+0x6e8>
c0103d71:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103d74:	89 54 24 08          	mov    %edx,0x8(%esp)
c0103d78:	89 34 24             	mov    %esi,(%esp)
c0103d7b:	89 55 88             	mov    %edx,-0x78(%ebp)
c0103d7e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103d82:	e8 f9 19 00 00       	call   c0105780 <__pow5mult>
c0103d87:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103d8a:	89 34 24             	mov    %esi,(%esp)
c0103d8d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103d91:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103d95:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103d98:	e8 13 18 00 00       	call   c01055b0 <__multiply>
c0103d9d:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c0103da0:	89 34 24             	mov    %esi,(%esp)
c0103da3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0103da7:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0103daa:	e8 f1 14 00 00       	call   c01052a0 <_Bfree>
c0103daf:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0103db2:	8b 55 88             	mov    -0x78(%ebp),%edx
c0103db5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103db8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103dbb:	29 d0                	sub    %edx,%eax
c0103dbd:	0f 85 1f 04 00 00    	jne    c01041e2 <_dtoa_r+0xb12>
c0103dc3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0103dca:	00 
c0103dcb:	89 34 24             	mov    %esi,(%esp)
c0103dce:	e8 ad 17 00 00       	call   c0105580 <__i2b>
c0103dd3:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c0103dd6:	85 c9                	test   %ecx,%ecx
c0103dd8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103ddb:	7e 13                	jle    c0103df0 <_dtoa_r+0x720>
c0103ddd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103de1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103de5:	89 34 24             	mov    %esi,(%esp)
c0103de8:	e8 93 19 00 00       	call   c0105780 <__pow5mult>
c0103ded:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103df0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0103df4:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0103dfb:	0f 8e f7 05 00 00    	jle    c01043f8 <_dtoa_r+0xd28>
c0103e01:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103e04:	ba 01 00 00 00       	mov    $0x1,%edx
c0103e09:	85 c0                	test   %eax,%eax
c0103e0b:	0f 85 27 05 00 00    	jne    c0104338 <_dtoa_r+0xc68>
c0103e11:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103e14:	01 d0                	add    %edx,%eax
c0103e16:	83 e0 1f             	and    $0x1f,%eax
c0103e19:	89 c2                	mov    %eax,%edx
c0103e1b:	0f 84 57 03 00 00    	je     c0104178 <_dtoa_r+0xaa8>
c0103e21:	b8 20 00 00 00       	mov    $0x20,%eax
c0103e26:	29 d0                	sub    %edx,%eax
c0103e28:	83 f8 04             	cmp    $0x4,%eax
c0103e2b:	0f 8e 8c 0a 00 00    	jle    c01048bd <_dtoa_r+0x11ed>
c0103e31:	b8 1c 00 00 00       	mov    $0x1c,%eax
c0103e36:	29 d0                	sub    %edx,%eax
c0103e38:	01 45 a0             	add    %eax,-0x60(%ebp)
c0103e3b:	01 c3                	add    %eax,%ebx
c0103e3d:	01 45 ac             	add    %eax,-0x54(%ebp)
c0103e40:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103e43:	85 c0                	test   %eax,%eax
c0103e45:	7e 16                	jle    c0103e5d <_dtoa_r+0x78d>
c0103e47:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103e4b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103e4e:	89 34 24             	mov    %esi,(%esp)
c0103e51:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e55:	e8 46 1a 00 00       	call   c01058a0 <__lshift>
c0103e5a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103e5d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103e60:	85 c0                	test   %eax,%eax
c0103e62:	7e 16                	jle    c0103e7a <_dtoa_r+0x7aa>
c0103e64:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103e68:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103e6b:	89 34 24             	mov    %esi,(%esp)
c0103e6e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e72:	e8 29 1a 00 00       	call   c01058a0 <__lshift>
c0103e77:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103e7a:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0103e7d:	85 c0                	test   %eax,%eax
c0103e7f:	0f 85 d3 04 00 00    	jne    c0104358 <_dtoa_r+0xc88>
c0103e85:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0103e89:	0f 8e 11 02 00 00    	jle    c01040a0 <_dtoa_r+0x9d0>
c0103e8f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103e92:	85 c0                	test   %eax,%eax
c0103e94:	0f 8f 06 02 00 00    	jg     c01040a0 <_dtoa_r+0x9d0>
c0103e9a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103e9d:	85 c0                	test   %eax,%eax
c0103e9f:	0f 85 e0 01 00 00    	jne    c0104085 <_dtoa_r+0x9b5>
c0103ea5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103ea8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0103eaf:	00 
c0103eb0:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
c0103eb7:	00 
c0103eb8:	89 34 24             	mov    %esi,(%esp)
c0103ebb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ebf:	e8 fc 13 00 00       	call   c01052c0 <__multadd>
c0103ec4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103ec7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ecb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103ece:	89 04 24             	mov    %eax,(%esp)
c0103ed1:	e8 ea 1a 00 00       	call   c01059c0 <__mcmp>
c0103ed6:	85 c0                	test   %eax,%eax
c0103ed8:	0f 8e a7 01 00 00    	jle    c0104085 <_dtoa_r+0x9b5>
c0103ede:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0103ee2:	89 fb                	mov    %edi,%ebx
c0103ee4:	83 c7 01             	add    $0x1,%edi
c0103ee7:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
c0103eeb:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0103ef2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0103ef5:	89 34 24             	mov    %esi,(%esp)
c0103ef8:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103efc:	e8 9f 13 00 00       	call   c01052a0 <_Bfree>
c0103f01:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f04:	85 c0                	test   %eax,%eax
c0103f06:	74 18                	je     c0103f20 <_dtoa_r+0x850>
c0103f08:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0103f0b:	0f 85 a7 02 00 00    	jne    c01041b8 <_dtoa_r+0xae8>
c0103f11:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0103f14:	89 34 24             	mov    %esi,(%esp)
c0103f17:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f1b:	e8 80 13 00 00       	call   c01052a0 <_Bfree>
c0103f20:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0103f23:	89 34 24             	mov    %esi,(%esp)
c0103f26:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f2a:	e8 71 13 00 00       	call   c01052a0 <_Bfree>
c0103f2f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f32:	8b 75 1c             	mov    0x1c(%ebp),%esi
c0103f35:	c6 07 00             	movb   $0x0,(%edi)
c0103f38:	83 c0 01             	add    $0x1,%eax
c0103f3b:	89 06                	mov    %eax,(%esi)
c0103f3d:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f40:	85 c0                	test   %eax,%eax
c0103f42:	0f 84 90 02 00 00    	je     c01041d8 <_dtoa_r+0xb08>
c0103f48:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f4b:	89 38                	mov    %edi,(%eax)
c0103f4d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103f53:	89 d8                	mov    %ebx,%eax
c0103f55:	5b                   	pop    %ebx
c0103f56:	5e                   	pop    %esi
c0103f57:	5f                   	pop    %edi
c0103f58:	5d                   	pop    %ebp
c0103f59:	c3                   	ret    
c0103f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103f60:	db 45 b8             	fildl  -0x48(%ebp)
c0103f63:	df e9                	fucomip %st(1),%st
c0103f65:	dd d8                	fstp   %st(0)
c0103f67:	7a 06                	jp     c0103f6f <_dtoa_r+0x89f>
c0103f69:	0f 84 cc f8 ff ff    	je     c010383b <_dtoa_r+0x16b>
c0103f6f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0103f73:	e9 c3 f8 ff ff       	jmp    c010383b <_dtoa_r+0x16b>
c0103f78:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0103f7b:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0103f7e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0103f85:	f7 d8                	neg    %eax
c0103f87:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103f8a:	e9 0c f9 ff ff       	jmp    c010389b <_dtoa_r+0x1cb>
c0103f8f:	90                   	nop
c0103f90:	f7 d8                	neg    %eax
c0103f92:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0103f95:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
c0103f9c:	e9 e2 f8 ff ff       	jmp    c0103883 <_dtoa_r+0x1b3>
c0103fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103fa8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103fab:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
c0103fb0:	29 d9                	sub    %ebx,%ecx
c0103fb2:	d3 e0                	shl    %cl,%eax
c0103fb4:	e9 1b f8 ff ff       	jmp    c01037d4 <_dtoa_r+0x104>
c0103fb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0103fc0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0103fc7:	e9 a0 f8 ff ff       	jmp    c010386c <_dtoa_r+0x19c>
c0103fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103fd0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c0103fd4:	0f 8e fe 06 00 00    	jle    c01046d8 <_dtoa_r+0x1008>
c0103fda:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103fdd:	83 e8 01             	sub    $0x1,%eax
c0103fe0:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0103fe3:	0f 8c 3b 06 00 00    	jl     c0104624 <_dtoa_r+0xf54>
c0103fe9:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0103fec:	29 c2                	sub    %eax,%edx
c0103fee:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0103ff1:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0103ff4:	85 c9                	test   %ecx,%ecx
c0103ff6:	89 c8                	mov    %ecx,%eax
c0103ff8:	0f 88 83 07 00 00    	js     c0104781 <_dtoa_r+0x10b1>
c0103ffe:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0104005:	00 
c0104006:	89 34 24             	mov    %esi,(%esp)
c0104009:	89 55 8c             	mov    %edx,-0x74(%ebp)
c010400c:	01 45 a0             	add    %eax,-0x60(%ebp)
c010400f:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104012:	e8 69 15 00 00       	call   c0105580 <__i2b>
c0104017:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010401a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010401d:	e9 1e fd ff ff       	jmp    c0103d40 <_dtoa_r+0x670>
c0104022:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104028:	d9 c1                	fld    %st(1)
c010402a:	b9 02 00 00 00       	mov    $0x2,%ecx
c010402f:	e9 37 fa ff ff       	jmp    c0103a6b <_dtoa_r+0x39b>
c0104034:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104037:	db 45 d4             	fildl  -0x2c(%ebp)
c010403a:	d8 c9                	fmul   %st(1),%st
c010403c:	d8 05 dc 82 10 c0    	fadds  0xc01082dc
c0104042:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104045:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c010404c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104050:	d8 25 e0 82 10 c0    	fsubs  0xc01082e0
c0104056:	dd 45 c0             	fldl   -0x40(%ebp)
c0104059:	d9 c9                	fxch   %st(1)
c010405b:	db e9                	fucomi %st(1),%st
c010405d:	0f 87 0d 02 00 00    	ja     c0104270 <_dtoa_r+0xba0>
c0104063:	d9 c9                	fxch   %st(1)
c0104065:	d9 e0                	fchs   
c0104067:	df e9                	fucomip %st(1),%st
c0104069:	dd d8                	fstp   %st(0)
c010406b:	0f 86 a7 01 00 00    	jbe    c0104218 <_dtoa_r+0xb48>
c0104071:	dd d8                	fstp   %st(0)
c0104073:	eb 02                	jmp    c0104077 <_dtoa_r+0x9a7>
c0104075:	dd d8                	fstp   %st(0)
c0104077:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010407e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104085:	8b 45 18             	mov    0x18(%ebp),%eax
c0104088:	89 fb                	mov    %edi,%ebx
c010408a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0104091:	f7 d0                	not    %eax
c0104093:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104096:	e9 57 fe ff ff       	jmp    c0103ef2 <_dtoa_r+0x822>
c010409b:	90                   	nop
c010409c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01040a0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01040a3:	85 c0                	test   %eax,%eax
c01040a5:	0f 85 c5 03 00 00    	jne    c0104470 <_dtoa_r+0xda0>
c01040ab:	89 75 08             	mov    %esi,0x8(%ebp)
c01040ae:	bb 01 00 00 00       	mov    $0x1,%ebx
c01040b3:	8b 75 a4             	mov    -0x5c(%ebp),%esi
c01040b6:	eb 24                	jmp    c01040dc <_dtoa_r+0xa0c>
c01040b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01040bb:	83 c3 01             	add    $0x1,%ebx
c01040be:	89 74 24 04          	mov    %esi,0x4(%esp)
c01040c2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01040c9:	00 
c01040ca:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01040d1:	00 
c01040d2:	89 04 24             	mov    %eax,(%esp)
c01040d5:	e8 e6 11 00 00       	call   c01052c0 <__multadd>
c01040da:	89 c6                	mov    %eax,%esi
c01040dc:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01040df:	89 f0                	mov    %esi,%eax
c01040e1:	e8 1a f4 ff ff       	call   c0103500 <quorem>
c01040e6:	83 c0 30             	add    $0x30,%eax
c01040e9:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
c01040ec:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
c01040f0:	7c c6                	jl     c01040b8 <_dtoa_r+0x9e8>
c01040f2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01040f5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01040f8:	ba 01 00 00 00       	mov    $0x1,%edx
c01040fd:	89 75 a4             	mov    %esi,-0x5c(%ebp)
c0104100:	8b 75 08             	mov    0x8(%ebp),%esi
c0104103:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c010410a:	85 c0                	test   %eax,%eax
c010410c:	0f 4f d0             	cmovg  %eax,%edx
c010410f:	01 fa                	add    %edi,%edx
c0104111:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104114:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010411b:	00 
c010411c:	89 34 24             	mov    %esi,(%esp)
c010411f:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0104122:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104126:	e8 75 17 00 00       	call   c01058a0 <__lshift>
c010412b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c010412e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104132:	89 04 24             	mov    %eax,(%esp)
c0104135:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104138:	e8 83 18 00 00       	call   c01059c0 <__mcmp>
c010413d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0104140:	83 f8 00             	cmp    $0x0,%eax
c0104143:	0f 8e 41 06 00 00    	jle    c010478a <_dtoa_r+0x10ba>
c0104149:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
c010414d:	eb 0f                	jmp    c010415e <_dtoa_r+0xa8e>
c010414f:	90                   	nop
c0104150:	39 c7                	cmp    %eax,%edi
c0104152:	0f 84 70 05 00 00    	je     c01046c8 <_dtoa_r+0xff8>
c0104158:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
c010415c:	89 c2                	mov    %eax,%edx
c010415e:	80 f9 39             	cmp    $0x39,%cl
c0104161:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104164:	74 ea                	je     c0104150 <_dtoa_r+0xa80>
c0104166:	83 c1 01             	add    $0x1,%ecx
c0104169:	89 fb                	mov    %edi,%ebx
c010416b:	88 08                	mov    %cl,(%eax)
c010416d:	89 d7                	mov    %edx,%edi
c010416f:	e9 7e fd ff ff       	jmp    c0103ef2 <_dtoa_r+0x822>
c0104174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104178:	b8 1c 00 00 00       	mov    $0x1c,%eax
c010417d:	01 45 a0             	add    %eax,-0x60(%ebp)
c0104180:	01 c3                	add    %eax,%ebx
c0104182:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104185:	e9 b6 fc ff ff       	jmp    c0103e40 <_dtoa_r+0x770>
c010418a:	ba 01 00 00 00       	mov    $0x1,%edx
c010418f:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
c0104196:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
c010419d:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
c01041a4:	21 c2                	and    %eax,%edx
c01041a6:	88 55 b4             	mov    %dl,-0x4c(%ebp)
c01041a9:	31 d2                	xor    %edx,%edx
c01041ab:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01041b2:	e9 62 f8 ff ff       	jmp    c0103a19 <_dtoa_r+0x349>
c01041b7:	90                   	nop
c01041b8:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01041bb:	85 d2                	test   %edx,%edx
c01041bd:	0f 84 4e fd ff ff    	je     c0103f11 <_dtoa_r+0x841>
c01041c3:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01041c6:	89 34 24             	mov    %esi,(%esp)
c01041c9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041cd:	e8 ce 10 00 00       	call   c01052a0 <_Bfree>
c01041d2:	e9 3a fd ff ff       	jmp    c0103f11 <_dtoa_r+0x841>
c01041d7:	90                   	nop
c01041d8:	89 d8                	mov    %ebx,%eax
c01041da:	e9 89 f5 ff ff       	jmp    c0103768 <_dtoa_r+0x98>
c01041df:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01041e2:	89 44 24 08          	mov    %eax,0x8(%esp)
c01041e6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01041e9:	89 34 24             	mov    %esi,(%esp)
c01041ec:	89 44 24 04          	mov    %eax,0x4(%esp)
c01041f0:	e8 8b 15 00 00       	call   c0105780 <__pow5mult>
c01041f5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01041f8:	e9 c6 fb ff ff       	jmp    c0103dc3 <_dtoa_r+0x6f3>
c01041fd:	dd d8                	fstp   %st(0)
c01041ff:	dd d8                	fstp   %st(0)
c0104201:	eb 15                	jmp    c0104218 <_dtoa_r+0xb48>
c0104203:	90                   	nop
c0104204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104208:	dd d8                	fstp   %st(0)
c010420a:	dd d8                	fstp   %st(0)
c010420c:	dd d8                	fstp   %st(0)
c010420e:	eb 08                	jmp    c0104218 <_dtoa_r+0xb48>
c0104210:	dd d8                	fstp   %st(0)
c0104212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104218:	dd 5d c0             	fstpl  -0x40(%ebp)
c010421b:	e9 cf f9 ff ff       	jmp    c0103bef <_dtoa_r+0x51f>
c0104220:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104223:	f7 d8                	neg    %eax
c0104225:	0f 84 6a 04 00 00    	je     c0104695 <_dtoa_r+0xfc5>
c010422b:	89 c2                	mov    %eax,%edx
c010422d:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104232:	83 e2 0f             	and    $0xf,%edx
c0104235:	c1 f8 04             	sar    $0x4,%eax
c0104238:	dd 04 d5 c0 83 10 c0 	fldl   -0x3fef7c40(,%edx,8)
c010423f:	85 c0                	test   %eax,%eax
c0104241:	d8 c9                	fmul   %st(1),%st
c0104243:	0f 84 4a f8 ff ff    	je     c0103a93 <_dtoa_r+0x3c3>
c0104249:	31 d2                	xor    %edx,%edx
c010424b:	90                   	nop
c010424c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104250:	a8 01                	test   $0x1,%al
c0104252:	74 0a                	je     c010425e <_dtoa_r+0xb8e>
c0104254:	dc 0c d5 80 83 10 c0 	fmull  -0x3fef7c80(,%edx,8)
c010425b:	83 c1 01             	add    $0x1,%ecx
c010425e:	83 c2 01             	add    $0x1,%edx
c0104261:	d1 f8                	sar    %eax
c0104263:	75 eb                	jne    c0104250 <_dtoa_r+0xb80>
c0104265:	e9 29 f8 ff ff       	jmp    c0103a93 <_dtoa_r+0x3c3>
c010426a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104270:	dd d8                	fstp   %st(0)
c0104272:	dd d8                	fstp   %st(0)
c0104274:	dd d8                	fstp   %st(0)
c0104276:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010427d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104284:	e9 55 fc ff ff       	jmp    c0103ede <_dtoa_r+0x80e>
c0104289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104290:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0104293:	8d 41 ff             	lea    -0x1(%ecx),%eax
c0104296:	dd 45 c0             	fldl   -0x40(%ebp)
c0104299:	dc 0c c5 c0 83 10 c0 	fmull  -0x3fef7c40(,%eax,8)
c01042a0:	d9 c9                	fxch   %st(1)
c01042a2:	89 45 88             	mov    %eax,-0x78(%ebp)
c01042a5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01042a9:	8d 57 01             	lea    0x1(%edi),%edx
c01042ac:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
c01042af:	b4 0c                	mov    $0xc,%ah
c01042b1:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c01042b5:	d9 6d d0             	fldcw  -0x30(%ebp)
c01042b8:	db 55 d4             	fistl  -0x2c(%ebp)
c01042bb:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01042be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01042c1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01042c4:	83 c0 30             	add    $0x30,%eax
c01042c7:	83 f9 01             	cmp    $0x1,%ecx
c01042ca:	db 45 d4             	fildl  -0x2c(%ebp)
c01042cd:	de e9                	fsubrp %st,%st(1)
c01042cf:	88 07                	mov    %al,(%edi)
c01042d1:	89 d0                	mov    %edx,%eax
c01042d3:	74 37                	je     c010430c <_dtoa_r+0xc3c>
c01042d5:	d9 05 d8 82 10 c0    	flds   0xc01082d8
c01042db:	eb 05                	jmp    c01042e2 <_dtoa_r+0xc12>
c01042dd:	8d 76 00             	lea    0x0(%esi),%esi
c01042e0:	d9 c9                	fxch   %st(1)
c01042e2:	dc c9                	fmul   %st,%st(1)
c01042e4:	d9 c9                	fxch   %st(1)
c01042e6:	83 c0 01             	add    $0x1,%eax
c01042e9:	d9 6d d0             	fldcw  -0x30(%ebp)
c01042ec:	db 55 d4             	fistl  -0x2c(%ebp)
c01042ef:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01042f2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c01042f5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c01042f8:	83 c1 30             	add    $0x30,%ecx
c01042fb:	39 d8                	cmp    %ebx,%eax
c01042fd:	db 45 d4             	fildl  -0x2c(%ebp)
c0104300:	de e9                	fsubrp %st,%st(1)
c0104302:	88 48 ff             	mov    %cl,-0x1(%eax)
c0104305:	75 d9                	jne    c01042e0 <_dtoa_r+0xc10>
c0104307:	dd d9                	fstp   %st(1)
c0104309:	03 55 88             	add    -0x78(%ebp),%edx
c010430c:	d9 05 e4 82 10 c0    	flds   0xc01082e4
c0104312:	d9 c2                	fld    %st(2)
c0104314:	d8 c1                	fadd   %st(1),%st
c0104316:	d9 ca                	fxch   %st(2)
c0104318:	db ea                	fucomi %st(2),%st
c010431a:	dd da                	fstp   %st(2)
c010431c:	0f 86 7f 03 00 00    	jbe    c01046a1 <_dtoa_r+0xfd1>
c0104322:	dd d8                	fstp   %st(0)
c0104324:	dd d8                	fstp   %st(0)
c0104326:	dd d8                	fstp   %st(0)
c0104328:	dd d8                	fstp   %st(0)
c010432a:	89 fb                	mov    %edi,%ebx
c010432c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0104330:	89 d7                	mov    %edx,%edi
c0104332:	e9 d7 f9 ff ff       	jmp    c0103d0e <_dtoa_r+0x63e>
c0104337:	90                   	nop
c0104338:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c010433b:	8b 41 10             	mov    0x10(%ecx),%eax
c010433e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
c0104342:	89 04 24             	mov    %eax,(%esp)
c0104345:	e8 56 11 00 00       	call   c01054a0 <__hi0bits>
c010434a:	ba 20 00 00 00       	mov    $0x20,%edx
c010434f:	29 c2                	sub    %eax,%edx
c0104351:	e9 bb fa ff ff       	jmp    c0103e11 <_dtoa_r+0x741>
c0104356:	66 90                	xchg   %ax,%ax
c0104358:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010435b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010435f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104362:	89 04 24             	mov    %eax,(%esp)
c0104365:	e8 56 16 00 00       	call   c01059c0 <__mcmp>
c010436a:	85 c0                	test   %eax,%eax
c010436c:	0f 89 13 fb ff ff    	jns    c0103e85 <_dtoa_r+0x7b5>
c0104372:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104375:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010437c:	00 
c010437d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104384:	00 
c0104385:	89 34 24             	mov    %esi,(%esp)
c0104388:	89 44 24 04          	mov    %eax,0x4(%esp)
c010438c:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104390:	e8 2b 0f 00 00       	call   c01052c0 <__multadd>
c0104395:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104398:	85 c9                	test   %ecx,%ecx
c010439a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010439d:	0f 85 8d 00 00 00    	jne    c0104430 <_dtoa_r+0xd60>
c01043a3:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
c01043a7:	8b 45 90             	mov    -0x70(%ebp),%eax
c01043aa:	7f 0a                	jg     c01043b6 <_dtoa_r+0xce6>
c01043ac:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c01043b0:	0f 8f ff 04 00 00    	jg     c01048b5 <_dtoa_r+0x11e5>
c01043b6:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01043b9:	e9 ed fc ff ff       	jmp    c01040ab <_dtoa_r+0x9db>
c01043be:	66 90                	xchg   %ax,%ax
c01043c0:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c01043c3:	85 db                	test   %ebx,%ebx
c01043c5:	0f 85 aa fc ff ff    	jne    c0104075 <_dtoa_r+0x9a5>
c01043cb:	d8 0d e0 82 10 c0    	fmuls  0xc01082e0
c01043d1:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01043d8:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01043df:	dd 45 c0             	fldl   -0x40(%ebp)
c01043e2:	d9 c9                	fxch   %st(1)
c01043e4:	df e9                	fucomip %st(1),%st
c01043e6:	dd d8                	fstp   %st(0)
c01043e8:	0f 83 97 fc ff ff    	jae    c0104085 <_dtoa_r+0x9b5>
c01043ee:	e9 eb fa ff ff       	jmp    c0103ede <_dtoa_r+0x80e>
c01043f3:	90                   	nop
c01043f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01043f8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01043fb:	85 c0                	test   %eax,%eax
c01043fd:	0f 85 fe f9 ff ff    	jne    c0103e01 <_dtoa_r+0x731>
c0104403:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0104406:	a9 ff ff 0f 00       	test   $0xfffff,%eax
c010440b:	0f 85 f0 f9 ff ff    	jne    c0103e01 <_dtoa_r+0x731>
c0104411:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
c0104416:	0f 84 e5 f9 ff ff    	je     c0103e01 <_dtoa_r+0x731>
c010441c:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
c0104420:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
c0104424:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c010442b:	e9 d1 f9 ff ff       	jmp    c0103e01 <_dtoa_r+0x731>
c0104430:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104433:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c010443a:	00 
c010443b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104442:	00 
c0104443:	89 34 24             	mov    %esi,(%esp)
c0104446:	89 44 24 04          	mov    %eax,0x4(%esp)
c010444a:	e8 71 0e 00 00       	call   c01052c0 <__multadd>
c010444f:	8b 55 90             	mov    -0x70(%ebp),%edx
c0104452:	85 d2                	test   %edx,%edx
c0104454:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104457:	8b 45 90             	mov    -0x70(%ebp),%eax
c010445a:	7f 0a                	jg     c0104466 <_dtoa_r+0xd96>
c010445c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104460:	0f 8f 4f 04 00 00    	jg     c01048b5 <_dtoa_r+0x11e5>
c0104466:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104470:	85 db                	test   %ebx,%ebx
c0104472:	7e 16                	jle    c010448a <_dtoa_r+0xdba>
c0104474:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104477:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010447b:	89 34 24             	mov    %esi,(%esp)
c010447e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104482:	e8 19 14 00 00       	call   c01058a0 <__lshift>
c0104487:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010448a:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
c010448d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104490:	85 db                	test   %ebx,%ebx
c0104492:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104495:	0f 85 11 03 00 00    	jne    c01047ac <_dtoa_r+0x10dc>
c010449b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010449e:	8d 5f 01             	lea    0x1(%edi),%ebx
c01044a1:	89 7d 8c             	mov    %edi,-0x74(%ebp)
c01044a4:	01 f8                	add    %edi,%eax
c01044a6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
c01044a9:	89 45 90             	mov    %eax,-0x70(%ebp)
c01044ac:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01044af:	83 e0 01             	and    $0x1,%eax
c01044b2:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01044b5:	eb 2e                	jmp    c01044e5 <_dtoa_r+0xe15>
c01044b7:	90                   	nop
c01044b8:	e8 03 0e 00 00       	call   c01052c0 <__multadd>
c01044bd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01044c4:	00 
c01044c5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01044cc:	00 
c01044cd:	89 34 24             	mov    %esi,(%esp)
c01044d0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01044d3:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01044d6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01044da:	e8 e1 0d 00 00       	call   c01052c0 <__multadd>
c01044df:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01044e2:	83 c3 01             	add    $0x1,%ebx
c01044e5:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01044e8:	8d 43 ff             	lea    -0x1(%ebx),%eax
c01044eb:	89 45 98             	mov    %eax,-0x68(%ebp)
c01044ee:	89 f8                	mov    %edi,%eax
c01044f0:	e8 0b f0 ff ff       	call   c0103500 <quorem>
c01044f5:	89 3c 24             	mov    %edi,(%esp)
c01044f8:	8d 48 30             	lea    0x30(%eax),%ecx
c01044fb:	89 4d a0             	mov    %ecx,-0x60(%ebp)
c01044fe:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104501:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104504:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0104508:	e8 b3 14 00 00       	call   c01059c0 <__mcmp>
c010450d:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c0104510:	89 34 24             	mov    %esi,(%esp)
c0104513:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104517:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010451a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010451d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104521:	e8 ea 14 00 00       	call   c0105a10 <__mdiff>
c0104526:	8b 48 0c             	mov    0xc(%eax),%ecx
c0104529:	89 c2                	mov    %eax,%edx
c010452b:	85 c9                	test   %ecx,%ecx
c010452d:	0f 85 c5 00 00 00    	jne    c01045f8 <_dtoa_r+0xf28>
c0104533:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104537:	89 3c 24             	mov    %edi,(%esp)
c010453a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010453d:	e8 7e 14 00 00       	call   c01059c0 <__mcmp>
c0104542:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0104545:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104549:	89 34 24             	mov    %esi,(%esp)
c010454c:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010454f:	e8 4c 0d 00 00       	call   c01052a0 <_Bfree>
c0104554:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104557:	89 c1                	mov    %eax,%ecx
c0104559:	0b 4d 14             	or     0x14(%ebp),%ecx
c010455c:	75 0b                	jne    c0104569 <_dtoa_r+0xe99>
c010455e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0104561:	85 d2                	test   %edx,%edx
c0104563:	0f 84 fb 02 00 00    	je     c0104864 <_dtoa_r+0x1194>
c0104569:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010456c:	85 d2                	test   %edx,%edx
c010456e:	0f 88 7f 01 00 00    	js     c01046f3 <_dtoa_r+0x1023>
c0104574:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104577:	0b 4d 14             	or     0x14(%ebp),%ecx
c010457a:	75 0b                	jne    c0104587 <_dtoa_r+0xeb7>
c010457c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c010457f:	85 c9                	test   %ecx,%ecx
c0104581:	0f 84 6c 01 00 00    	je     c01046f3 <_dtoa_r+0x1023>
c0104587:	85 c0                	test   %eax,%eax
c0104589:	0f 8f 82 02 00 00    	jg     c0104811 <_dtoa_r+0x1141>
c010458f:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104593:	89 da                	mov    %ebx,%edx
c0104595:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
c0104598:	88 43 ff             	mov    %al,-0x1(%ebx)
c010459b:	0f 84 8d 02 00 00    	je     c010482e <_dtoa_r+0x115e>
c01045a1:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01045a5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01045ac:	00 
c01045ad:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01045b4:	00 
c01045b5:	89 34 24             	mov    %esi,(%esp)
c01045b8:	e8 03 0d 00 00       	call   c01052c0 <__multadd>
c01045bd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01045c4:	00 
c01045c5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01045cc:	00 
c01045cd:	89 34 24             	mov    %esi,(%esp)
c01045d0:	89 c7                	mov    %eax,%edi
c01045d2:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01045d5:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c01045d8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01045db:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045df:	0f 85 d3 fe ff ff    	jne    c01044b8 <_dtoa_r+0xde8>
c01045e5:	e8 d6 0c 00 00       	call   c01052c0 <__multadd>
c01045ea:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01045ed:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01045f0:	e9 ed fe ff ff       	jmp    c01044e2 <_dtoa_r+0xe12>
c01045f5:	8d 76 00             	lea    0x0(%esi),%esi
c01045f8:	b8 01 00 00 00       	mov    $0x1,%eax
c01045fd:	e9 43 ff ff ff       	jmp    c0104545 <_dtoa_r+0xe75>
c0104602:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104609:	e9 d2 f2 ff ff       	jmp    c01038e0 <_dtoa_r+0x210>
c010460e:	0f 85 87 f6 ff ff    	jne    c0103c9b <_dtoa_r+0x5cb>
c0104614:	dd d8                	fstp   %st(0)
c0104616:	dd d8                	fstp   %st(0)
c0104618:	dd d8                	fstp   %st(0)
c010461a:	89 fb                	mov    %edi,%ebx
c010461c:	8b 7d c0             	mov    -0x40(%ebp),%edi
c010461f:	e9 fc f8 ff ff       	jmp    c0103f20 <_dtoa_r+0x850>
c0104624:	89 c2                	mov    %eax,%edx
c0104626:	2b 55 b0             	sub    -0x50(%ebp),%edx
c0104629:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010462c:	01 55 94             	add    %edx,-0x6c(%ebp)
c010462f:	31 d2                	xor    %edx,%edx
c0104631:	e9 b8 f9 ff ff       	jmp    c0103fee <_dtoa_r+0x91e>
c0104636:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104639:	85 c0                	test   %eax,%eax
c010463b:	0f 84 f3 f9 ff ff    	je     c0104034 <_dtoa_r+0x964>
c0104641:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104644:	85 c0                	test   %eax,%eax
c0104646:	0f 8e c4 fb ff ff    	jle    c0104210 <_dtoa_r+0xb40>
c010464c:	d8 0d d8 82 10 c0    	fmuls  0xc01082d8
c0104652:	83 c1 01             	add    $0x1,%ecx
c0104655:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104658:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c010465b:	89 c1                	mov    %eax,%ecx
c010465d:	83 eb 01             	sub    $0x1,%ebx
c0104660:	db 45 d4             	fildl  -0x2c(%ebp)
c0104663:	d8 c9                	fmul   %st(1),%st
c0104665:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
c0104668:	d8 05 dc 82 10 c0    	fadds  0xc01082dc
c010466e:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104671:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0104678:	e9 53 f4 ff ff       	jmp    c0103ad0 <_dtoa_r+0x400>
c010467d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104680:	c6 03 30             	movb   $0x30,(%ebx)
c0104683:	83 c0 01             	add    $0x1,%eax
c0104686:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104689:	b8 31 00 00 00       	mov    $0x31,%eax
c010468e:	88 02                	mov    %al,(%edx)
c0104690:	e9 8b f8 ff ff       	jmp    c0103f20 <_dtoa_r+0x850>
c0104695:	d9 c0                	fld    %st(0)
c0104697:	b9 02 00 00 00       	mov    $0x2,%ecx
c010469c:	e9 f2 f3 ff ff       	jmp    c0103a93 <_dtoa_r+0x3c3>
c01046a1:	de e2                	fsubp  %st,%st(2)
c01046a3:	d9 c9                	fxch   %st(1)
c01046a5:	df e9                	fucomip %st(1),%st
c01046a7:	dd d8                	fstp   %st(0)
c01046a9:	0f 86 69 fb ff ff    	jbe    c0104218 <_dtoa_r+0xb48>
c01046af:	dd d8                	fstp   %st(0)
c01046b1:	eb 07                	jmp    c01046ba <_dtoa_r+0xfea>
c01046b3:	90                   	nop
c01046b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01046b8:	89 c2                	mov    %eax,%edx
c01046ba:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c01046be:	8d 42 ff             	lea    -0x1(%edx),%eax
c01046c1:	74 f5                	je     c01046b8 <_dtoa_r+0xfe8>
c01046c3:	e9 d9 f4 ff ff       	jmp    c0103ba1 <_dtoa_r+0x4d1>
c01046c8:	c6 07 31             	movb   $0x31,(%edi)
c01046cb:	89 fb                	mov    %edi,%ebx
c01046cd:	89 d7                	mov    %edx,%edi
c01046cf:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c01046d3:	e9 1a f8 ff ff       	jmp    c0103ef2 <_dtoa_r+0x822>
c01046d8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01046db:	85 d2                	test   %edx,%edx
c01046dd:	0f 84 1b 01 00 00    	je     c01047fe <_dtoa_r+0x112e>
c01046e3:	05 33 04 00 00       	add    $0x433,%eax
c01046e8:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01046eb:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c01046ee:	e9 0b f9 ff ff       	jmp    c0103ffe <_dtoa_r+0x92e>
c01046f3:	85 c0                	test   %eax,%eax
c01046f5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c01046f8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c01046fb:	7e 45                	jle    c0104742 <_dtoa_r+0x1072>
c01046fd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104700:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104707:	00 
c0104708:	89 34 24             	mov    %esi,(%esp)
c010470b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010470f:	e8 8c 11 00 00       	call   c01058a0 <__lshift>
c0104714:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c0104717:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c010471b:	89 04 24             	mov    %eax,(%esp)
c010471e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104721:	e8 9a 12 00 00       	call   c01059c0 <__mcmp>
c0104726:	83 f8 00             	cmp    $0x0,%eax
c0104729:	0f 8e 5b 01 00 00    	jle    c010488a <_dtoa_r+0x11ba>
c010472f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104733:	0f 84 0c 01 00 00    	je     c0104845 <_dtoa_r+0x1175>
c0104739:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010473c:	83 c0 31             	add    $0x31,%eax
c010473f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104742:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104745:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104749:	89 cb                	mov    %ecx,%ebx
c010474b:	88 03                	mov    %al,(%ebx)
c010474d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104750:	89 fb                	mov    %edi,%ebx
c0104752:	8d 79 01             	lea    0x1(%ecx),%edi
c0104755:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104758:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010475b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010475e:	e9 8f f7 ff ff       	jmp    c0103ef2 <_dtoa_r+0x822>
c0104763:	dd d8                	fstp   %st(0)
c0104765:	dd d8                	fstp   %st(0)
c0104767:	dd d8                	fstp   %st(0)
c0104769:	eb 0d                	jmp    c0104778 <_dtoa_r+0x10a8>
c010476b:	90                   	nop
c010476c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104770:	dd d8                	fstp   %st(0)
c0104772:	dd d8                	fstp   %st(0)
c0104774:	dd d8                	fstp   %st(0)
c0104776:	dd d8                	fstp   %st(0)
c0104778:	89 fb                	mov    %edi,%ebx
c010477a:	89 d7                	mov    %edx,%edi
c010477c:	e9 8d f5 ff ff       	jmp    c0103d0e <_dtoa_r+0x63e>
c0104781:	29 cb                	sub    %ecx,%ebx
c0104783:	31 c0                	xor    %eax,%eax
c0104785:	e9 74 f8 ff ff       	jmp    c0103ffe <_dtoa_r+0x92e>
c010478a:	75 0e                	jne    c010479a <_dtoa_r+0x10ca>
c010478c:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104790:	74 08                	je     c010479a <_dtoa_r+0x10ca>
c0104792:	e9 b2 f9 ff ff       	jmp    c0104149 <_dtoa_r+0xa79>
c0104797:	90                   	nop
c0104798:	89 c2                	mov    %eax,%edx
c010479a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c010479e:	8d 42 ff             	lea    -0x1(%edx),%eax
c01047a1:	74 f5                	je     c0104798 <_dtoa_r+0x10c8>
c01047a3:	89 fb                	mov    %edi,%ebx
c01047a5:	89 d7                	mov    %edx,%edi
c01047a7:	e9 46 f7 ff ff       	jmp    c0103ef2 <_dtoa_r+0x822>
c01047ac:	8b 40 04             	mov    0x4(%eax),%eax
c01047af:	89 34 24             	mov    %esi,(%esp)
c01047b2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01047b6:	e8 45 0a 00 00       	call   c0105200 <_Balloc>
c01047bb:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c01047be:	89 c3                	mov    %eax,%ebx
c01047c0:	8b 41 10             	mov    0x10(%ecx),%eax
c01047c3:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c01047ca:	89 44 24 08          	mov    %eax,0x8(%esp)
c01047ce:	89 c8                	mov    %ecx,%eax
c01047d0:	83 c0 0c             	add    $0xc,%eax
c01047d3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01047d7:	8d 43 0c             	lea    0xc(%ebx),%eax
c01047da:	89 04 24             	mov    %eax,(%esp)
c01047dd:	e8 6e cc ff ff       	call   c0101450 <memcpy>
c01047e2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c01047e9:	00 
c01047ea:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c01047ee:	89 34 24             	mov    %esi,(%esp)
c01047f1:	e8 aa 10 00 00       	call   c01058a0 <__lshift>
c01047f6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01047f9:	e9 9d fc ff ff       	jmp    c010449b <_dtoa_r+0xdcb>
c01047fe:	b8 36 00 00 00       	mov    $0x36,%eax
c0104803:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104806:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0104809:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010480c:	e9 ed f7 ff ff       	jmp    c0103ffe <_dtoa_r+0x92e>
c0104811:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104815:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104818:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010481b:	74 28                	je     c0104845 <_dtoa_r+0x1175>
c010481d:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104821:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104824:	83 c0 01             	add    $0x1,%eax
c0104827:	89 cb                	mov    %ecx,%ebx
c0104829:	e9 1d ff ff ff       	jmp    c010474b <_dtoa_r+0x107b>
c010482e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104831:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104834:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104837:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010483a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010483d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104840:	e9 cc f8 ff ff       	jmp    c0104111 <_dtoa_r+0xa41>
c0104845:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104848:	b9 39 00 00 00       	mov    $0x39,%ecx
c010484d:	8d 50 01             	lea    0x1(%eax),%edx
c0104850:	c6 00 39             	movb   $0x39,(%eax)
c0104853:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104856:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104859:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010485c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010485f:	e9 fa f8 ff ff       	jmp    c010415e <_dtoa_r+0xa8e>
c0104864:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104867:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c010486a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010486d:	83 fb 39             	cmp    $0x39,%ebx
c0104870:	74 d3                	je     c0104845 <_dtoa_r+0x1175>
c0104872:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104875:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104878:	83 c0 31             	add    $0x31,%eax
c010487b:	85 c9                	test   %ecx,%ecx
c010487d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104880:	0f 4e c3             	cmovle %ebx,%eax
c0104883:	89 cb                	mov    %ecx,%ebx
c0104885:	e9 c1 fe ff ff       	jmp    c010474b <_dtoa_r+0x107b>
c010488a:	0f 85 b2 fe ff ff    	jne    c0104742 <_dtoa_r+0x1072>
c0104890:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104894:	0f 84 a8 fe ff ff    	je     c0104742 <_dtoa_r+0x1072>
c010489a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01048a0:	e9 8a fe ff ff       	jmp    c010472f <_dtoa_r+0x105f>
c01048a5:	0f 85 c7 f3 ff ff    	jne    c0103c72 <_dtoa_r+0x5a2>
c01048ab:	dd d8                	fstp   %st(0)
c01048ad:	dd d8                	fstp   %st(0)
c01048af:	90                   	nop
c01048b0:	e9 65 fd ff ff       	jmp    c010461a <_dtoa_r+0xf4a>
c01048b5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01048b8:	e9 dd f5 ff ff       	jmp    c0103e9a <_dtoa_r+0x7ca>
c01048bd:	8d 76 00             	lea    0x0(%esi),%esi
c01048c0:	0f 84 7a f5 ff ff    	je     c0103e40 <_dtoa_r+0x770>
c01048c6:	b8 3c 00 00 00       	mov    $0x3c,%eax
c01048cb:	29 d0                	sub    %edx,%eax
c01048cd:	e9 ab f8 ff ff       	jmp    c010417d <_dtoa_r+0xaad>
c01048d2:	b8 01 00 00 00       	mov    $0x1,%eax
c01048d7:	e9 d9 ef ff ff       	jmp    c01038b5 <_dtoa_r+0x1e5>
c01048dc:	31 d2                	xor    %edx,%edx
c01048de:	e9 36 f1 ff ff       	jmp    c0103a19 <_dtoa_r+0x349>
c01048e3:	66 90                	xchg   %ax,%ax
c01048e5:	66 90                	xchg   %ax,%ax
c01048e7:	66 90                	xchg   %ax,%ax
c01048e9:	66 90                	xchg   %ax,%ax
c01048eb:	66 90                	xchg   %ax,%ax
c01048ed:	66 90                	xchg   %ax,%ax
c01048ef:	90                   	nop

c01048f0 <_setlocale_r>:
c01048f0:	55                   	push   %ebp
c01048f1:	89 e5                	mov    %esp,%ebp
c01048f3:	53                   	push   %ebx
c01048f4:	83 ec 14             	sub    $0x14,%esp
c01048f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01048fa:	85 db                	test   %ebx,%ebx
c01048fc:	74 14                	je     c0104912 <_setlocale_r+0x22>
c01048fe:	c7 44 24 04 00 83 10 	movl   $0xc0108300,0x4(%esp)
c0104905:	c0 
c0104906:	89 1c 24             	mov    %ebx,(%esp)
c0104909:	e8 82 17 00 00       	call   c0106090 <strcmp>
c010490e:	85 c0                	test   %eax,%eax
c0104910:	75 0e                	jne    c0104920 <_setlocale_r+0x30>
c0104912:	83 c4 14             	add    $0x14,%esp
c0104915:	b8 fc 80 10 c0       	mov    $0xc01080fc,%eax
c010491a:	5b                   	pop    %ebx
c010491b:	5d                   	pop    %ebp
c010491c:	c3                   	ret    
c010491d:	8d 76 00             	lea    0x0(%esi),%esi
c0104920:	c7 44 24 04 fc 80 10 	movl   $0xc01080fc,0x4(%esp)
c0104927:	c0 
c0104928:	89 1c 24             	mov    %ebx,(%esp)
c010492b:	e8 60 17 00 00       	call   c0106090 <strcmp>
c0104930:	85 c0                	test   %eax,%eax
c0104932:	74 de                	je     c0104912 <_setlocale_r+0x22>
c0104934:	89 1c 24             	mov    %ebx,(%esp)
c0104937:	c7 44 24 04 36 81 10 	movl   $0xc0108136,0x4(%esp)
c010493e:	c0 
c010493f:	e8 4c 17 00 00       	call   c0106090 <strcmp>
c0104944:	89 c2                	mov    %eax,%edx
c0104946:	31 c0                	xor    %eax,%eax
c0104948:	85 d2                	test   %edx,%edx
c010494a:	ba fc 80 10 c0       	mov    $0xc01080fc,%edx
c010494f:	0f 44 c2             	cmove  %edx,%eax
c0104952:	83 c4 14             	add    $0x14,%esp
c0104955:	5b                   	pop    %ebx
c0104956:	5d                   	pop    %ebp
c0104957:	c3                   	ret    
c0104958:	90                   	nop
c0104959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0104960 <__locale_charset>:
c0104960:	55                   	push   %ebp
c0104961:	b8 e0 a9 10 c0       	mov    $0xc010a9e0,%eax
c0104966:	89 e5                	mov    %esp,%ebp
c0104968:	5d                   	pop    %ebp
c0104969:	c3                   	ret    
c010496a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104970 <__locale_mb_cur_max>:
c0104970:	55                   	push   %ebp
c0104971:	a1 38 aa 10 c0       	mov    0xc010aa38,%eax
c0104976:	89 e5                	mov    %esp,%ebp
c0104978:	5d                   	pop    %ebp
c0104979:	c3                   	ret    
c010497a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104980 <__locale_msgcharset>:
c0104980:	55                   	push   %ebp
c0104981:	b8 c0 a9 10 c0       	mov    $0xc010a9c0,%eax
c0104986:	89 e5                	mov    %esp,%ebp
c0104988:	5d                   	pop    %ebp
c0104989:	c3                   	ret    
c010498a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0104990 <__locale_cjk_lang>:
c0104990:	55                   	push   %ebp
c0104991:	31 c0                	xor    %eax,%eax
c0104993:	89 e5                	mov    %esp,%ebp
c0104995:	5d                   	pop    %ebp
c0104996:	c3                   	ret    
c0104997:	89 f6                	mov    %esi,%esi
c0104999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01049a0 <_localeconv_r>:
c01049a0:	55                   	push   %ebp
c01049a1:	b8 00 aa 10 c0       	mov    $0xc010aa00,%eax
c01049a6:	89 e5                	mov    %esp,%ebp
c01049a8:	5d                   	pop    %ebp
c01049a9:	c3                   	ret    
c01049aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01049b0 <setlocale>:
c01049b0:	55                   	push   %ebp
c01049b1:	89 e5                	mov    %esp,%ebp
c01049b3:	83 ec 18             	sub    $0x18,%esp
c01049b6:	e8 35 cc ff ff       	call   c01015f0 <__getreent>
c01049bb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01049be:	89 54 24 08          	mov    %edx,0x8(%esp)
c01049c2:	8b 55 08             	mov    0x8(%ebp),%edx
c01049c5:	89 04 24             	mov    %eax,(%esp)
c01049c8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01049cc:	e8 1f ff ff ff       	call   c01048f0 <_setlocale_r>
c01049d1:	c9                   	leave  
c01049d2:	c3                   	ret    
c01049d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01049d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01049e0 <localeconv>:
c01049e0:	55                   	push   %ebp
c01049e1:	89 e5                	mov    %esp,%ebp
c01049e3:	83 ec 08             	sub    $0x8,%esp
c01049e6:	e8 05 cc ff ff       	call   c01015f0 <__getreent>
c01049eb:	b8 00 aa 10 c0       	mov    $0xc010aa00,%eax
c01049f0:	c9                   	leave  
c01049f1:	c3                   	ret    
c01049f2:	66 90                	xchg   %ax,%ax
c01049f4:	66 90                	xchg   %ax,%ax
c01049f6:	66 90                	xchg   %ax,%ax
c01049f8:	66 90                	xchg   %ax,%ax
c01049fa:	66 90                	xchg   %ax,%ax
c01049fc:	66 90                	xchg   %ax,%ax
c01049fe:	66 90                	xchg   %ax,%ax

c0104a00 <_malloc_r>:
c0104a00:	55                   	push   %ebp
c0104a01:	89 e5                	mov    %esp,%ebp
c0104a03:	57                   	push   %edi
c0104a04:	56                   	push   %esi
c0104a05:	53                   	push   %ebx
c0104a06:	83 ec 2c             	sub    $0x2c,%esp
c0104a09:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104a0c:	8d 50 0b             	lea    0xb(%eax),%edx
c0104a0f:	83 fa 16             	cmp    $0x16,%edx
c0104a12:	76 6c                	jbe    c0104a80 <_malloc_r+0x80>
c0104a14:	89 d7                	mov    %edx,%edi
c0104a16:	83 e7 f8             	and    $0xfffffff8,%edi
c0104a19:	89 fe                	mov    %edi,%esi
c0104a1b:	c1 ee 1f             	shr    $0x1f,%esi
c0104a1e:	39 c7                	cmp    %eax,%edi
c0104a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a23:	89 f2                	mov    %esi,%edx
c0104a25:	72 67                	jb     c0104a8e <_malloc_r+0x8e>
c0104a27:	84 d2                	test   %dl,%dl
c0104a29:	75 63                	jne    c0104a8e <_malloc_r+0x8e>
c0104a2b:	89 04 24             	mov    %eax,(%esp)
c0104a2e:	e8 ad 07 00 00       	call   c01051e0 <__malloc_lock>
c0104a33:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
c0104a39:	77 65                	ja     c0104aa0 <_malloc_r+0xa0>
c0104a3b:	89 fa                	mov    %edi,%edx
c0104a3d:	c1 ea 03             	shr    $0x3,%edx
c0104a40:	8d 04 d5 60 aa 10 c0 	lea    -0x3fef55a0(,%edx,8),%eax
c0104a47:	8b 58 0c             	mov    0xc(%eax),%ebx
c0104a4a:	39 c3                	cmp    %eax,%ebx
c0104a4c:	0f 84 3e 05 00 00    	je     c0104f90 <_malloc_r+0x590>
c0104a52:	8b 43 04             	mov    0x4(%ebx),%eax
c0104a55:	83 e0 fc             	and    $0xfffffffc,%eax
c0104a58:	8b 53 0c             	mov    0xc(%ebx),%edx
c0104a5b:	8b 4b 08             	mov    0x8(%ebx),%ecx
c0104a5e:	89 51 0c             	mov    %edx,0xc(%ecx)
c0104a61:	89 4a 08             	mov    %ecx,0x8(%edx)
c0104a64:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0104a69:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a6c:	89 04 24             	mov    %eax,(%esp)
c0104a6f:	e8 7c 07 00 00       	call   c01051f0 <__malloc_unlock>
c0104a74:	8d 43 08             	lea    0x8(%ebx),%eax
c0104a77:	83 c4 2c             	add    $0x2c,%esp
c0104a7a:	5b                   	pop    %ebx
c0104a7b:	5e                   	pop    %esi
c0104a7c:	5f                   	pop    %edi
c0104a7d:	5d                   	pop    %ebp
c0104a7e:	c3                   	ret    
c0104a7f:	90                   	nop
c0104a80:	bf 10 00 00 00       	mov    $0x10,%edi
c0104a85:	31 d2                	xor    %edx,%edx
c0104a87:	39 c7                	cmp    %eax,%edi
c0104a89:	8b 45 08             	mov    0x8(%ebp),%eax
c0104a8c:	73 99                	jae    c0104a27 <_malloc_r+0x27>
c0104a8e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0104a94:	83 c4 2c             	add    $0x2c,%esp
c0104a97:	31 c0                	xor    %eax,%eax
c0104a99:	5b                   	pop    %ebx
c0104a9a:	5e                   	pop    %esi
c0104a9b:	5f                   	pop    %edi
c0104a9c:	5d                   	pop    %ebp
c0104a9d:	c3                   	ret    
c0104a9e:	66 90                	xchg   %ax,%ax
c0104aa0:	89 fe                	mov    %edi,%esi
c0104aa2:	c1 ee 09             	shr    $0x9,%esi
c0104aa5:	85 f6                	test   %esi,%esi
c0104aa7:	0f 84 ab 01 00 00    	je     c0104c58 <_malloc_r+0x258>
c0104aad:	83 fe 04             	cmp    $0x4,%esi
c0104ab0:	0f 87 8a 03 00 00    	ja     c0104e40 <_malloc_r+0x440>
c0104ab6:	89 fe                	mov    %edi,%esi
c0104ab8:	c1 ee 06             	shr    $0x6,%esi
c0104abb:	83 c6 38             	add    $0x38,%esi
c0104abe:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104ac1:	8d 0c 85 60 aa 10 c0 	lea    -0x3fef55a0(,%eax,4),%ecx
c0104ac8:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104acb:	39 d9                	cmp    %ebx,%ecx
c0104acd:	75 18                	jne    c0104ae7 <_malloc_r+0xe7>
c0104acf:	eb 28                	jmp    c0104af9 <_malloc_r+0xf9>
c0104ad1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104ad8:	85 d2                	test   %edx,%edx
c0104ada:	0f 89 78 ff ff ff    	jns    c0104a58 <_malloc_r+0x58>
c0104ae0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104ae3:	39 d9                	cmp    %ebx,%ecx
c0104ae5:	74 12                	je     c0104af9 <_malloc_r+0xf9>
c0104ae7:	8b 43 04             	mov    0x4(%ebx),%eax
c0104aea:	83 e0 fc             	and    $0xfffffffc,%eax
c0104aed:	89 c2                	mov    %eax,%edx
c0104aef:	29 fa                	sub    %edi,%edx
c0104af1:	83 fa 0f             	cmp    $0xf,%edx
c0104af4:	7e e2                	jle    c0104ad8 <_malloc_r+0xd8>
c0104af6:	83 ee 01             	sub    $0x1,%esi
c0104af9:	8d 46 01             	lea    0x1(%esi),%eax
c0104afc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104aff:	8b 1d 70 aa 10 c0    	mov    0xc010aa70,%ebx
c0104b05:	a1 64 aa 10 c0       	mov    0xc010aa64,%eax
c0104b0a:	81 fb 68 aa 10 c0    	cmp    $0xc010aa68,%ebx
c0104b10:	74 6b                	je     c0104b7d <_malloc_r+0x17d>
c0104b12:	8b 73 04             	mov    0x4(%ebx),%esi
c0104b15:	83 e6 fc             	and    $0xfffffffc,%esi
c0104b18:	89 f0                	mov    %esi,%eax
c0104b1a:	29 f8                	sub    %edi,%eax
c0104b1c:	83 f8 0f             	cmp    $0xf,%eax
c0104b1f:	0f 8f a3 03 00 00    	jg     c0104ec8 <_malloc_r+0x4c8>
c0104b25:	85 c0                	test   %eax,%eax
c0104b27:	c7 05 74 aa 10 c0 68 	movl   $0xc010aa68,0xc010aa74
c0104b2e:	aa 10 c0 
c0104b31:	c7 05 70 aa 10 c0 68 	movl   $0xc010aa68,0xc010aa70
c0104b38:	aa 10 c0 
c0104b3b:	0f 89 27 01 00 00    	jns    c0104c68 <_malloc_r+0x268>
c0104b41:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
c0104b47:	0f 87 1b 03 00 00    	ja     c0104e68 <_malloc_r+0x468>
c0104b4d:	c1 ee 03             	shr    $0x3,%esi
c0104b50:	b8 01 00 00 00       	mov    $0x1,%eax
c0104b55:	89 f1                	mov    %esi,%ecx
c0104b57:	8d 14 f5 60 aa 10 c0 	lea    -0x3fef55a0(,%esi,8),%edx
c0104b5e:	c1 f9 02             	sar    $0x2,%ecx
c0104b61:	d3 e0                	shl    %cl,%eax
c0104b63:	8b 4a 08             	mov    0x8(%edx),%ecx
c0104b66:	0b 05 64 aa 10 c0    	or     0xc010aa64,%eax
c0104b6c:	89 53 0c             	mov    %edx,0xc(%ebx)
c0104b6f:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0104b72:	a3 64 aa 10 c0       	mov    %eax,0xc010aa64
c0104b77:	89 5a 08             	mov    %ebx,0x8(%edx)
c0104b7a:	89 59 0c             	mov    %ebx,0xc(%ecx)
c0104b7d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104b80:	be 01 00 00 00       	mov    $0x1,%esi
c0104b85:	c1 f9 02             	sar    $0x2,%ecx
c0104b88:	d3 e6                	shl    %cl,%esi
c0104b8a:	39 c6                	cmp    %eax,%esi
c0104b8c:	0f 87 f6 00 00 00    	ja     c0104c88 <_malloc_r+0x288>
c0104b92:	85 f0                	test   %esi,%eax
c0104b94:	0f 85 76 03 00 00    	jne    c0104f10 <_malloc_r+0x510>
c0104b9a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104b9d:	01 f6                	add    %esi,%esi
c0104b9f:	83 e2 fc             	and    $0xfffffffc,%edx
c0104ba2:	85 f0                	test   %esi,%eax
c0104ba4:	8d 4a 04             	lea    0x4(%edx),%ecx
c0104ba7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104baa:	0f 85 60 03 00 00    	jne    c0104f10 <_malloc_r+0x510>
c0104bb0:	89 ca                	mov    %ecx,%edx
c0104bb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104bb8:	01 f6                	add    %esi,%esi
c0104bba:	83 c2 04             	add    $0x4,%edx
c0104bbd:	85 f0                	test   %esi,%eax
c0104bbf:	74 f7                	je     c0104bb8 <_malloc_r+0x1b8>
c0104bc1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104bc4:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104bc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104bca:	8d 34 c5 60 aa 10 c0 	lea    -0x3fef55a0(,%eax,8),%esi
c0104bd1:	89 f1                	mov    %esi,%ecx
c0104bd3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104bd6:	8b 59 0c             	mov    0xc(%ecx),%ebx
c0104bd9:	39 d9                	cmp    %ebx,%ecx
c0104bdb:	75 1e                	jne    c0104bfb <_malloc_r+0x1fb>
c0104bdd:	e9 36 03 00 00       	jmp    c0104f18 <_malloc_r+0x518>
c0104be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104be8:	85 d2                	test   %edx,%edx
c0104bea:	0f 89 c0 03 00 00    	jns    c0104fb0 <_malloc_r+0x5b0>
c0104bf0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c0104bf3:	39 d9                	cmp    %ebx,%ecx
c0104bf5:	0f 84 1d 03 00 00    	je     c0104f18 <_malloc_r+0x518>
c0104bfb:	8b 43 04             	mov    0x4(%ebx),%eax
c0104bfe:	83 e0 fc             	and    $0xfffffffc,%eax
c0104c01:	89 c2                	mov    %eax,%edx
c0104c03:	29 fa                	sub    %edi,%edx
c0104c05:	83 fa 0f             	cmp    $0xf,%edx
c0104c08:	7e de                	jle    c0104be8 <_malloc_r+0x1e8>
c0104c0a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
c0104c0d:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
c0104c10:	83 cf 01             	or     $0x1,%edi
c0104c13:	8b 73 08             	mov    0x8(%ebx),%esi
c0104c16:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104c19:	89 4e 0c             	mov    %ecx,0xc(%esi)
c0104c1c:	89 71 08             	mov    %esi,0x8(%ecx)
c0104c1f:	89 d1                	mov    %edx,%ecx
c0104c21:	83 c9 01             	or     $0x1,%ecx
c0104c24:	a3 74 aa 10 c0       	mov    %eax,0xc010aa74
c0104c29:	a3 70 aa 10 c0       	mov    %eax,0xc010aa70
c0104c2e:	c7 40 0c 68 aa 10 c0 	movl   $0xc010aa68,0xc(%eax)
c0104c35:	c7 40 08 68 aa 10 c0 	movl   $0xc010aa68,0x8(%eax)
c0104c3c:	89 48 04             	mov    %ecx,0x4(%eax)
c0104c3f:	89 14 10             	mov    %edx,(%eax,%edx,1)
c0104c42:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c45:	89 04 24             	mov    %eax,(%esp)
c0104c48:	e8 a3 05 00 00       	call   c01051f0 <__malloc_unlock>
c0104c4d:	8d 43 08             	lea    0x8(%ebx),%eax
c0104c50:	e9 22 fe ff ff       	jmp    c0104a77 <_malloc_r+0x77>
c0104c55:	8d 76 00             	lea    0x0(%esi),%esi
c0104c58:	b8 7e 00 00 00       	mov    $0x7e,%eax
c0104c5d:	be 3f 00 00 00       	mov    $0x3f,%esi
c0104c62:	e9 5a fe ff ff       	jmp    c0104ac1 <_malloc_r+0xc1>
c0104c67:	90                   	nop
c0104c68:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c6b:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
c0104c70:	89 04 24             	mov    %eax,(%esp)
c0104c73:	e8 78 05 00 00       	call   c01051f0 <__malloc_unlock>
c0104c78:	83 c4 2c             	add    $0x2c,%esp
c0104c7b:	8d 43 08             	lea    0x8(%ebx),%eax
c0104c7e:	5b                   	pop    %ebx
c0104c7f:	5e                   	pop    %esi
c0104c80:	5f                   	pop    %edi
c0104c81:	5d                   	pop    %ebp
c0104c82:	c3                   	ret    
c0104c83:	90                   	nop
c0104c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104c88:	8b 1d 68 aa 10 c0    	mov    0xc010aa68,%ebx
c0104c8e:	8b 73 04             	mov    0x4(%ebx),%esi
c0104c91:	83 e6 fc             	and    $0xfffffffc,%esi
c0104c94:	39 f7                	cmp    %esi,%edi
c0104c96:	77 0d                	ja     c0104ca5 <_malloc_r+0x2a5>
c0104c98:	89 f0                	mov    %esi,%eax
c0104c9a:	29 f8                	sub    %edi,%eax
c0104c9c:	83 f8 0f             	cmp    $0xf,%eax
c0104c9f:	0f 8f 6b 01 00 00    	jg     c0104e10 <_malloc_r+0x410>
c0104ca5:	8b 0d 90 25 16 c0    	mov    0xc0162590,%ecx
c0104cab:	8d 04 33             	lea    (%ebx,%esi,1),%eax
c0104cae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104cb1:	01 f9                	add    %edi,%ecx
c0104cb3:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
c0104cb9:	83 c1 10             	add    $0x10,%ecx
c0104cbc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104cc1:	83 3d 40 aa 10 c0 ff 	cmpl   $0xffffffff,0xc010aa40
c0104cc8:	0f 44 c1             	cmove  %ecx,%eax
c0104ccb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104cce:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104cd5:	89 04 24             	mov    %eax,(%esp)
c0104cd8:	e8 03 13 00 00       	call   c0105fe0 <_sbrk_r>
c0104cdd:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104ce0:	89 c1                	mov    %eax,%ecx
c0104ce2:	0f 84 17 03 00 00    	je     c0104fff <_malloc_r+0x5ff>
c0104ce8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0104ceb:	0f 87 02 03 00 00    	ja     c0104ff3 <_malloc_r+0x5f3>
c0104cf1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104cf4:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104cfa:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
c0104cfd:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104d03:	0f 84 a9 03 00 00    	je     c01050b2 <_malloc_r+0x6b2>
c0104d09:	83 3d 40 aa 10 c0 ff 	cmpl   $0xffffffff,0xc010aa40
c0104d10:	0f 84 ca 03 00 00    	je     c01050e0 <_malloc_r+0x6e0>
c0104d16:	89 c8                	mov    %ecx,%eax
c0104d18:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104d1b:	01 d0                	add    %edx,%eax
c0104d1d:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0104d22:	89 c8                	mov    %ecx,%eax
c0104d24:	ba 00 10 00 00       	mov    $0x1000,%edx
c0104d29:	83 e0 07             	and    $0x7,%eax
c0104d2c:	74 0c                	je     c0104d3a <_malloc_r+0x33a>
c0104d2e:	29 c1                	sub    %eax,%ecx
c0104d30:	ba 08 10 00 00       	mov    $0x1008,%edx
c0104d35:	8d 49 08             	lea    0x8(%ecx),%ecx
c0104d38:	29 c2                	sub    %eax,%edx
c0104d3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104d3d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104d40:	01 c8                	add    %ecx,%eax
c0104d42:	25 ff 0f 00 00       	and    $0xfff,%eax
c0104d47:	29 c2                	sub    %eax,%edx
c0104d49:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d4c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104d50:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0104d53:	89 04 24             	mov    %eax,(%esp)
c0104d56:	e8 85 12 00 00       	call   c0105fe0 <_sbrk_r>
c0104d5b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0104d5e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0104d61:	0f 84 6d 03 00 00    	je     c01050d4 <_malloc_r+0x6d4>
c0104d67:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104d6a:	29 c8                	sub    %ecx,%eax
c0104d6c:	01 d0                	add    %edx,%eax
c0104d6e:	83 c8 01             	or     $0x1,%eax
c0104d71:	03 15 60 25 16 c0    	add    0xc0162560,%edx
c0104d77:	81 fb 60 aa 10 c0    	cmp    $0xc010aa60,%ebx
c0104d7d:	89 0d 68 aa 10 c0    	mov    %ecx,0xc010aa68
c0104d83:	89 41 04             	mov    %eax,0x4(%ecx)
c0104d86:	89 15 60 25 16 c0    	mov    %edx,0xc0162560
c0104d8c:	0f 84 f2 02 00 00    	je     c0105084 <_malloc_r+0x684>
c0104d92:	83 fe 0f             	cmp    $0xf,%esi
c0104d95:	0f 86 8d 02 00 00    	jbe    c0105028 <_malloc_r+0x628>
c0104d9b:	8b 43 04             	mov    0x4(%ebx),%eax
c0104d9e:	83 ee 0c             	sub    $0xc,%esi
c0104da1:	83 e6 f8             	and    $0xfffffff8,%esi
c0104da4:	83 e0 01             	and    $0x1,%eax
c0104da7:	09 f0                	or     %esi,%eax
c0104da9:	83 fe 0f             	cmp    $0xf,%esi
c0104dac:	89 43 04             	mov    %eax,0x4(%ebx)
c0104daf:	a1 68 aa 10 c0       	mov    0xc010aa68,%eax
c0104db4:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
c0104dbb:	00 
c0104dbc:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
c0104dc3:	00 
c0104dc4:	0f 87 a2 02 00 00    	ja     c010506c <_malloc_r+0x66c>
c0104dca:	3b 15 8c 25 16 c0    	cmp    0xc016258c,%edx
c0104dd0:	76 06                	jbe    c0104dd8 <_malloc_r+0x3d8>
c0104dd2:	89 15 8c 25 16 c0    	mov    %edx,0xc016258c
c0104dd8:	3b 15 88 25 16 c0    	cmp    0xc0162588,%edx
c0104dde:	76 06                	jbe    c0104de6 <_malloc_r+0x3e6>
c0104de0:	89 15 88 25 16 c0    	mov    %edx,0xc0162588
c0104de6:	8b 50 04             	mov    0x4(%eax),%edx
c0104de9:	89 c3                	mov    %eax,%ebx
c0104deb:	83 e2 fc             	and    $0xfffffffc,%edx
c0104dee:	89 d0                	mov    %edx,%eax
c0104df0:	29 f8                	sub    %edi,%eax
c0104df2:	39 d7                	cmp    %edx,%edi
c0104df4:	77 05                	ja     c0104dfb <_malloc_r+0x3fb>
c0104df6:	83 f8 0f             	cmp    $0xf,%eax
c0104df9:	7f 15                	jg     c0104e10 <_malloc_r+0x410>
c0104dfb:	8b 45 08             	mov    0x8(%ebp),%eax
c0104dfe:	89 04 24             	mov    %eax,(%esp)
c0104e01:	e8 ea 03 00 00       	call   c01051f0 <__malloc_unlock>
c0104e06:	31 c0                	xor    %eax,%eax
c0104e08:	e9 6a fc ff ff       	jmp    c0104a77 <_malloc_r+0x77>
c0104e0d:	8d 76 00             	lea    0x0(%esi),%esi
c0104e10:	89 fa                	mov    %edi,%edx
c0104e12:	83 c8 01             	or     $0x1,%eax
c0104e15:	83 ca 01             	or     $0x1,%edx
c0104e18:	89 53 04             	mov    %edx,0x4(%ebx)
c0104e1b:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104e1e:	89 15 68 aa 10 c0    	mov    %edx,0xc010aa68
c0104e24:	89 42 04             	mov    %eax,0x4(%edx)
c0104e27:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e2a:	89 04 24             	mov    %eax,(%esp)
c0104e2d:	e8 be 03 00 00       	call   c01051f0 <__malloc_unlock>
c0104e32:	83 c4 2c             	add    $0x2c,%esp
c0104e35:	8d 43 08             	lea    0x8(%ebx),%eax
c0104e38:	5b                   	pop    %ebx
c0104e39:	5e                   	pop    %esi
c0104e3a:	5f                   	pop    %edi
c0104e3b:	5d                   	pop    %ebp
c0104e3c:	c3                   	ret    
c0104e3d:	8d 76 00             	lea    0x0(%esi),%esi
c0104e40:	83 fe 14             	cmp    $0x14,%esi
c0104e43:	0f 86 8f 01 00 00    	jbe    c0104fd8 <_malloc_r+0x5d8>
c0104e49:	83 fe 54             	cmp    $0x54,%esi
c0104e4c:	0f 87 be 01 00 00    	ja     c0105010 <_malloc_r+0x610>
c0104e52:	89 fe                	mov    %edi,%esi
c0104e54:	c1 ee 0c             	shr    $0xc,%esi
c0104e57:	83 c6 6e             	add    $0x6e,%esi
c0104e5a:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104e5d:	e9 5f fc ff ff       	jmp    c0104ac1 <_malloc_r+0xc1>
c0104e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104e68:	89 f1                	mov    %esi,%ecx
c0104e6a:	c1 e9 09             	shr    $0x9,%ecx
c0104e6d:	83 f9 04             	cmp    $0x4,%ecx
c0104e70:	0f 86 6d 01 00 00    	jbe    c0104fe3 <_malloc_r+0x5e3>
c0104e76:	83 f9 14             	cmp    $0x14,%ecx
c0104e79:	0f 87 0f 02 00 00    	ja     c010508e <_malloc_r+0x68e>
c0104e7f:	83 c1 5b             	add    $0x5b,%ecx
c0104e82:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0104e85:	8d 04 85 60 aa 10 c0 	lea    -0x3fef55a0(,%eax,4),%eax
c0104e8c:	8b 50 08             	mov    0x8(%eax),%edx
c0104e8f:	39 c2                	cmp    %eax,%edx
c0104e91:	0f 84 a1 01 00 00    	je     c0105038 <_malloc_r+0x638>
c0104e97:	90                   	nop
c0104e98:	8b 4a 04             	mov    0x4(%edx),%ecx
c0104e9b:	83 e1 fc             	and    $0xfffffffc,%ecx
c0104e9e:	39 ce                	cmp    %ecx,%esi
c0104ea0:	73 07                	jae    c0104ea9 <_malloc_r+0x4a9>
c0104ea2:	8b 52 08             	mov    0x8(%edx),%edx
c0104ea5:	39 d0                	cmp    %edx,%eax
c0104ea7:	75 ef                	jne    c0104e98 <_malloc_r+0x498>
c0104ea9:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0104eac:	a1 64 aa 10 c0       	mov    0xc010aa64,%eax
c0104eb1:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0104eb4:	89 53 08             	mov    %edx,0x8(%ebx)
c0104eb7:	89 59 08             	mov    %ebx,0x8(%ecx)
c0104eba:	89 5a 0c             	mov    %ebx,0xc(%edx)
c0104ebd:	e9 bb fc ff ff       	jmp    c0104b7d <_malloc_r+0x17d>
c0104ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104ec8:	89 c1                	mov    %eax,%ecx
c0104eca:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c0104ecd:	83 c9 01             	or     $0x1,%ecx
c0104ed0:	83 cf 01             	or     $0x1,%edi
c0104ed3:	89 7b 04             	mov    %edi,0x4(%ebx)
c0104ed6:	89 15 74 aa 10 c0    	mov    %edx,0xc010aa74
c0104edc:	89 15 70 aa 10 c0    	mov    %edx,0xc010aa70
c0104ee2:	c7 42 0c 68 aa 10 c0 	movl   $0xc010aa68,0xc(%edx)
c0104ee9:	c7 42 08 68 aa 10 c0 	movl   $0xc010aa68,0x8(%edx)
c0104ef0:	89 4a 04             	mov    %ecx,0x4(%edx)
c0104ef3:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0104ef6:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ef9:	89 04 24             	mov    %eax,(%esp)
c0104efc:	e8 ef 02 00 00       	call   c01051f0 <__malloc_unlock>
c0104f01:	8d 43 08             	lea    0x8(%ebx),%eax
c0104f04:	e9 6e fb ff ff       	jmp    c0104a77 <_malloc_r+0x77>
c0104f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104f10:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0104f13:	e9 af fc ff ff       	jmp    c0104bc7 <_malloc_r+0x1c7>
c0104f18:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0104f1c:	83 c1 08             	add    $0x8,%ecx
c0104f1f:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
c0104f23:	0f 85 ad fc ff ff    	jne    c0104bd6 <_malloc_r+0x1d6>
c0104f29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104f2c:	eb 12                	jmp    c0104f40 <_malloc_r+0x540>
c0104f2e:	66 90                	xchg   %ax,%ax
c0104f30:	8d 56 f8             	lea    -0x8(%esi),%edx
c0104f33:	8b 36                	mov    (%esi),%esi
c0104f35:	83 e8 01             	sub    $0x1,%eax
c0104f38:	39 d6                	cmp    %edx,%esi
c0104f3a:	0f 85 ea 01 00 00    	jne    c010512a <_malloc_r+0x72a>
c0104f40:	a8 03                	test   $0x3,%al
c0104f42:	75 ec                	jne    c0104f30 <_malloc_r+0x530>
c0104f44:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f47:	f7 d0                	not    %eax
c0104f49:	23 05 64 aa 10 c0    	and    0xc010aa64,%eax
c0104f4f:	a3 64 aa 10 c0       	mov    %eax,0xc010aa64
c0104f54:	d1 65 dc             	shll   -0x24(%ebp)
c0104f57:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104f5a:	39 c2                	cmp    %eax,%edx
c0104f5c:	0f 87 26 fd ff ff    	ja     c0104c88 <_malloc_r+0x288>
c0104f62:	85 d2                	test   %edx,%edx
c0104f64:	0f 84 1e fd ff ff    	je     c0104c88 <_malloc_r+0x288>
c0104f6a:	85 c2                	test   %eax,%edx
c0104f6c:	0f 85 c2 01 00 00    	jne    c0105134 <_malloc_r+0x734>
c0104f72:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0104f75:	89 f1                	mov    %esi,%ecx
c0104f77:	01 d2                	add    %edx,%edx
c0104f79:	83 c1 04             	add    $0x4,%ecx
c0104f7c:	85 d0                	test   %edx,%eax
c0104f7e:	74 f7                	je     c0104f77 <_malloc_r+0x577>
c0104f80:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0104f83:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0104f86:	e9 3c fc ff ff       	jmp    c0104bc7 <_malloc_r+0x1c7>
c0104f8b:	90                   	nop
c0104f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104f90:	8d 43 08             	lea    0x8(%ebx),%eax
c0104f93:	8b 5b 14             	mov    0x14(%ebx),%ebx
c0104f96:	39 d8                	cmp    %ebx,%eax
c0104f98:	0f 85 b4 fa ff ff    	jne    c0104a52 <_malloc_r+0x52>
c0104f9e:	8d 42 02             	lea    0x2(%edx),%eax
c0104fa1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104fa4:	e9 56 fb ff ff       	jmp    c0104aff <_malloc_r+0xff>
c0104fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104fb0:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0104fb5:	8b 53 08             	mov    0x8(%ebx),%edx
c0104fb8:	8b 43 0c             	mov    0xc(%ebx),%eax
c0104fbb:	89 42 0c             	mov    %eax,0xc(%edx)
c0104fbe:	89 50 08             	mov    %edx,0x8(%eax)
c0104fc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0104fc4:	89 04 24             	mov    %eax,(%esp)
c0104fc7:	e8 24 02 00 00       	call   c01051f0 <__malloc_unlock>
c0104fcc:	8d 43 08             	lea    0x8(%ebx),%eax
c0104fcf:	e9 a3 fa ff ff       	jmp    c0104a77 <_malloc_r+0x77>
c0104fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104fd8:	83 c6 5b             	add    $0x5b,%esi
c0104fdb:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0104fde:	e9 de fa ff ff       	jmp    c0104ac1 <_malloc_r+0xc1>
c0104fe3:	89 f1                	mov    %esi,%ecx
c0104fe5:	c1 e9 06             	shr    $0x6,%ecx
c0104fe8:	83 c1 38             	add    $0x38,%ecx
c0104feb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0104fee:	e9 92 fe ff ff       	jmp    c0104e85 <_malloc_r+0x485>
c0104ff3:	81 fb 60 aa 10 c0    	cmp    $0xc010aa60,%ebx
c0104ff9:	0f 84 f2 fc ff ff    	je     c0104cf1 <_malloc_r+0x2f1>
c0104fff:	8b 1d 68 aa 10 c0    	mov    0xc010aa68,%ebx
c0105005:	8b 53 04             	mov    0x4(%ebx),%edx
c0105008:	83 e2 fc             	and    $0xfffffffc,%edx
c010500b:	e9 de fd ff ff       	jmp    c0104dee <_malloc_r+0x3ee>
c0105010:	81 fe 54 01 00 00    	cmp    $0x154,%esi
c0105016:	77 3c                	ja     c0105054 <_malloc_r+0x654>
c0105018:	89 fe                	mov    %edi,%esi
c010501a:	c1 ee 0f             	shr    $0xf,%esi
c010501d:	83 c6 77             	add    $0x77,%esi
c0105020:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105023:	e9 99 fa ff ff       	jmp    c0104ac1 <_malloc_r+0xc1>
c0105028:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
c010502f:	89 cb                	mov    %ecx,%ebx
c0105031:	31 d2                	xor    %edx,%edx
c0105033:	e9 b6 fd ff ff       	jmp    c0104dee <_malloc_r+0x3ee>
c0105038:	c1 f9 02             	sar    $0x2,%ecx
c010503b:	b8 01 00 00 00       	mov    $0x1,%eax
c0105040:	d3 e0                	shl    %cl,%eax
c0105042:	89 d1                	mov    %edx,%ecx
c0105044:	0b 05 64 aa 10 c0    	or     0xc010aa64,%eax
c010504a:	a3 64 aa 10 c0       	mov    %eax,0xc010aa64
c010504f:	e9 5d fe ff ff       	jmp    c0104eb1 <_malloc_r+0x4b1>
c0105054:	81 fe 54 05 00 00    	cmp    $0x554,%esi
c010505a:	77 47                	ja     c01050a3 <_malloc_r+0x6a3>
c010505c:	89 fe                	mov    %edi,%esi
c010505e:	c1 ee 12             	shr    $0x12,%esi
c0105061:	83 c6 7c             	add    $0x7c,%esi
c0105064:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105067:	e9 55 fa ff ff       	jmp    c0104ac1 <_malloc_r+0xc1>
c010506c:	8b 45 08             	mov    0x8(%ebp),%eax
c010506f:	83 c3 08             	add    $0x8,%ebx
c0105072:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105076:	89 04 24             	mov    %eax,(%esp)
c0105079:	e8 c2 22 00 00       	call   c0107340 <_free_r>
c010507e:	8b 15 60 25 16 c0    	mov    0xc0162560,%edx
c0105084:	a1 68 aa 10 c0       	mov    0xc010aa68,%eax
c0105089:	e9 3c fd ff ff       	jmp    c0104dca <_malloc_r+0x3ca>
c010508e:	83 f9 54             	cmp    $0x54,%ecx
c0105091:	77 58                	ja     c01050eb <_malloc_r+0x6eb>
c0105093:	89 f1                	mov    %esi,%ecx
c0105095:	c1 e9 0c             	shr    $0xc,%ecx
c0105098:	83 c1 6e             	add    $0x6e,%ecx
c010509b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010509e:	e9 e2 fd ff ff       	jmp    c0104e85 <_malloc_r+0x485>
c01050a3:	b8 fc 00 00 00       	mov    $0xfc,%eax
c01050a8:	be 7e 00 00 00       	mov    $0x7e,%esi
c01050ad:	e9 0f fa ff ff       	jmp    c0104ac1 <_malloc_r+0xc1>
c01050b2:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
c01050b9:	0f 85 4a fc ff ff    	jne    c0104d09 <_malloc_r+0x309>
c01050bf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01050c2:	a1 68 aa 10 c0       	mov    0xc010aa68,%eax
c01050c7:	01 f1                	add    %esi,%ecx
c01050c9:	83 c9 01             	or     $0x1,%ecx
c01050cc:	89 48 04             	mov    %ecx,0x4(%eax)
c01050cf:	e9 f6 fc ff ff       	jmp    c0104dca <_malloc_r+0x3ca>
c01050d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01050d9:	31 d2                	xor    %edx,%edx
c01050db:	e9 91 fc ff ff       	jmp    c0104d71 <_malloc_r+0x371>
c01050e0:	89 0d 40 aa 10 c0    	mov    %ecx,0xc010aa40
c01050e6:	e9 37 fc ff ff       	jmp    c0104d22 <_malloc_r+0x322>
c01050eb:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c01050f1:	77 10                	ja     c0105103 <_malloc_r+0x703>
c01050f3:	89 f1                	mov    %esi,%ecx
c01050f5:	c1 e9 0f             	shr    $0xf,%ecx
c01050f8:	83 c1 77             	add    $0x77,%ecx
c01050fb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01050fe:	e9 82 fd ff ff       	jmp    c0104e85 <_malloc_r+0x485>
c0105103:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c0105109:	77 10                	ja     c010511b <_malloc_r+0x71b>
c010510b:	89 f1                	mov    %esi,%ecx
c010510d:	c1 e9 12             	shr    $0x12,%ecx
c0105110:	83 c1 7c             	add    $0x7c,%ecx
c0105113:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105116:	e9 6a fd ff ff       	jmp    c0104e85 <_malloc_r+0x485>
c010511b:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105120:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0105125:	e9 5b fd ff ff       	jmp    c0104e85 <_malloc_r+0x485>
c010512a:	a1 64 aa 10 c0       	mov    0xc010aa64,%eax
c010512f:	e9 20 fe ff ff       	jmp    c0104f54 <_malloc_r+0x554>
c0105134:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105137:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010513a:	e9 88 fa ff ff       	jmp    c0104bc7 <_malloc_r+0x1c7>
c010513f:	90                   	nop

c0105140 <memchr>:
c0105140:	55                   	push   %ebp
c0105141:	89 e5                	mov    %esp,%ebp
c0105143:	57                   	push   %edi
c0105144:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0105148:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010514b:	8b 7d 08             	mov    0x8(%ebp),%edi
c010514e:	31 d2                	xor    %edx,%edx
c0105150:	85 c9                	test   %ecx,%ecx
c0105152:	74 79                	je     c01051cd <L20>
c0105154:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010515a:	74 28                	je     c0105184 <L5>
c010515c:	3a 07                	cmp    (%edi),%al
c010515e:	74 6a                	je     c01051ca <L15>
c0105160:	47                   	inc    %edi
c0105161:	49                   	dec    %ecx
c0105162:	74 69                	je     c01051cd <L20>
c0105164:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010516a:	74 18                	je     c0105184 <L5>
c010516c:	3a 07                	cmp    (%edi),%al
c010516e:	74 5a                	je     c01051ca <L15>
c0105170:	47                   	inc    %edi
c0105171:	49                   	dec    %ecx
c0105172:	74 59                	je     c01051cd <L20>
c0105174:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010517a:	74 08                	je     c0105184 <L5>
c010517c:	3a 07                	cmp    (%edi),%al
c010517e:	74 4a                	je     c01051ca <L15>
c0105180:	47                   	inc    %edi
c0105181:	49                   	dec    %ecx
c0105182:	74 49                	je     c01051cd <L20>

c0105184 <L5>:
c0105184:	88 c4                	mov    %al,%ah
c0105186:	89 c2                	mov    %eax,%edx
c0105188:	c1 e2 10             	shl    $0x10,%edx
c010518b:	09 d0                	or     %edx,%eax
c010518d:	53                   	push   %ebx
c010518e:	66 90                	xchg   %ax,%ax

c0105190 <L8>:
c0105190:	83 e9 04             	sub    $0x4,%ecx
c0105193:	72 1c                	jb     c01051b1 <L9>
c0105195:	8b 17                	mov    (%edi),%edx
c0105197:	83 c7 04             	add    $0x4,%edi
c010519a:	31 c2                	xor    %eax,%edx
c010519c:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
c01051a2:	f7 d2                	not    %edx
c01051a4:	21 d3                	and    %edx,%ebx
c01051a6:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
c01051ac:	74 e2                	je     c0105190 <L8>
c01051ae:	83 ef 04             	sub    $0x4,%edi

c01051b1 <L9>:
c01051b1:	5b                   	pop    %ebx
c01051b2:	31 d2                	xor    %edx,%edx
c01051b4:	83 c1 04             	add    $0x4,%ecx
c01051b7:	74 14                	je     c01051cd <L20>
c01051b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01051c0 <L10>:
c01051c0:	3a 07                	cmp    (%edi),%al
c01051c2:	74 06                	je     c01051ca <L15>
c01051c4:	47                   	inc    %edi
c01051c5:	49                   	dec    %ecx
c01051c6:	75 f8                	jne    c01051c0 <L10>
c01051c8:	31 ff                	xor    %edi,%edi

c01051ca <L15>:
c01051ca:	4a                   	dec    %edx
c01051cb:	21 fa                	and    %edi,%edx

c01051cd <L20>:
c01051cd:	89 d0                	mov    %edx,%eax
c01051cf:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01051d2:	5f                   	pop    %edi
c01051d3:	c9                   	leave  
c01051d4:	c3                   	ret    
c01051d5:	66 90                	xchg   %ax,%ax
c01051d7:	66 90                	xchg   %ax,%ax
c01051d9:	66 90                	xchg   %ax,%ax
c01051db:	66 90                	xchg   %ax,%ax
c01051dd:	66 90                	xchg   %ax,%ax
c01051df:	90                   	nop

c01051e0 <__malloc_lock>:
c01051e0:	55                   	push   %ebp
c01051e1:	89 e5                	mov    %esp,%ebp
c01051e3:	5d                   	pop    %ebp
c01051e4:	c3                   	ret    
c01051e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01051e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01051f0 <__malloc_unlock>:
c01051f0:	55                   	push   %ebp
c01051f1:	89 e5                	mov    %esp,%ebp
c01051f3:	5d                   	pop    %ebp
c01051f4:	c3                   	ret    
c01051f5:	66 90                	xchg   %ax,%ax
c01051f7:	66 90                	xchg   %ax,%ax
c01051f9:	66 90                	xchg   %ax,%ax
c01051fb:	66 90                	xchg   %ax,%ax
c01051fd:	66 90                	xchg   %ax,%ax
c01051ff:	90                   	nop

c0105200 <_Balloc>:
c0105200:	55                   	push   %ebp
c0105201:	89 e5                	mov    %esp,%ebp
c0105203:	57                   	push   %edi
c0105204:	56                   	push   %esi
c0105205:	53                   	push   %ebx
c0105206:	83 ec 1c             	sub    $0x1c,%esp
c0105209:	8b 75 08             	mov    0x8(%ebp),%esi
c010520c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010520f:	8b 46 4c             	mov    0x4c(%esi),%eax
c0105212:	85 c0                	test   %eax,%eax
c0105214:	74 2a                	je     c0105240 <_Balloc+0x40>
c0105216:	8d 14 98             	lea    (%eax,%ebx,4),%edx
c0105219:	8b 02                	mov    (%edx),%eax
c010521b:	85 c0                	test   %eax,%eax
c010521d:	74 49                	je     c0105268 <_Balloc+0x68>
c010521f:	8b 08                	mov    (%eax),%ecx
c0105221:	89 0a                	mov    %ecx,(%edx)
c0105223:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c010522a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0105231:	83 c4 1c             	add    $0x1c,%esp
c0105234:	5b                   	pop    %ebx
c0105235:	5e                   	pop    %esi
c0105236:	5f                   	pop    %edi
c0105237:	5d                   	pop    %ebp
c0105238:	c3                   	ret    
c0105239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105240:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0105247:	00 
c0105248:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c010524f:	00 
c0105250:	89 34 24             	mov    %esi,(%esp)
c0105253:	e8 38 1f 00 00       	call   c0107190 <_calloc_r>
c0105258:	85 c0                	test   %eax,%eax
c010525a:	89 46 4c             	mov    %eax,0x4c(%esi)
c010525d:	75 b7                	jne    c0105216 <_Balloc+0x16>
c010525f:	31 c0                	xor    %eax,%eax
c0105261:	eb ce                	jmp    c0105231 <_Balloc+0x31>
c0105263:	90                   	nop
c0105264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105268:	89 d9                	mov    %ebx,%ecx
c010526a:	bf 01 00 00 00       	mov    $0x1,%edi
c010526f:	d3 e7                	shl    %cl,%edi
c0105271:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
c0105278:	89 44 24 08          	mov    %eax,0x8(%esp)
c010527c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105283:	00 
c0105284:	89 34 24             	mov    %esi,(%esp)
c0105287:	e8 04 1f 00 00       	call   c0107190 <_calloc_r>
c010528c:	85 c0                	test   %eax,%eax
c010528e:	74 cf                	je     c010525f <_Balloc+0x5f>
c0105290:	89 58 04             	mov    %ebx,0x4(%eax)
c0105293:	89 78 08             	mov    %edi,0x8(%eax)
c0105296:	eb 8b                	jmp    c0105223 <_Balloc+0x23>
c0105298:	90                   	nop
c0105299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01052a0 <_Bfree>:
c01052a0:	55                   	push   %ebp
c01052a1:	89 e5                	mov    %esp,%ebp
c01052a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052a6:	85 c0                	test   %eax,%eax
c01052a8:	74 12                	je     c01052bc <_Bfree+0x1c>
c01052aa:	8b 55 08             	mov    0x8(%ebp),%edx
c01052ad:	8b 48 04             	mov    0x4(%eax),%ecx
c01052b0:	8b 52 4c             	mov    0x4c(%edx),%edx
c01052b3:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
c01052b6:	8b 0a                	mov    (%edx),%ecx
c01052b8:	89 08                	mov    %ecx,(%eax)
c01052ba:	89 02                	mov    %eax,(%edx)
c01052bc:	5d                   	pop    %ebp
c01052bd:	c3                   	ret    
c01052be:	66 90                	xchg   %ax,%ax

c01052c0 <__multadd>:
c01052c0:	55                   	push   %ebp
c01052c1:	89 e5                	mov    %esp,%ebp
c01052c3:	57                   	push   %edi
c01052c4:	56                   	push   %esi
c01052c5:	53                   	push   %ebx
c01052c6:	83 ec 2c             	sub    $0x2c,%esp
c01052c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052cc:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01052cf:	8b 40 10             	mov    0x10(%eax),%eax
c01052d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01052d8:	8d 78 14             	lea    0x14(%eax),%edi
c01052db:	31 c0                	xor    %eax,%eax
c01052dd:	8d 76 00             	lea    0x0(%esi),%esi
c01052e0:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
c01052e3:	0f b7 d1             	movzwl %cx,%edx
c01052e6:	0f af 55 10          	imul   0x10(%ebp),%edx
c01052ea:	c1 e9 10             	shr    $0x10,%ecx
c01052ed:	0f af 4d 10          	imul   0x10(%ebp),%ecx
c01052f1:	01 da                	add    %ebx,%edx
c01052f3:	89 d3                	mov    %edx,%ebx
c01052f5:	0f b7 d2             	movzwl %dx,%edx
c01052f8:	c1 eb 10             	shr    $0x10,%ebx
c01052fb:	01 d9                	add    %ebx,%ecx
c01052fd:	89 ce                	mov    %ecx,%esi
c01052ff:	c1 e1 10             	shl    $0x10,%ecx
c0105302:	01 d1                	add    %edx,%ecx
c0105304:	c1 ee 10             	shr    $0x10,%esi
c0105307:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
c010530a:	83 c0 01             	add    $0x1,%eax
c010530d:	89 f3                	mov    %esi,%ebx
c010530f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105312:	7f cc                	jg     c01052e0 <__multadd+0x20>
c0105314:	85 f6                	test   %esi,%esi
c0105316:	74 1b                	je     c0105333 <__multadd+0x73>
c0105318:	8b 45 0c             	mov    0xc(%ebp),%eax
c010531b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
c010531e:	3b 78 08             	cmp    0x8(%eax),%edi
c0105321:	7d 1d                	jge    c0105340 <__multadd+0x80>
c0105323:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105326:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105329:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
c010532d:	83 c0 01             	add    $0x1,%eax
c0105330:	89 47 10             	mov    %eax,0x10(%edi)
c0105333:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105336:	83 c4 2c             	add    $0x2c,%esp
c0105339:	5b                   	pop    %ebx
c010533a:	5e                   	pop    %esi
c010533b:	5f                   	pop    %edi
c010533c:	5d                   	pop    %ebp
c010533d:	c3                   	ret    
c010533e:	66 90                	xchg   %ax,%ax
c0105340:	8b 40 04             	mov    0x4(%eax),%eax
c0105343:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105346:	83 c0 01             	add    $0x1,%eax
c0105349:	89 44 24 04          	mov    %eax,0x4(%esp)
c010534d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105350:	89 04 24             	mov    %eax,(%esp)
c0105353:	e8 a8 fe ff ff       	call   c0105200 <_Balloc>
c0105358:	89 c3                	mov    %eax,%ebx
c010535a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010535d:	8b 40 10             	mov    0x10(%eax),%eax
c0105360:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0105367:	89 44 24 08          	mov    %eax,0x8(%esp)
c010536b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010536e:	83 c0 0c             	add    $0xc,%eax
c0105371:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105375:	8d 43 0c             	lea    0xc(%ebx),%eax
c0105378:	89 04 24             	mov    %eax,(%esp)
c010537b:	e8 d0 c0 ff ff       	call   c0101450 <memcpy>
c0105380:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105383:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105386:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0105389:	8b 50 04             	mov    0x4(%eax),%edx
c010538c:	8b 45 08             	mov    0x8(%ebp),%eax
c010538f:	8b 40 4c             	mov    0x4c(%eax),%eax
c0105392:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105395:	8b 10                	mov    (%eax),%edx
c0105397:	89 17                	mov    %edx,(%edi)
c0105399:	89 38                	mov    %edi,(%eax)
c010539b:	eb 86                	jmp    c0105323 <__multadd+0x63>
c010539d:	8d 76 00             	lea    0x0(%esi),%esi

c01053a0 <__s2b>:
c01053a0:	55                   	push   %ebp
c01053a1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
c01053a6:	89 e5                	mov    %esp,%ebp
c01053a8:	57                   	push   %edi
c01053a9:	56                   	push   %esi
c01053aa:	53                   	push   %ebx
c01053ab:	83 ec 2c             	sub    $0x2c,%esp
c01053ae:	8b 45 14             	mov    0x14(%ebp),%eax
c01053b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01053b4:	8b 75 0c             	mov    0xc(%ebp),%esi
c01053b7:	8d 48 08             	lea    0x8(%eax),%ecx
c01053ba:	89 c8                	mov    %ecx,%eax
c01053bc:	f7 ea                	imul   %edx
c01053be:	c1 f9 1f             	sar    $0x1f,%ecx
c01053c1:	d1 fa                	sar    %edx
c01053c3:	29 ca                	sub    %ecx,%edx
c01053c5:	83 fa 01             	cmp    $0x1,%edx
c01053c8:	0f 8e be 00 00 00    	jle    c010548c <__s2b+0xec>
c01053ce:	b8 01 00 00 00       	mov    $0x1,%eax
c01053d3:	31 c9                	xor    %ecx,%ecx
c01053d5:	8d 76 00             	lea    0x0(%esi),%esi
c01053d8:	01 c0                	add    %eax,%eax
c01053da:	83 c1 01             	add    $0x1,%ecx
c01053dd:	39 c2                	cmp    %eax,%edx
c01053df:	7f f7                	jg     c01053d8 <__s2b+0x38>
c01053e1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01053e5:	89 1c 24             	mov    %ebx,(%esp)
c01053e8:	e8 13 fe ff ff       	call   c0105200 <_Balloc>
c01053ed:	8b 55 18             	mov    0x18(%ebp),%edx
c01053f0:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
c01053f4:	89 50 14             	mov    %edx,0x14(%eax)
c01053f7:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01053fe:	0f 8e 7c 00 00 00    	jle    c0105480 <__s2b+0xe0>
c0105404:	8d 4e 09             	lea    0x9(%esi),%ecx
c0105407:	03 75 10             	add    0x10(%ebp),%esi
c010540a:	89 cf                	mov    %ecx,%edi
c010540c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010540f:	90                   	nop
c0105410:	83 c7 01             	add    $0x1,%edi
c0105413:	0f be 57 ff          	movsbl -0x1(%edi),%edx
c0105417:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010541e:	00 
c010541f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105423:	89 1c 24             	mov    %ebx,(%esp)
c0105426:	83 ea 30             	sub    $0x30,%edx
c0105429:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010542d:	e8 8e fe ff ff       	call   c01052c0 <__multadd>
c0105432:	39 f7                	cmp    %esi,%edi
c0105434:	75 da                	jne    c0105410 <__s2b+0x70>
c0105436:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105439:	8b 7d 10             	mov    0x10(%ebp),%edi
c010543c:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
c0105440:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0105443:	39 4d 14             	cmp    %ecx,0x14(%ebp)
c0105446:	7e 2e                	jle    c0105476 <__s2b+0xd6>
c0105448:	8b 7d 14             	mov    0x14(%ebp),%edi
c010544b:	29 cf                	sub    %ecx,%edi
c010544d:	01 f7                	add    %esi,%edi
c010544f:	90                   	nop
c0105450:	83 c6 01             	add    $0x1,%esi
c0105453:	0f be 56 ff          	movsbl -0x1(%esi),%edx
c0105457:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c010545e:	00 
c010545f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105463:	89 1c 24             	mov    %ebx,(%esp)
c0105466:	83 ea 30             	sub    $0x30,%edx
c0105469:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010546d:	e8 4e fe ff ff       	call   c01052c0 <__multadd>
c0105472:	39 fe                	cmp    %edi,%esi
c0105474:	75 da                	jne    c0105450 <__s2b+0xb0>
c0105476:	83 c4 2c             	add    $0x2c,%esp
c0105479:	5b                   	pop    %ebx
c010547a:	5e                   	pop    %esi
c010547b:	5f                   	pop    %edi
c010547c:	5d                   	pop    %ebp
c010547d:	c3                   	ret    
c010547e:	66 90                	xchg   %ax,%ax
c0105480:	83 c6 0a             	add    $0xa,%esi
c0105483:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
c010548a:	eb b4                	jmp    c0105440 <__s2b+0xa0>
c010548c:	31 c9                	xor    %ecx,%ecx
c010548e:	e9 4e ff ff ff       	jmp    c01053e1 <__s2b+0x41>
c0105493:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01054a0 <__hi0bits>:
c01054a0:	55                   	push   %ebp
c01054a1:	31 c9                	xor    %ecx,%ecx
c01054a3:	89 e5                	mov    %esp,%ebp
c01054a5:	8b 55 08             	mov    0x8(%ebp),%edx
c01054a8:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
c01054ae:	75 05                	jne    c01054b5 <__hi0bits+0x15>
c01054b0:	c1 e2 10             	shl    $0x10,%edx
c01054b3:	b1 10                	mov    $0x10,%cl
c01054b5:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
c01054bb:	75 06                	jne    c01054c3 <__hi0bits+0x23>
c01054bd:	83 c1 08             	add    $0x8,%ecx
c01054c0:	c1 e2 08             	shl    $0x8,%edx
c01054c3:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
c01054c9:	75 06                	jne    c01054d1 <__hi0bits+0x31>
c01054cb:	83 c1 04             	add    $0x4,%ecx
c01054ce:	c1 e2 04             	shl    $0x4,%edx
c01054d1:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
c01054d7:	75 06                	jne    c01054df <__hi0bits+0x3f>
c01054d9:	83 c1 02             	add    $0x2,%ecx
c01054dc:	c1 e2 02             	shl    $0x2,%edx
c01054df:	85 d2                	test   %edx,%edx
c01054e1:	89 c8                	mov    %ecx,%eax
c01054e3:	78 0d                	js     c01054f2 <__hi0bits+0x52>
c01054e5:	81 e2 00 00 00 40    	and    $0x40000000,%edx
c01054eb:	b8 20 00 00 00       	mov    $0x20,%eax
c01054f0:	75 06                	jne    c01054f8 <__hi0bits+0x58>
c01054f2:	5d                   	pop    %ebp
c01054f3:	c3                   	ret    
c01054f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01054f8:	8d 41 01             	lea    0x1(%ecx),%eax
c01054fb:	5d                   	pop    %ebp
c01054fc:	c3                   	ret    
c01054fd:	8d 76 00             	lea    0x0(%esi),%esi

c0105500 <__lo0bits>:
c0105500:	55                   	push   %ebp
c0105501:	89 e5                	mov    %esp,%ebp
c0105503:	53                   	push   %ebx
c0105504:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105507:	8b 13                	mov    (%ebx),%edx
c0105509:	f6 c2 07             	test   $0x7,%dl
c010550c:	74 1a                	je     c0105528 <__lo0bits+0x28>
c010550e:	31 c0                	xor    %eax,%eax
c0105510:	f6 c2 01             	test   $0x1,%dl
c0105513:	75 0f                	jne    c0105524 <__lo0bits+0x24>
c0105515:	f6 c2 02             	test   $0x2,%dl
c0105518:	75 56                	jne    c0105570 <__lo0bits+0x70>
c010551a:	c1 ea 02             	shr    $0x2,%edx
c010551d:	b8 02 00 00 00       	mov    $0x2,%eax
c0105522:	89 13                	mov    %edx,(%ebx)
c0105524:	5b                   	pop    %ebx
c0105525:	5d                   	pop    %ebp
c0105526:	c3                   	ret    
c0105527:	90                   	nop
c0105528:	31 c9                	xor    %ecx,%ecx
c010552a:	66 85 d2             	test   %dx,%dx
c010552d:	75 05                	jne    c0105534 <__lo0bits+0x34>
c010552f:	c1 ea 10             	shr    $0x10,%edx
c0105532:	b1 10                	mov    $0x10,%cl
c0105534:	84 d2                	test   %dl,%dl
c0105536:	75 06                	jne    c010553e <__lo0bits+0x3e>
c0105538:	83 c1 08             	add    $0x8,%ecx
c010553b:	c1 ea 08             	shr    $0x8,%edx
c010553e:	f6 c2 0f             	test   $0xf,%dl
c0105541:	75 06                	jne    c0105549 <__lo0bits+0x49>
c0105543:	83 c1 04             	add    $0x4,%ecx
c0105546:	c1 ea 04             	shr    $0x4,%edx
c0105549:	f6 c2 03             	test   $0x3,%dl
c010554c:	75 06                	jne    c0105554 <__lo0bits+0x54>
c010554e:	83 c1 02             	add    $0x2,%ecx
c0105551:	c1 ea 02             	shr    $0x2,%edx
c0105554:	f6 c2 01             	test   $0x1,%dl
c0105557:	75 0c                	jne    c0105565 <__lo0bits+0x65>
c0105559:	d1 ea                	shr    %edx
c010555b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105560:	74 c2                	je     c0105524 <__lo0bits+0x24>
c0105562:	83 c1 01             	add    $0x1,%ecx
c0105565:	89 13                	mov    %edx,(%ebx)
c0105567:	89 c8                	mov    %ecx,%eax
c0105569:	5b                   	pop    %ebx
c010556a:	5d                   	pop    %ebp
c010556b:	c3                   	ret    
c010556c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105570:	d1 ea                	shr    %edx
c0105572:	b0 01                	mov    $0x1,%al
c0105574:	89 13                	mov    %edx,(%ebx)
c0105576:	5b                   	pop    %ebx
c0105577:	5d                   	pop    %ebp
c0105578:	c3                   	ret    
c0105579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105580 <__i2b>:
c0105580:	55                   	push   %ebp
c0105581:	89 e5                	mov    %esp,%ebp
c0105583:	83 ec 18             	sub    $0x18,%esp
c0105586:	8b 45 08             	mov    0x8(%ebp),%eax
c0105589:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105590:	00 
c0105591:	89 04 24             	mov    %eax,(%esp)
c0105594:	e8 67 fc ff ff       	call   c0105200 <_Balloc>
c0105599:	8b 55 0c             	mov    0xc(%ebp),%edx
c010559c:	89 50 14             	mov    %edx,0x14(%eax)
c010559f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c01055a6:	c9                   	leave  
c01055a7:	c3                   	ret    
c01055a8:	90                   	nop
c01055a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01055b0 <__multiply>:
c01055b0:	55                   	push   %ebp
c01055b1:	89 e5                	mov    %esp,%ebp
c01055b3:	57                   	push   %edi
c01055b4:	56                   	push   %esi
c01055b5:	53                   	push   %ebx
c01055b6:	83 ec 3c             	sub    $0x3c,%esp
c01055b9:	8b 75 0c             	mov    0xc(%ebp),%esi
c01055bc:	8b 45 10             	mov    0x10(%ebp),%eax
c01055bf:	8b 7e 10             	mov    0x10(%esi),%edi
c01055c2:	8b 58 10             	mov    0x10(%eax),%ebx
c01055c5:	39 df                	cmp    %ebx,%edi
c01055c7:	7d 0e                	jge    c01055d7 <__multiply+0x27>
c01055c9:	89 f8                	mov    %edi,%eax
c01055cb:	89 df                	mov    %ebx,%edi
c01055cd:	89 c3                	mov    %eax,%ebx
c01055cf:	89 f0                	mov    %esi,%eax
c01055d1:	8b 75 10             	mov    0x10(%ebp),%esi
c01055d4:	89 45 10             	mov    %eax,0x10(%ebp)
c01055d7:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
c01055da:	3b 46 08             	cmp    0x8(%esi),%eax
c01055dd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01055e0:	0f 9f c0             	setg   %al
c01055e3:	0f b6 c0             	movzbl %al,%eax
c01055e6:	03 46 04             	add    0x4(%esi),%eax
c01055e9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01055ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01055f0:	89 04 24             	mov    %eax,(%esp)
c01055f3:	e8 08 fc ff ff       	call   c0105200 <_Balloc>
c01055f8:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01055fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01055fe:	8d 40 14             	lea    0x14(%eax),%eax
c0105601:	8d 14 90             	lea    (%eax,%edx,4),%edx
c0105604:	89 d1                	mov    %edx,%ecx
c0105606:	39 c8                	cmp    %ecx,%eax
c0105608:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010560b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010560e:	73 15                	jae    c0105625 <__multiply+0x75>
c0105610:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105613:	90                   	nop
c0105614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105618:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010561e:	83 c0 04             	add    $0x4,%eax
c0105621:	39 c2                	cmp    %eax,%edx
c0105623:	77 f3                	ja     c0105618 <__multiply+0x68>
c0105625:	8d 46 14             	lea    0x14(%esi),%eax
c0105628:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010562b:	8d 04 b8             	lea    (%eax,%edi,4),%eax
c010562e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105631:	8b 45 10             	mov    0x10(%ebp),%eax
c0105634:	83 c0 14             	add    $0x14,%eax
c0105637:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
c010563a:	39 f8                	cmp    %edi,%eax
c010563c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010563f:	89 7d cc             	mov    %edi,-0x34(%ebp)
c0105642:	0f 83 e8 00 00 00    	jae    c0105730 <__multiply+0x180>
c0105648:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010564b:	8b 00                	mov    (%eax),%eax
c010564d:	0f b7 f8             	movzwl %ax,%edi
c0105650:	85 ff                	test   %edi,%edi
c0105652:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105655:	74 5a                	je     c01056b1 <__multiply+0x101>
c0105657:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010565a:	31 db                	xor    %ebx,%ebx
c010565c:	8b 75 d0             	mov    -0x30(%ebp),%esi
c010565f:	eb 09                	jmp    c010566a <__multiply+0xba>
c0105661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105668:	89 fa                	mov    %edi,%edx
c010566a:	8b 0e                	mov    (%esi),%ecx
c010566c:	83 c6 04             	add    $0x4,%esi
c010566f:	0f b7 3a             	movzwl (%edx),%edi
c0105672:	0f b7 c1             	movzwl %cx,%eax
c0105675:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
c0105679:	c1 e9 10             	shr    $0x10,%ecx
c010567c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105680:	01 f8                	add    %edi,%eax
c0105682:	01 d8                	add    %ebx,%eax
c0105684:	8b 1a                	mov    (%edx),%ebx
c0105686:	8d 7a 04             	lea    0x4(%edx),%edi
c0105689:	c1 eb 10             	shr    $0x10,%ebx
c010568c:	01 d9                	add    %ebx,%ecx
c010568e:	89 c3                	mov    %eax,%ebx
c0105690:	c1 eb 10             	shr    $0x10,%ebx
c0105693:	0f b7 c0             	movzwl %ax,%eax
c0105696:	01 d9                	add    %ebx,%ecx
c0105698:	89 cb                	mov    %ecx,%ebx
c010569a:	c1 e1 10             	shl    $0x10,%ecx
c010569d:	09 c1                	or     %eax,%ecx
c010569f:	c1 eb 10             	shr    $0x10,%ebx
c01056a2:	39 75 dc             	cmp    %esi,-0x24(%ebp)
c01056a5:	89 0a                	mov    %ecx,(%edx)
c01056a7:	77 bf                	ja     c0105668 <__multiply+0xb8>
c01056a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01056ac:	89 5a 04             	mov    %ebx,0x4(%edx)
c01056af:	8b 00                	mov    (%eax),%eax
c01056b1:	c1 e8 10             	shr    $0x10,%eax
c01056b4:	85 c0                	test   %eax,%eax
c01056b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01056b9:	74 61                	je     c010571c <__multiply+0x16c>
c01056bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01056be:	31 ff                	xor    %edi,%edi
c01056c0:	89 fe                	mov    %edi,%esi
c01056c2:	8b 10                	mov    (%eax),%edx
c01056c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01056c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01056ca:	89 d3                	mov    %edx,%ebx
c01056cc:	eb 05                	jmp    c01056d3 <__multiply+0x123>
c01056ce:	66 90                	xchg   %ax,%ax
c01056d0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01056d3:	0f b7 08             	movzwl (%eax),%ecx
c01056d6:	c1 eb 10             	shr    $0x10,%ebx
c01056d9:	0f b7 d2             	movzwl %dx,%edx
c01056dc:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c01056e0:	83 c0 04             	add    $0x4,%eax
c01056e3:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
c01056e6:	01 f7                	add    %esi,%edi
c01056e8:	8b 75 e0             	mov    -0x20(%ebp),%esi
c01056eb:	89 fb                	mov    %edi,%ebx
c01056ed:	c1 e3 10             	shl    $0x10,%ebx
c01056f0:	09 d3                	or     %edx,%ebx
c01056f2:	89 1e                	mov    %ebx,(%esi)
c01056f4:	8b 5e 04             	mov    0x4(%esi),%ebx
c01056f7:	8d 4e 04             	lea    0x4(%esi),%ecx
c01056fa:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
c01056fe:	c1 ef 10             	shr    $0x10,%edi
c0105701:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
c0105705:	0f b7 f3             	movzwl %bx,%esi
c0105708:	01 f2                	add    %esi,%edx
c010570a:	01 fa                	add    %edi,%edx
c010570c:	89 d6                	mov    %edx,%esi
c010570e:	c1 ee 10             	shr    $0x10,%esi
c0105711:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0105714:	77 ba                	ja     c01056d0 <__multiply+0x120>
c0105716:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105719:	89 50 04             	mov    %edx,0x4(%eax)
c010571c:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
c0105720:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105723:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c0105727:	39 45 cc             	cmp    %eax,-0x34(%ebp)
c010572a:	0f 87 18 ff ff ff    	ja     c0105648 <__multiply+0x98>
c0105730:	8b 75 c8             	mov    -0x38(%ebp),%esi
c0105733:	85 f6                	test   %esi,%esi
c0105735:	7e 29                	jle    c0105760 <__multiply+0x1b0>
c0105737:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c010573a:	8b 5f fc             	mov    -0x4(%edi),%ebx
c010573d:	85 db                	test   %ebx,%ebx
c010573f:	75 1f                	jne    c0105760 <__multiply+0x1b0>
c0105741:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105744:	89 d0                	mov    %edx,%eax
c0105746:	c1 e0 02             	shl    $0x2,%eax
c0105749:	29 c7                	sub    %eax,%edi
c010574b:	89 f8                	mov    %edi,%eax
c010574d:	eb 09                	jmp    c0105758 <__multiply+0x1a8>
c010574f:	90                   	nop
c0105750:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105754:	85 c9                	test   %ecx,%ecx
c0105756:	75 05                	jne    c010575d <__multiply+0x1ad>
c0105758:	83 ea 01             	sub    $0x1,%edx
c010575b:	75 f3                	jne    c0105750 <__multiply+0x1a0>
c010575d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105760:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0105763:	8b 7d c8             	mov    -0x38(%ebp),%edi
c0105766:	89 78 10             	mov    %edi,0x10(%eax)
c0105769:	83 c4 3c             	add    $0x3c,%esp
c010576c:	5b                   	pop    %ebx
c010576d:	5e                   	pop    %esi
c010576e:	5f                   	pop    %edi
c010576f:	5d                   	pop    %ebp
c0105770:	c3                   	ret    
c0105771:	eb 0d                	jmp    c0105780 <__pow5mult>
c0105773:	90                   	nop
c0105774:	90                   	nop
c0105775:	90                   	nop
c0105776:	90                   	nop
c0105777:	90                   	nop
c0105778:	90                   	nop
c0105779:	90                   	nop
c010577a:	90                   	nop
c010577b:	90                   	nop
c010577c:	90                   	nop
c010577d:	90                   	nop
c010577e:	90                   	nop
c010577f:	90                   	nop

c0105780 <__pow5mult>:
c0105780:	55                   	push   %ebp
c0105781:	89 e5                	mov    %esp,%ebp
c0105783:	57                   	push   %edi
c0105784:	56                   	push   %esi
c0105785:	53                   	push   %ebx
c0105786:	83 ec 2c             	sub    $0x2c,%esp
c0105789:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010578c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010578f:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105792:	89 d8                	mov    %ebx,%eax
c0105794:	83 e0 03             	and    $0x3,%eax
c0105797:	0f 85 a3 00 00 00    	jne    c0105840 <__pow5mult+0xc0>
c010579d:	c1 fb 02             	sar    $0x2,%ebx
c01057a0:	85 db                	test   %ebx,%ebx
c01057a2:	74 5c                	je     c0105800 <__pow5mult+0x80>
c01057a4:	8b 71 48             	mov    0x48(%ecx),%esi
c01057a7:	85 f6                	test   %esi,%esi
c01057a9:	0f 84 bd 00 00 00    	je     c010586c <__pow5mult+0xec>
c01057af:	f6 c3 01             	test   $0x1,%bl
c01057b2:	75 15                	jne    c01057c9 <__pow5mult+0x49>
c01057b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01057b8:	d1 fb                	sar    %ebx
c01057ba:	74 44                	je     c0105800 <__pow5mult+0x80>
c01057bc:	8b 06                	mov    (%esi),%eax
c01057be:	85 c0                	test   %eax,%eax
c01057c0:	74 4e                	je     c0105810 <__pow5mult+0x90>
c01057c2:	89 c6                	mov    %eax,%esi
c01057c4:	f6 c3 01             	test   $0x1,%bl
c01057c7:	74 ef                	je     c01057b8 <__pow5mult+0x38>
c01057c9:	89 0c 24             	mov    %ecx,(%esp)
c01057cc:	89 74 24 08          	mov    %esi,0x8(%esp)
c01057d0:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01057d4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01057d7:	e8 d4 fd ff ff       	call   c01055b0 <__multiply>
c01057dc:	85 ff                	test   %edi,%edi
c01057de:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01057e1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01057e4:	74 52                	je     c0105838 <__pow5mult+0xb8>
c01057e6:	8b 57 04             	mov    0x4(%edi),%edx
c01057e9:	d1 fb                	sar    %ebx
c01057eb:	8b 41 4c             	mov    0x4c(%ecx),%eax
c01057ee:	8d 04 90             	lea    (%eax,%edx,4),%eax
c01057f1:	8b 10                	mov    (%eax),%edx
c01057f3:	89 17                	mov    %edx,(%edi)
c01057f5:	89 38                	mov    %edi,(%eax)
c01057f7:	8b 7d e0             	mov    -0x20(%ebp),%edi
c01057fa:	75 c0                	jne    c01057bc <__pow5mult+0x3c>
c01057fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105800:	83 c4 2c             	add    $0x2c,%esp
c0105803:	89 f8                	mov    %edi,%eax
c0105805:	5b                   	pop    %ebx
c0105806:	5e                   	pop    %esi
c0105807:	5f                   	pop    %edi
c0105808:	5d                   	pop    %ebp
c0105809:	c3                   	ret    
c010580a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105810:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105814:	89 74 24 04          	mov    %esi,0x4(%esp)
c0105818:	89 0c 24             	mov    %ecx,(%esp)
c010581b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010581e:	e8 8d fd ff ff       	call   c01055b0 <__multiply>
c0105823:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105826:	89 06                	mov    %eax,(%esi)
c0105828:	89 c6                	mov    %eax,%esi
c010582a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105830:	eb 92                	jmp    c01057c4 <__pow5mult+0x44>
c0105832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105838:	8b 7d e0             	mov    -0x20(%ebp),%edi
c010583b:	e9 78 ff ff ff       	jmp    c01057b8 <__pow5mult+0x38>
c0105840:	8b 04 85 1c 83 10 c0 	mov    -0x3fef7ce4(,%eax,4),%eax
c0105847:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010584b:	89 0c 24             	mov    %ecx,(%esp)
c010584e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0105855:	00 
c0105856:	89 44 24 08          	mov    %eax,0x8(%esp)
c010585a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010585d:	e8 5e fa ff ff       	call   c01052c0 <__multadd>
c0105862:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105865:	89 c7                	mov    %eax,%edi
c0105867:	e9 31 ff ff ff       	jmp    c010579d <__pow5mult+0x1d>
c010586c:	89 0c 24             	mov    %ecx,(%esp)
c010586f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105876:	00 
c0105877:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010587a:	e8 81 f9 ff ff       	call   c0105200 <_Balloc>
c010587f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105882:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
c0105889:	89 c6                	mov    %eax,%esi
c010588b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105892:	89 41 48             	mov    %eax,0x48(%ecx)
c0105895:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010589b:	e9 0f ff ff ff       	jmp    c01057af <__pow5mult+0x2f>

c01058a0 <__lshift>:
c01058a0:	55                   	push   %ebp
c01058a1:	89 e5                	mov    %esp,%ebp
c01058a3:	57                   	push   %edi
c01058a4:	56                   	push   %esi
c01058a5:	53                   	push   %ebx
c01058a6:	83 ec 2c             	sub    $0x2c,%esp
c01058a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058ac:	8b 75 10             	mov    0x10(%ebp),%esi
c01058af:	89 c7                	mov    %eax,%edi
c01058b1:	8b 50 04             	mov    0x4(%eax),%edx
c01058b4:	8b 40 10             	mov    0x10(%eax),%eax
c01058b7:	89 f3                	mov    %esi,%ebx
c01058b9:	c1 fb 05             	sar    $0x5,%ebx
c01058bc:	01 d8                	add    %ebx,%eax
c01058be:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01058c1:	83 c0 01             	add    $0x1,%eax
c01058c4:	89 c1                	mov    %eax,%ecx
c01058c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01058c9:	8b 47 08             	mov    0x8(%edi),%eax
c01058cc:	39 c1                	cmp    %eax,%ecx
c01058ce:	7e 09                	jle    c01058d9 <__lshift+0x39>
c01058d0:	01 c0                	add    %eax,%eax
c01058d2:	83 c2 01             	add    $0x1,%edx
c01058d5:	39 c1                	cmp    %eax,%ecx
c01058d7:	7f f7                	jg     c01058d0 <__lshift+0x30>
c01058d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01058dc:	89 54 24 04          	mov    %edx,0x4(%esp)
c01058e0:	89 04 24             	mov    %eax,(%esp)
c01058e3:	e8 18 f9 ff ff       	call   c0105200 <_Balloc>
c01058e8:	85 db                	test   %ebx,%ebx
c01058ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01058ed:	8d 50 14             	lea    0x14(%eax),%edx
c01058f0:	7e 17                	jle    c0105909 <__lshift+0x69>
c01058f2:	31 c0                	xor    %eax,%eax
c01058f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01058f8:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
c01058ff:	83 c0 01             	add    $0x1,%eax
c0105902:	39 d8                	cmp    %ebx,%eax
c0105904:	75 f2                	jne    c01058f8 <__lshift+0x58>
c0105906:	8d 14 82             	lea    (%edx,%eax,4),%edx
c0105909:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010590c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010590f:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105912:	83 c0 14             	add    $0x14,%eax
c0105915:	83 e6 1f             	and    $0x1f,%esi
c0105918:	89 75 e0             	mov    %esi,-0x20(%ebp)
c010591b:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
c010591e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105921:	74 7d                	je     c01059a0 <__lshift+0x100>
c0105923:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
c010592a:	29 75 dc             	sub    %esi,-0x24(%ebp)
c010592d:	31 f6                	xor    %esi,%esi
c010592f:	eb 09                	jmp    c010593a <__lshift+0x9a>
c0105931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105938:	89 fa                	mov    %edi,%edx
c010593a:	8b 18                	mov    (%eax),%ebx
c010593c:	83 c0 04             	add    $0x4,%eax
c010593f:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105943:	8d 7a 04             	lea    0x4(%edx),%edi
c0105946:	d3 e3                	shl    %cl,%ebx
c0105948:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
c010594c:	09 f3                	or     %esi,%ebx
c010594e:	89 1a                	mov    %ebx,(%edx)
c0105950:	8b 70 fc             	mov    -0x4(%eax),%esi
c0105953:	d3 ee                	shr    %cl,%esi
c0105955:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105958:	77 de                	ja     c0105938 <__lshift+0x98>
c010595a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010595d:	89 72 04             	mov    %esi,0x4(%edx)
c0105960:	83 c0 02             	add    $0x2,%eax
c0105963:	85 f6                	test   %esi,%esi
c0105965:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
c0105969:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010596c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010596f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0105972:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105975:	83 e8 01             	sub    $0x1,%eax
c0105978:	89 47 10             	mov    %eax,0x10(%edi)
c010597b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010597e:	8b 50 04             	mov    0x4(%eax),%edx
c0105981:	8b 45 08             	mov    0x8(%ebp),%eax
c0105984:	8b 40 4c             	mov    0x4c(%eax),%eax
c0105987:	8d 04 90             	lea    (%eax,%edx,4),%eax
c010598a:	8b 10                	mov    (%eax),%edx
c010598c:	89 16                	mov    %edx,(%esi)
c010598e:	89 30                	mov    %esi,(%eax)
c0105990:	83 c4 2c             	add    $0x2c,%esp
c0105993:	89 f8                	mov    %edi,%eax
c0105995:	5b                   	pop    %ebx
c0105996:	5e                   	pop    %esi
c0105997:	5f                   	pop    %edi
c0105998:	5d                   	pop    %ebp
c0105999:	c3                   	ret    
c010599a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01059a0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01059a3:	90                   	nop
c01059a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01059a8:	83 c0 04             	add    $0x4,%eax
c01059ab:	8b 48 fc             	mov    -0x4(%eax),%ecx
c01059ae:	83 c2 04             	add    $0x4,%edx
c01059b1:	39 c3                	cmp    %eax,%ebx
c01059b3:	89 4a fc             	mov    %ecx,-0x4(%edx)
c01059b6:	77 f0                	ja     c01059a8 <__lshift+0x108>
c01059b8:	eb b2                	jmp    c010596c <__lshift+0xcc>
c01059ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01059c0 <__mcmp>:
c01059c0:	55                   	push   %ebp
c01059c1:	89 e5                	mov    %esp,%ebp
c01059c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01059c6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01059c9:	53                   	push   %ebx
c01059ca:	8b 41 10             	mov    0x10(%ecx),%eax
c01059cd:	8b 5a 10             	mov    0x10(%edx),%ebx
c01059d0:	29 d8                	sub    %ebx,%eax
c01059d2:	85 c0                	test   %eax,%eax
c01059d4:	75 27                	jne    c01059fd <__mcmp+0x3d>
c01059d6:	c1 e3 02             	shl    $0x2,%ebx
c01059d9:	83 c1 14             	add    $0x14,%ecx
c01059dc:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
c01059df:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
c01059e3:	eb 07                	jmp    c01059ec <__mcmp+0x2c>
c01059e5:	8d 76 00             	lea    0x0(%esi),%esi
c01059e8:	39 c1                	cmp    %eax,%ecx
c01059ea:	73 14                	jae    c0105a00 <__mcmp+0x40>
c01059ec:	83 ea 04             	sub    $0x4,%edx
c01059ef:	83 e8 04             	sub    $0x4,%eax
c01059f2:	8b 1a                	mov    (%edx),%ebx
c01059f4:	39 18                	cmp    %ebx,(%eax)
c01059f6:	74 f0                	je     c01059e8 <__mcmp+0x28>
c01059f8:	19 c0                	sbb    %eax,%eax
c01059fa:	83 c8 01             	or     $0x1,%eax
c01059fd:	5b                   	pop    %ebx
c01059fe:	5d                   	pop    %ebp
c01059ff:	c3                   	ret    
c0105a00:	31 c0                	xor    %eax,%eax
c0105a02:	5b                   	pop    %ebx
c0105a03:	5d                   	pop    %ebp
c0105a04:	c3                   	ret    
c0105a05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105a10 <__mdiff>:
c0105a10:	55                   	push   %ebp
c0105a11:	89 e5                	mov    %esp,%ebp
c0105a13:	57                   	push   %edi
c0105a14:	56                   	push   %esi
c0105a15:	53                   	push   %ebx
c0105a16:	83 ec 2c             	sub    $0x2c,%esp
c0105a19:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105a1c:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105a1f:	89 34 24             	mov    %esi,(%esp)
c0105a22:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105a26:	e8 95 ff ff ff       	call   c01059c0 <__mcmp>
c0105a2b:	85 c0                	test   %eax,%eax
c0105a2d:	0f 84 25 01 00 00    	je     c0105b58 <__mdiff+0x148>
c0105a33:	0f 88 0f 01 00 00    	js     c0105b48 <__mdiff+0x138>
c0105a39:	31 ff                	xor    %edi,%edi
c0105a3b:	8b 46 04             	mov    0x4(%esi),%eax
c0105a3e:	83 c6 14             	add    $0x14,%esi
c0105a41:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105a45:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a48:	89 04 24             	mov    %eax,(%esp)
c0105a4b:	e8 b0 f7 ff ff       	call   c0105200 <_Balloc>
c0105a50:	8d 4b 14             	lea    0x14(%ebx),%ecx
c0105a53:	89 c2                	mov    %eax,%edx
c0105a55:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105a58:	89 78 0c             	mov    %edi,0xc(%eax)
c0105a5b:	8b 46 fc             	mov    -0x4(%esi),%eax
c0105a5e:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0105a61:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105a64:	8d 04 86             	lea    (%esi,%eax,4),%eax
c0105a67:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105a6a:	8b 43 10             	mov    0x10(%ebx),%eax
c0105a6d:	31 db                	xor    %ebx,%ebx
c0105a6f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
c0105a72:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105a75:	89 d0                	mov    %edx,%eax
c0105a77:	83 c0 14             	add    $0x14,%eax
c0105a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105a80:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105a83:	83 c0 04             	add    $0x4,%eax
c0105a86:	83 c1 04             	add    $0x4,%ecx
c0105a89:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c0105a8d:	8b 3e                	mov    (%esi),%edi
c0105a8f:	8b 71 fc             	mov    -0x4(%ecx),%esi
c0105a92:	0f b7 d7             	movzwl %di,%edx
c0105a95:	01 da                	add    %ebx,%edx
c0105a97:	0f b7 de             	movzwl %si,%ebx
c0105a9a:	29 da                	sub    %ebx,%edx
c0105a9c:	c1 ef 10             	shr    $0x10,%edi
c0105a9f:	89 d3                	mov    %edx,%ebx
c0105aa1:	c1 ee 10             	shr    $0x10,%esi
c0105aa4:	0f b7 d2             	movzwl %dx,%edx
c0105aa7:	c1 fb 10             	sar    $0x10,%ebx
c0105aaa:	29 f7                	sub    %esi,%edi
c0105aac:	01 df                	add    %ebx,%edi
c0105aae:	89 fb                	mov    %edi,%ebx
c0105ab0:	c1 e7 10             	shl    $0x10,%edi
c0105ab3:	09 d7                	or     %edx,%edi
c0105ab5:	c1 fb 10             	sar    $0x10,%ebx
c0105ab8:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
c0105abb:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105abe:	77 c0                	ja     c0105a80 <__mdiff+0x70>
c0105ac0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0105ac3:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105ac6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ac9:	89 75 e0             	mov    %esi,-0x20(%ebp)
c0105acc:	39 f1                	cmp    %esi,%ecx
c0105ace:	76 3f                	jbe    c0105b0f <__mdiff+0xff>
c0105ad0:	8b 3e                	mov    (%esi),%edi
c0105ad2:	83 c6 04             	add    $0x4,%esi
c0105ad5:	83 c0 04             	add    $0x4,%eax
c0105ad8:	0f b7 d7             	movzwl %di,%edx
c0105adb:	01 da                	add    %ebx,%edx
c0105add:	89 d3                	mov    %edx,%ebx
c0105adf:	0f b7 d2             	movzwl %dx,%edx
c0105ae2:	c1 fb 10             	sar    $0x10,%ebx
c0105ae5:	c1 ef 10             	shr    $0x10,%edi
c0105ae8:	01 df                	add    %ebx,%edi
c0105aea:	89 fb                	mov    %edi,%ebx
c0105aec:	c1 e7 10             	shl    $0x10,%edi
c0105aef:	09 d7                	or     %edx,%edi
c0105af1:	c1 fb 10             	sar    $0x10,%ebx
c0105af4:	39 f1                	cmp    %esi,%ecx
c0105af6:	89 78 fc             	mov    %edi,-0x4(%eax)
c0105af9:	77 d5                	ja     c0105ad0 <__mdiff+0xc0>
c0105afb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105afe:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0105b01:	f7 d0                	not    %eax
c0105b03:	01 c8                	add    %ecx,%eax
c0105b05:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105b08:	c1 e8 02             	shr    $0x2,%eax
c0105b0b:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
c0105b0f:	85 ff                	test   %edi,%edi
c0105b11:	75 23                	jne    c0105b36 <__mdiff+0x126>
c0105b13:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105b16:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
c0105b1d:	29 d0                	sub    %edx,%eax
c0105b1f:	89 ca                	mov    %ecx,%edx
c0105b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105b28:	83 ea 01             	sub    $0x1,%edx
c0105b2b:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105b2f:	85 c9                	test   %ecx,%ecx
c0105b31:	74 f5                	je     c0105b28 <__mdiff+0x118>
c0105b33:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b36:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105b39:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0105b3c:	89 48 10             	mov    %ecx,0x10(%eax)
c0105b3f:	83 c4 2c             	add    $0x2c,%esp
c0105b42:	5b                   	pop    %ebx
c0105b43:	5e                   	pop    %esi
c0105b44:	5f                   	pop    %edi
c0105b45:	5d                   	pop    %ebp
c0105b46:	c3                   	ret    
c0105b47:	90                   	nop
c0105b48:	89 f0                	mov    %esi,%eax
c0105b4a:	bf 01 00 00 00       	mov    $0x1,%edi
c0105b4f:	89 de                	mov    %ebx,%esi
c0105b51:	89 c3                	mov    %eax,%ebx
c0105b53:	e9 e3 fe ff ff       	jmp    c0105a3b <__mdiff+0x2b>
c0105b58:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b5b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0105b62:	00 
c0105b63:	89 04 24             	mov    %eax,(%esp)
c0105b66:	e8 95 f6 ff ff       	call   c0105200 <_Balloc>
c0105b6b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105b72:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c0105b79:	83 c4 2c             	add    $0x2c,%esp
c0105b7c:	5b                   	pop    %ebx
c0105b7d:	5e                   	pop    %esi
c0105b7e:	5f                   	pop    %edi
c0105b7f:	5d                   	pop    %ebp
c0105b80:	c3                   	ret    
c0105b81:	eb 0d                	jmp    c0105b90 <__ulp>
c0105b83:	90                   	nop
c0105b84:	90                   	nop
c0105b85:	90                   	nop
c0105b86:	90                   	nop
c0105b87:	90                   	nop
c0105b88:	90                   	nop
c0105b89:	90                   	nop
c0105b8a:	90                   	nop
c0105b8b:	90                   	nop
c0105b8c:	90                   	nop
c0105b8d:	90                   	nop
c0105b8e:	90                   	nop
c0105b8f:	90                   	nop

c0105b90 <__ulp>:
c0105b90:	55                   	push   %ebp
c0105b91:	89 e5                	mov    %esp,%ebp
c0105b93:	83 ec 08             	sub    $0x8,%esp
c0105b96:	dd 45 08             	fldl   0x8(%ebp)
c0105b99:	dd 5d f8             	fstpl  -0x8(%ebp)
c0105b9c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c0105b9f:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
c0105ba5:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
c0105bab:	85 c9                	test   %ecx,%ecx
c0105bad:	7e 11                	jle    c0105bc0 <__ulp+0x30>
c0105baf:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c0105bb2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105bb9:	dd 45 f8             	fldl   -0x8(%ebp)
c0105bbc:	c9                   	leave  
c0105bbd:	c3                   	ret    
c0105bbe:	66 90                	xchg   %ax,%ax
c0105bc0:	f7 d9                	neg    %ecx
c0105bc2:	c1 f9 14             	sar    $0x14,%ecx
c0105bc5:	83 f9 13             	cmp    $0x13,%ecx
c0105bc8:	7e 26                	jle    c0105bf0 <__ulp+0x60>
c0105bca:	83 f9 32             	cmp    $0x32,%ecx
c0105bcd:	b8 01 00 00 00       	mov    $0x1,%eax
c0105bd2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105bd9:	7f 0b                	jg     c0105be6 <__ulp+0x56>
c0105bdb:	ba 33 00 00 00       	mov    $0x33,%edx
c0105be0:	29 ca                	sub    %ecx,%edx
c0105be2:	89 d1                	mov    %edx,%ecx
c0105be4:	d3 e0                	shl    %cl,%eax
c0105be6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105be9:	dd 45 f8             	fldl   -0x8(%ebp)
c0105bec:	c9                   	leave  
c0105bed:	c3                   	ret    
c0105bee:	66 90                	xchg   %ax,%ax
c0105bf0:	b8 00 00 08 00       	mov    $0x80000,%eax
c0105bf5:	d3 f8                	sar    %cl,%eax
c0105bf7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105bfa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0105c01:	dd 45 f8             	fldl   -0x8(%ebp)
c0105c04:	c9                   	leave  
c0105c05:	c3                   	ret    
c0105c06:	8d 76 00             	lea    0x0(%esi),%esi
c0105c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105c10 <__b2d>:
c0105c10:	55                   	push   %ebp
c0105c11:	89 e5                	mov    %esp,%ebp
c0105c13:	57                   	push   %edi
c0105c14:	56                   	push   %esi
c0105c15:	53                   	push   %ebx
c0105c16:	83 ec 18             	sub    $0x18,%esp
c0105c19:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c1c:	8d 78 14             	lea    0x14(%eax),%edi
c0105c1f:	8b 40 10             	mov    0x10(%eax),%eax
c0105c22:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
c0105c25:	8b 73 fc             	mov    -0x4(%ebx),%esi
c0105c28:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105c2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c2e:	89 34 24             	mov    %esi,(%esp)
c0105c31:	e8 6a f8 ff ff       	call   c01054a0 <__hi0bits>
c0105c36:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105c39:	ba 20 00 00 00       	mov    $0x20,%edx
c0105c3e:	29 c2                	sub    %eax,%edx
c0105c40:	83 f8 0a             	cmp    $0xa,%eax
c0105c43:	89 11                	mov    %edx,(%ecx)
c0105c45:	7f 41                	jg     c0105c88 <__b2d+0x78>
c0105c47:	b9 0b 00 00 00       	mov    $0xb,%ecx
c0105c4c:	89 f2                	mov    %esi,%edx
c0105c4e:	29 c1                	sub    %eax,%ecx
c0105c50:	d3 ea                	shr    %cl,%edx
c0105c52:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
c0105c58:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0105c5b:	31 d2                	xor    %edx,%edx
c0105c5d:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105c60:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105c67:	73 05                	jae    c0105c6e <__b2d+0x5e>
c0105c69:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105c6c:	d3 ea                	shr    %cl,%edx
c0105c6e:	8d 48 15             	lea    0x15(%eax),%ecx
c0105c71:	d3 e6                	shl    %cl,%esi
c0105c73:	09 f2                	or     %esi,%edx
c0105c75:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105c78:	dd 45 e8             	fldl   -0x18(%ebp)
c0105c7b:	83 c4 18             	add    $0x18,%esp
c0105c7e:	5b                   	pop    %ebx
c0105c7f:	5e                   	pop    %esi
c0105c80:	5f                   	pop    %edi
c0105c81:	5d                   	pop    %ebp
c0105c82:	c3                   	ret    
c0105c83:	90                   	nop
c0105c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105c88:	31 d2                	xor    %edx,%edx
c0105c8a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0105c8d:	73 09                	jae    c0105c98 <__b2d+0x88>
c0105c8f:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0105c92:	8d 4b f8             	lea    -0x8(%ebx),%ecx
c0105c95:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105c98:	89 c3                	mov    %eax,%ebx
c0105c9a:	83 eb 0b             	sub    $0xb,%ebx
c0105c9d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c0105ca0:	74 4e                	je     c0105cf0 <__b2d+0xe0>
c0105ca2:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105ca6:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0105cab:	29 c3                	sub    %eax,%ebx
c0105cad:	89 d0                	mov    %edx,%eax
c0105caf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105cb6:	d3 e6                	shl    %cl,%esi
c0105cb8:	89 d9                	mov    %ebx,%ecx
c0105cba:	d3 e8                	shr    %cl,%eax
c0105cbc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105cbf:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105cc5:	09 c6                	or     %eax,%esi
c0105cc7:	31 c0                	xor    %eax,%eax
c0105cc9:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105ccc:	39 f9                	cmp    %edi,%ecx
c0105cce:	76 07                	jbe    c0105cd7 <__b2d+0xc7>
c0105cd0:	8b 41 fc             	mov    -0x4(%ecx),%eax
c0105cd3:	89 d9                	mov    %ebx,%ecx
c0105cd5:	d3 e8                	shr    %cl,%eax
c0105cd7:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0105cdb:	d3 e2                	shl    %cl,%edx
c0105cdd:	09 d0                	or     %edx,%eax
c0105cdf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ce2:	dd 45 e8             	fldl   -0x18(%ebp)
c0105ce5:	83 c4 18             	add    $0x18,%esp
c0105ce8:	5b                   	pop    %ebx
c0105ce9:	5e                   	pop    %esi
c0105cea:	5f                   	pop    %edi
c0105ceb:	5d                   	pop    %ebp
c0105cec:	c3                   	ret    
c0105ced:	8d 76 00             	lea    0x0(%esi),%esi
c0105cf0:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c0105cf6:	89 75 ec             	mov    %esi,-0x14(%ebp)
c0105cf9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0105cfc:	dd 45 e8             	fldl   -0x18(%ebp)
c0105cff:	83 c4 18             	add    $0x18,%esp
c0105d02:	5b                   	pop    %ebx
c0105d03:	5e                   	pop    %esi
c0105d04:	5f                   	pop    %edi
c0105d05:	5d                   	pop    %ebp
c0105d06:	c3                   	ret    
c0105d07:	89 f6                	mov    %esi,%esi
c0105d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105d10 <__d2b>:
c0105d10:	55                   	push   %ebp
c0105d11:	89 e5                	mov    %esp,%ebp
c0105d13:	57                   	push   %edi
c0105d14:	56                   	push   %esi
c0105d15:	53                   	push   %ebx
c0105d16:	83 ec 2c             	sub    $0x2c,%esp
c0105d19:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d1c:	dd 45 0c             	fldl   0xc(%ebp)
c0105d1f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105d26:	00 
c0105d27:	dd 5d d0             	fstpl  -0x30(%ebp)
c0105d2a:	89 04 24             	mov    %eax,(%esp)
c0105d2d:	e8 ce f4 ff ff       	call   c0105200 <_Balloc>
c0105d32:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0105d35:	89 c6                	mov    %eax,%esi
c0105d37:	89 d8                	mov    %ebx,%eax
c0105d39:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
c0105d3f:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0105d44:	c1 eb 14             	shr    $0x14,%ebx
c0105d47:	85 db                	test   %ebx,%ebx
c0105d49:	74 05                	je     c0105d50 <__d2b+0x40>
c0105d4b:	0d 00 00 10 00       	or     $0x100000,%eax
c0105d50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d53:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105d56:	85 c0                	test   %eax,%eax
c0105d58:	74 56                	je     c0105db0 <__d2b+0xa0>
c0105d5a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d5d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105d60:	89 04 24             	mov    %eax,(%esp)
c0105d63:	e8 98 f7 ff ff       	call   c0105500 <__lo0bits>
c0105d68:	85 c0                	test   %eax,%eax
c0105d6a:	0f 85 90 00 00 00    	jne    c0105e00 <__d2b+0xf0>
c0105d70:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105d73:	89 56 14             	mov    %edx,0x14(%esi)
c0105d76:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105d79:	83 fa 01             	cmp    $0x1,%edx
c0105d7c:	19 ff                	sbb    %edi,%edi
c0105d7e:	83 c7 02             	add    $0x2,%edi
c0105d81:	85 db                	test   %ebx,%ebx
c0105d83:	89 56 18             	mov    %edx,0x18(%esi)
c0105d86:	89 7e 10             	mov    %edi,0x10(%esi)
c0105d89:	74 49                	je     c0105dd4 <__d2b+0xc4>
c0105d8b:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105d8e:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
c0105d95:	89 11                	mov    %edx,(%ecx)
c0105d97:	ba 35 00 00 00       	mov    $0x35,%edx
c0105d9c:	29 c2                	sub    %eax,%edx
c0105d9e:	8b 45 18             	mov    0x18(%ebp),%eax
c0105da1:	89 10                	mov    %edx,(%eax)
c0105da3:	83 c4 2c             	add    $0x2c,%esp
c0105da6:	89 f0                	mov    %esi,%eax
c0105da8:	5b                   	pop    %ebx
c0105da9:	5e                   	pop    %esi
c0105daa:	5f                   	pop    %edi
c0105dab:	5d                   	pop    %ebp
c0105dac:	c3                   	ret    
c0105dad:	8d 76 00             	lea    0x0(%esi),%esi
c0105db0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0105db3:	bf 01 00 00 00       	mov    $0x1,%edi
c0105db8:	89 04 24             	mov    %eax,(%esp)
c0105dbb:	e8 40 f7 ff ff       	call   c0105500 <__lo0bits>
c0105dc0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105dc3:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
c0105dca:	89 56 14             	mov    %edx,0x14(%esi)
c0105dcd:	83 c0 20             	add    $0x20,%eax
c0105dd0:	85 db                	test   %ebx,%ebx
c0105dd2:	75 b7                	jne    c0105d8b <__d2b+0x7b>
c0105dd4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0105dd7:	2d 32 04 00 00       	sub    $0x432,%eax
c0105ddc:	89 01                	mov    %eax,(%ecx)
c0105dde:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
c0105de2:	c1 e7 05             	shl    $0x5,%edi
c0105de5:	89 04 24             	mov    %eax,(%esp)
c0105de8:	e8 b3 f6 ff ff       	call   c01054a0 <__hi0bits>
c0105ded:	29 c7                	sub    %eax,%edi
c0105def:	8b 45 18             	mov    0x18(%ebp),%eax
c0105df2:	89 38                	mov    %edi,(%eax)
c0105df4:	83 c4 2c             	add    $0x2c,%esp
c0105df7:	89 f0                	mov    %esi,%eax
c0105df9:	5b                   	pop    %ebx
c0105dfa:	5e                   	pop    %esi
c0105dfb:	5f                   	pop    %edi
c0105dfc:	5d                   	pop    %ebp
c0105dfd:	c3                   	ret    
c0105dfe:	66 90                	xchg   %ax,%ax
c0105e00:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e03:	b9 20 00 00 00       	mov    $0x20,%ecx
c0105e08:	29 c1                	sub    %eax,%ecx
c0105e0a:	89 d7                	mov    %edx,%edi
c0105e0c:	d3 e7                	shl    %cl,%edi
c0105e0e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0105e11:	09 f9                	or     %edi,%ecx
c0105e13:	89 4e 14             	mov    %ecx,0x14(%esi)
c0105e16:	89 c1                	mov    %eax,%ecx
c0105e18:	d3 ea                	shr    %cl,%edx
c0105e1a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0105e1d:	e9 57 ff ff ff       	jmp    c0105d79 <__d2b+0x69>
c0105e22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105e30 <__ratio>:
c0105e30:	55                   	push   %ebp
c0105e31:	89 e5                	mov    %esp,%ebp
c0105e33:	56                   	push   %esi
c0105e34:	53                   	push   %ebx
c0105e35:	83 ec 30             	sub    $0x30,%esp
c0105e38:	8b 75 08             	mov    0x8(%ebp),%esi
c0105e3b:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0105e3e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105e41:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105e45:	89 34 24             	mov    %esi,(%esp)
c0105e48:	e8 c3 fd ff ff       	call   c0105c10 <__b2d>
c0105e4d:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0105e50:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105e54:	89 1c 24             	mov    %ebx,(%esp)
c0105e57:	dd 55 e0             	fstl   -0x20(%ebp)
c0105e5a:	dd 5d d8             	fstpl  -0x28(%ebp)
c0105e5d:	e8 ae fd ff ff       	call   c0105c10 <__b2d>
c0105e62:	8b 46 10             	mov    0x10(%esi),%eax
c0105e65:	2b 43 10             	sub    0x10(%ebx),%eax
c0105e68:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105e6b:	2b 55 f4             	sub    -0xc(%ebp),%edx
c0105e6e:	c1 e0 05             	shl    $0x5,%eax
c0105e71:	01 d0                	add    %edx,%eax
c0105e73:	dd 55 d0             	fstl   -0x30(%ebp)
c0105e76:	85 c0                	test   %eax,%eax
c0105e78:	dd 45 d8             	fldl   -0x28(%ebp)
c0105e7b:	7e 1b                	jle    c0105e98 <__ratio+0x68>
c0105e7d:	dd d8                	fstp   %st(0)
c0105e7f:	c1 e0 14             	shl    $0x14,%eax
c0105e82:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105e85:	dd 45 e0             	fldl   -0x20(%ebp)
c0105e88:	83 c4 30             	add    $0x30,%esp
c0105e8b:	5b                   	pop    %ebx
c0105e8c:	de f1                	fdivp  %st,%st(1)
c0105e8e:	5e                   	pop    %esi
c0105e8f:	5d                   	pop    %ebp
c0105e90:	c3                   	ret    
c0105e91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105e98:	dd d9                	fstp   %st(1)
c0105e9a:	c1 e0 14             	shl    $0x14,%eax
c0105e9d:	29 45 d4             	sub    %eax,-0x2c(%ebp)
c0105ea0:	dd 45 d0             	fldl   -0x30(%ebp)
c0105ea3:	83 c4 30             	add    $0x30,%esp
c0105ea6:	5b                   	pop    %ebx
c0105ea7:	de f9                	fdivrp %st,%st(1)
c0105ea9:	5e                   	pop    %esi
c0105eaa:	5d                   	pop    %ebp
c0105eab:	c3                   	ret    
c0105eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0105eb0 <_mprec_log10>:
c0105eb0:	55                   	push   %ebp
c0105eb1:	89 e5                	mov    %esp,%ebp
c0105eb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eb6:	83 f8 17             	cmp    $0x17,%eax
c0105eb9:	7e 1d                	jle    c0105ed8 <_mprec_log10+0x28>
c0105ebb:	d9 e8                	fld1   
c0105ebd:	d9 05 d8 82 10 c0    	flds   0xc01082d8
c0105ec3:	90                   	nop
c0105ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ec8:	83 e8 01             	sub    $0x1,%eax
c0105ecb:	dc c9                	fmul   %st,%st(1)
c0105ecd:	75 f9                	jne    c0105ec8 <_mprec_log10+0x18>
c0105ecf:	dd d8                	fstp   %st(0)
c0105ed1:	5d                   	pop    %ebp
c0105ed2:	c3                   	ret    
c0105ed3:	90                   	nop
c0105ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105ed8:	dd 04 c5 c0 83 10 c0 	fldl   -0x3fef7c40(,%eax,8)
c0105edf:	5d                   	pop    %ebp
c0105ee0:	c3                   	ret    
c0105ee1:	eb 0d                	jmp    c0105ef0 <__copybits>
c0105ee3:	90                   	nop
c0105ee4:	90                   	nop
c0105ee5:	90                   	nop
c0105ee6:	90                   	nop
c0105ee7:	90                   	nop
c0105ee8:	90                   	nop
c0105ee9:	90                   	nop
c0105eea:	90                   	nop
c0105eeb:	90                   	nop
c0105eec:	90                   	nop
c0105eed:	90                   	nop
c0105eee:	90                   	nop
c0105eef:	90                   	nop

c0105ef0 <__copybits>:
c0105ef0:	55                   	push   %ebp
c0105ef1:	89 e5                	mov    %esp,%ebp
c0105ef3:	57                   	push   %edi
c0105ef4:	8b 7d 10             	mov    0x10(%ebp),%edi
c0105ef7:	56                   	push   %esi
c0105ef8:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105efb:	8b 45 08             	mov    0x8(%ebp),%eax
c0105efe:	53                   	push   %ebx
c0105eff:	8b 4f 10             	mov    0x10(%edi),%ecx
c0105f02:	8d 56 ff             	lea    -0x1(%esi),%edx
c0105f05:	c1 fa 05             	sar    $0x5,%edx
c0105f08:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
c0105f0c:	8d 57 14             	lea    0x14(%edi),%edx
c0105f0f:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
c0105f12:	39 da                	cmp    %ebx,%edx
c0105f14:	73 34                	jae    c0105f4a <__copybits+0x5a>
c0105f16:	89 c1                	mov    %eax,%ecx
c0105f18:	83 c2 04             	add    $0x4,%edx
c0105f1b:	8b 42 fc             	mov    -0x4(%edx),%eax
c0105f1e:	83 c1 04             	add    $0x4,%ecx
c0105f21:	39 d3                	cmp    %edx,%ebx
c0105f23:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0105f26:	77 f0                	ja     c0105f18 <__copybits+0x28>
c0105f28:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f2b:	29 fb                	sub    %edi,%ebx
c0105f2d:	8d 53 eb             	lea    -0x15(%ebx),%edx
c0105f30:	c1 ea 02             	shr    $0x2,%edx
c0105f33:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
c0105f37:	39 c6                	cmp    %eax,%esi
c0105f39:	76 13                	jbe    c0105f4e <__copybits+0x5e>
c0105f3b:	90                   	nop
c0105f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105f40:	83 c0 04             	add    $0x4,%eax
c0105f43:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
c0105f4a:	39 c6                	cmp    %eax,%esi
c0105f4c:	77 f2                	ja     c0105f40 <__copybits+0x50>
c0105f4e:	5b                   	pop    %ebx
c0105f4f:	5e                   	pop    %esi
c0105f50:	5f                   	pop    %edi
c0105f51:	5d                   	pop    %ebp
c0105f52:	c3                   	ret    
c0105f53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105f60 <__any_on>:
c0105f60:	55                   	push   %ebp
c0105f61:	89 e5                	mov    %esp,%ebp
c0105f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f66:	57                   	push   %edi
c0105f67:	56                   	push   %esi
c0105f68:	53                   	push   %ebx
c0105f69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105f6c:	8d 50 14             	lea    0x14(%eax),%edx
c0105f6f:	8b 40 10             	mov    0x10(%eax),%eax
c0105f72:	c1 fb 05             	sar    $0x5,%ebx
c0105f75:	39 d8                	cmp    %ebx,%eax
c0105f77:	7d 2f                	jge    c0105fa8 <__any_on+0x48>
c0105f79:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
c0105f7c:	39 da                	cmp    %ebx,%edx
c0105f7e:	73 1d                	jae    c0105f9d <__any_on+0x3d>
c0105f80:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0105f83:	8b 5b fc             	mov    -0x4(%ebx),%ebx
c0105f86:	85 db                	test   %ebx,%ebx
c0105f88:	74 0f                	je     c0105f99 <__any_on+0x39>
c0105f8a:	eb 44                	jmp    c0105fd0 <__any_on+0x70>
c0105f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105f90:	83 e8 04             	sub    $0x4,%eax
c0105f93:	8b 08                	mov    (%eax),%ecx
c0105f95:	85 c9                	test   %ecx,%ecx
c0105f97:	75 37                	jne    c0105fd0 <__any_on+0x70>
c0105f99:	39 c2                	cmp    %eax,%edx
c0105f9b:	72 f3                	jb     c0105f90 <__any_on+0x30>
c0105f9d:	31 c0                	xor    %eax,%eax
c0105f9f:	5b                   	pop    %ebx
c0105fa0:	5e                   	pop    %esi
c0105fa1:	5f                   	pop    %edi
c0105fa2:	5d                   	pop    %ebp
c0105fa3:	c3                   	ret    
c0105fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105fa8:	7e 1e                	jle    c0105fc8 <__any_on+0x68>
c0105faa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0105fad:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0105fb0:	83 e1 1f             	and    $0x1f,%ecx
c0105fb3:	74 c7                	je     c0105f7c <__any_on+0x1c>
c0105fb5:	8b 3b                	mov    (%ebx),%edi
c0105fb7:	b8 01 00 00 00       	mov    $0x1,%eax
c0105fbc:	89 fe                	mov    %edi,%esi
c0105fbe:	d3 ee                	shr    %cl,%esi
c0105fc0:	d3 e6                	shl    %cl,%esi
c0105fc2:	39 fe                	cmp    %edi,%esi
c0105fc4:	75 d9                	jne    c0105f9f <__any_on+0x3f>
c0105fc6:	eb b4                	jmp    c0105f7c <__any_on+0x1c>
c0105fc8:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c0105fcb:	eb af                	jmp    c0105f7c <__any_on+0x1c>
c0105fcd:	8d 76 00             	lea    0x0(%esi),%esi
c0105fd0:	5b                   	pop    %ebx
c0105fd1:	b8 01 00 00 00       	mov    $0x1,%eax
c0105fd6:	5e                   	pop    %esi
c0105fd7:	5f                   	pop    %edi
c0105fd8:	5d                   	pop    %ebp
c0105fd9:	c3                   	ret    
c0105fda:	66 90                	xchg   %ax,%ax
c0105fdc:	66 90                	xchg   %ax,%ax
c0105fde:	66 90                	xchg   %ax,%ax

c0105fe0 <_sbrk_r>:
c0105fe0:	55                   	push   %ebp
c0105fe1:	89 e5                	mov    %esp,%ebp
c0105fe3:	83 ec 18             	sub    $0x18,%esp
c0105fe6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fe9:	c7 05 94 25 16 c0 00 	movl   $0x0,0xc0162594
c0105ff0:	00 00 00 
c0105ff3:	89 04 24             	mov    %eax,(%esp)
c0105ff6:	e8 25 af ff ff       	call   c0100f20 <sbrk>
c0105ffb:	83 f8 ff             	cmp    $0xffffffff,%eax
c0105ffe:	74 08                	je     c0106008 <_sbrk_r+0x28>
c0106000:	c9                   	leave  
c0106001:	c3                   	ret    
c0106002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106008:	8b 15 94 25 16 c0    	mov    0xc0162594,%edx
c010600e:	85 d2                	test   %edx,%edx
c0106010:	74 ee                	je     c0106000 <_sbrk_r+0x20>
c0106012:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106015:	89 11                	mov    %edx,(%ecx)
c0106017:	c9                   	leave  
c0106018:	c3                   	ret    
c0106019:	66 90                	xchg   %ax,%ax
c010601b:	66 90                	xchg   %ax,%ax
c010601d:	66 90                	xchg   %ax,%ax
c010601f:	90                   	nop

c0106020 <__fpclassifyd>:
c0106020:	55                   	push   %ebp
c0106021:	b8 02 00 00 00       	mov    $0x2,%eax
c0106026:	89 e5                	mov    %esp,%ebp
c0106028:	53                   	push   %ebx
c0106029:	83 ec 0c             	sub    $0xc,%esp
c010602c:	dd 45 08             	fldl   0x8(%ebp)
c010602f:	dd 5d f0             	fstpl  -0x10(%ebp)
c0106032:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106035:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0106038:	89 d3                	mov    %edx,%ebx
c010603a:	09 cb                	or     %ecx,%ebx
c010603c:	75 0a                	jne    c0106048 <__fpclassifyd+0x28>
c010603e:	83 c4 0c             	add    $0xc,%esp
c0106041:	5b                   	pop    %ebx
c0106042:	5d                   	pop    %ebp
c0106043:	c3                   	ret    
c0106044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106048:	85 d2                	test   %edx,%edx
c010604a:	0f 94 c2             	sete   %dl
c010604d:	75 08                	jne    c0106057 <__fpclassifyd+0x37>
c010604f:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
c0106055:	74 e7                	je     c010603e <__fpclassifyd+0x1e>
c0106057:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
c010605d:	b8 04 00 00 00       	mov    $0x4,%eax
c0106062:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
c0106068:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
c010606e:	76 ce                	jbe    c010603e <__fpclassifyd+0x1e>
c0106070:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
c0106076:	b0 03                	mov    $0x3,%al
c0106078:	76 c4                	jbe    c010603e <__fpclassifyd+0x1e>
c010607a:	31 c0                	xor    %eax,%eax
c010607c:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
c0106082:	0f 94 c0             	sete   %al
c0106085:	21 d0                	and    %edx,%eax
c0106087:	eb b5                	jmp    c010603e <__fpclassifyd+0x1e>
c0106089:	66 90                	xchg   %ax,%ax
c010608b:	66 90                	xchg   %ax,%ax
c010608d:	66 90                	xchg   %ax,%ax
c010608f:	90                   	nop

c0106090 <strcmp>:
c0106090:	55                   	push   %ebp
c0106091:	89 e5                	mov    %esp,%ebp
c0106093:	8b 45 08             	mov    0x8(%ebp),%eax
c0106096:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106099:	53                   	push   %ebx
c010609a:	89 c1                	mov    %eax,%ecx
c010609c:	09 d1                	or     %edx,%ecx
c010609e:	83 e1 03             	and    $0x3,%ecx
c01060a1:	75 17                	jne    c01060ba <strcmp+0x2a>
c01060a3:	8b 08                	mov    (%eax),%ecx
c01060a5:	3b 0a                	cmp    (%edx),%ecx
c01060a7:	74 33                	je     c01060dc <strcmp+0x4c>
c01060a9:	eb 0f                	jmp    c01060ba <strcmp+0x2a>
c01060ab:	90                   	nop
c01060ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060b0:	3a 0a                	cmp    (%edx),%cl
c01060b2:	75 0d                	jne    c01060c1 <strcmp+0x31>
c01060b4:	83 c0 01             	add    $0x1,%eax
c01060b7:	83 c2 01             	add    $0x1,%edx
c01060ba:	0f b6 08             	movzbl (%eax),%ecx
c01060bd:	84 c9                	test   %cl,%cl
c01060bf:	75 ef                	jne    c01060b0 <strcmp+0x20>
c01060c1:	0f b6 00             	movzbl (%eax),%eax
c01060c4:	0f b6 12             	movzbl (%edx),%edx
c01060c7:	5b                   	pop    %ebx
c01060c8:	5d                   	pop    %ebp
c01060c9:	29 d0                	sub    %edx,%eax
c01060cb:	c3                   	ret    
c01060cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060d0:	83 c0 04             	add    $0x4,%eax
c01060d3:	83 c2 04             	add    $0x4,%edx
c01060d6:	8b 08                	mov    (%eax),%ecx
c01060d8:	3b 0a                	cmp    (%edx),%ecx
c01060da:	75 de                	jne    c01060ba <strcmp+0x2a>
c01060dc:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
c01060e2:	f7 d1                	not    %ecx
c01060e4:	21 cb                	and    %ecx,%ebx
c01060e6:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
c01060ec:	74 e2                	je     c01060d0 <strcmp+0x40>
c01060ee:	31 c0                	xor    %eax,%eax
c01060f0:	5b                   	pop    %ebx
c01060f1:	5d                   	pop    %ebp
c01060f2:	c3                   	ret    
c01060f3:	66 90                	xchg   %ax,%ax
c01060f5:	66 90                	xchg   %ax,%ax
c01060f7:	66 90                	xchg   %ax,%ax
c01060f9:	66 90                	xchg   %ax,%ax
c01060fb:	66 90                	xchg   %ax,%ax
c01060fd:	66 90                	xchg   %ax,%ax
c01060ff:	90                   	nop

c0106100 <strlen>:
c0106100:	55                   	push   %ebp
c0106101:	89 e5                	mov    %esp,%ebp
c0106103:	57                   	push   %edi
c0106104:	8b 55 08             	mov    0x8(%ebp),%edx
c0106107:	89 d7                	mov    %edx,%edi
c0106109:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010610f:	74 25                	je     c0106136 <L5>
c0106111:	8a 0f                	mov    (%edi),%cl
c0106113:	47                   	inc    %edi
c0106114:	84 c9                	test   %cl,%cl
c0106116:	74 56                	je     c010616e <L15>
c0106118:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010611e:	74 16                	je     c0106136 <L5>
c0106120:	8a 0f                	mov    (%edi),%cl
c0106122:	47                   	inc    %edi
c0106123:	84 c9                	test   %cl,%cl
c0106125:	74 47                	je     c010616e <L15>
c0106127:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010612d:	74 07                	je     c0106136 <L5>
c010612f:	8a 0f                	mov    (%edi),%cl
c0106131:	47                   	inc    %edi
c0106132:	84 c9                	test   %cl,%cl
c0106134:	74 38                	je     c010616e <L15>

c0106136 <L5>:
c0106136:	83 ef 04             	sub    $0x4,%edi
c0106139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0106140 <L10>:
c0106140:	83 c7 04             	add    $0x4,%edi
c0106143:	8b 0f                	mov    (%edi),%ecx
c0106145:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
c010614b:	f7 d1                	not    %ecx
c010614d:	21 c8                	and    %ecx,%eax
c010614f:	a9 80 80 80 80       	test   $0x80808080,%eax
c0106154:	74 ea                	je     c0106140 <L10>
c0106156:	f7 d1                	not    %ecx
c0106158:	47                   	inc    %edi
c0106159:	84 c9                	test   %cl,%cl
c010615b:	74 11                	je     c010616e <L15>
c010615d:	47                   	inc    %edi
c010615e:	c1 e9 08             	shr    $0x8,%ecx
c0106161:	84 c9                	test   %cl,%cl
c0106163:	74 09                	je     c010616e <L15>
c0106165:	47                   	inc    %edi
c0106166:	c1 e9 08             	shr    $0x8,%ecx
c0106169:	84 c9                	test   %cl,%cl
c010616b:	74 01                	je     c010616e <L15>
c010616d:	47                   	inc    %edi

c010616e <L15>:
c010616e:	29 d7                	sub    %edx,%edi
c0106170:	8d 47 ff             	lea    -0x1(%edi),%eax
c0106173:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0106176:	5f                   	pop    %edi
c0106177:	c9                   	leave  
c0106178:	c3                   	ret    
c0106179:	66 90                	xchg   %ax,%ax
c010617b:	66 90                	xchg   %ax,%ax
c010617d:	66 90                	xchg   %ax,%ax
c010617f:	90                   	nop

c0106180 <__ssprint_r>:
c0106180:	55                   	push   %ebp
c0106181:	89 e5                	mov    %esp,%ebp
c0106183:	57                   	push   %edi
c0106184:	56                   	push   %esi
c0106185:	53                   	push   %ebx
c0106186:	83 ec 2c             	sub    $0x2c,%esp
c0106189:	8b 45 10             	mov    0x10(%ebp),%eax
c010618c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010618f:	8b 00                	mov    (%eax),%eax
c0106191:	89 c7                	mov    %eax,%edi
c0106193:	8b 45 10             	mov    0x10(%ebp),%eax
c0106196:	8b 40 08             	mov    0x8(%eax),%eax
c0106199:	85 c0                	test   %eax,%eax
c010619b:	0f 84 af 01 00 00    	je     c0106350 <__ssprint_r+0x1d0>
c01061a1:	31 c9                	xor    %ecx,%ecx
c01061a3:	31 d2                	xor    %edx,%edx
c01061a5:	8b 03                	mov    (%ebx),%eax
c01061a7:	89 ce                	mov    %ecx,%esi
c01061a9:	85 f6                	test   %esi,%esi
c01061ab:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01061ae:	0f 84 ec 00 00 00    	je     c01062a0 <__ssprint_r+0x120>
c01061b4:	8b 53 08             	mov    0x8(%ebx),%edx
c01061b7:	39 d6                	cmp    %edx,%esi
c01061b9:	0f 82 fc 00 00 00    	jb     c01062bb <__ssprint_r+0x13b>
c01061bf:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
c01061c3:	66 f7 c1 80 04       	test   $0x480,%cx
c01061c8:	0f 84 fa 00 00 00    	je     c01062c8 <__ssprint_r+0x148>
c01061ce:	8b 53 10             	mov    0x10(%ebx),%edx
c01061d1:	29 d0                	sub    %edx,%eax
c01061d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01061d6:	8b 43 14             	mov    0x14(%ebx),%eax
c01061d9:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01061dc:	8d 04 40             	lea    (%eax,%eax,2),%eax
c01061df:	89 c2                	mov    %eax,%edx
c01061e1:	c1 ea 1f             	shr    $0x1f,%edx
c01061e4:	01 d0                	add    %edx,%eax
c01061e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01061ec:	d1 7d e0             	sarl   -0x20(%ebp)
c01061ef:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
c01061f3:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c01061f6:	0f 83 34 01 00 00    	jae    c0106330 <__ssprint_r+0x1b0>
c01061fc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01061ff:	80 e5 04             	and    $0x4,%ch
c0106202:	0f 84 c8 00 00 00    	je     c01062d0 <__ssprint_r+0x150>
c0106208:	89 44 24 04          	mov    %eax,0x4(%esp)
c010620c:	8b 45 08             	mov    0x8(%ebp),%eax
c010620f:	89 04 24             	mov    %eax,(%esp)
c0106212:	e8 e9 e7 ff ff       	call   c0104a00 <_malloc_r>
c0106217:	85 c0                	test   %eax,%eax
c0106219:	89 c2                	mov    %eax,%edx
c010621b:	0f 84 e1 00 00 00    	je     c0106302 <__ssprint_r+0x182>
c0106221:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106224:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0106227:	89 44 24 08          	mov    %eax,0x8(%esp)
c010622b:	8b 43 10             	mov    0x10(%ebx),%eax
c010622e:	89 14 24             	mov    %edx,(%esp)
c0106231:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106235:	e8 16 b2 ff ff       	call   c0101450 <memcpy>
c010623a:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
c010623e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106241:	66 25 7f fb          	and    $0xfb7f,%ax
c0106245:	0c 80                	or     $0x80,%al
c0106247:	66 89 43 0c          	mov    %ax,0xc(%ebx)
c010624b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010624e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106251:	89 53 10             	mov    %edx,0x10(%ebx)
c0106254:	89 4b 14             	mov    %ecx,0x14(%ebx)
c0106257:	2b 4d dc             	sub    -0x24(%ebp),%ecx
c010625a:	01 d0                	add    %edx,%eax
c010625c:	89 03                	mov    %eax,(%ebx)
c010625e:	89 f2                	mov    %esi,%edx
c0106260:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0106263:	89 f1                	mov    %esi,%ecx
c0106265:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0106269:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c010626c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c010626f:	89 04 24             	mov    %eax,(%esp)
c0106272:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0106275:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0106279:	e8 22 13 00 00       	call   c01075a0 <memmove>
c010627e:	8b 03                	mov    (%ebx),%eax
c0106280:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0106283:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106286:	29 53 08             	sub    %edx,0x8(%ebx)
c0106289:	01 c8                	add    %ecx,%eax
c010628b:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010628e:	89 03                	mov    %eax,(%ebx)
c0106290:	8b 51 08             	mov    0x8(%ecx),%edx
c0106293:	29 f2                	sub    %esi,%edx
c0106295:	85 d2                	test   %edx,%edx
c0106297:	89 51 08             	mov    %edx,0x8(%ecx)
c010629a:	0f 84 98 00 00 00    	je     c0106338 <__ssprint_r+0x1b8>
c01062a0:	8b 77 04             	mov    0x4(%edi),%esi
c01062a3:	83 c7 08             	add    $0x8,%edi
c01062a6:	8b 4f f8             	mov    -0x8(%edi),%ecx
c01062a9:	85 f6                	test   %esi,%esi
c01062ab:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01062ae:	74 f0                	je     c01062a0 <__ssprint_r+0x120>
c01062b0:	8b 53 08             	mov    0x8(%ebx),%edx
c01062b3:	39 d6                	cmp    %edx,%esi
c01062b5:	0f 83 04 ff ff ff    	jae    c01061bf <__ssprint_r+0x3f>
c01062bb:	89 f2                	mov    %esi,%edx
c01062bd:	89 f1                	mov    %esi,%ecx
c01062bf:	eb a4                	jmp    c0106265 <__ssprint_r+0xe5>
c01062c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01062c8:	89 d1                	mov    %edx,%ecx
c01062ca:	eb 99                	jmp    c0106265 <__ssprint_r+0xe5>
c01062cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01062d0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01062d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01062d7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01062db:	8b 45 08             	mov    0x8(%ebp),%eax
c01062de:	89 04 24             	mov    %eax,(%esp)
c01062e1:	e8 4a 13 00 00       	call   c0107630 <_realloc_r>
c01062e6:	85 c0                	test   %eax,%eax
c01062e8:	89 c2                	mov    %eax,%edx
c01062ea:	0f 85 5b ff ff ff    	jne    c010624b <__ssprint_r+0xcb>
c01062f0:	8b 43 10             	mov    0x10(%ebx),%eax
c01062f3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01062f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01062fa:	89 04 24             	mov    %eax,(%esp)
c01062fd:	e8 3e 10 00 00       	call   c0107340 <_free_r>
c0106302:	8b 45 08             	mov    0x8(%ebp),%eax
c0106305:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010630b:	8b 45 10             	mov    0x10(%ebp),%eax
c010630e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
c0106313:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010631a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106321:	83 c4 2c             	add    $0x2c,%esp
c0106324:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106329:	5b                   	pop    %ebx
c010632a:	5e                   	pop    %esi
c010632b:	5f                   	pop    %edi
c010632c:	5d                   	pop    %ebp
c010632d:	c3                   	ret    
c010632e:	66 90                	xchg   %ax,%ax
c0106330:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106333:	e9 c7 fe ff ff       	jmp    c01061ff <__ssprint_r+0x7f>
c0106338:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
c010633f:	83 c4 2c             	add    $0x2c,%esp
c0106342:	31 c0                	xor    %eax,%eax
c0106344:	5b                   	pop    %ebx
c0106345:	5e                   	pop    %esi
c0106346:	5f                   	pop    %edi
c0106347:	5d                   	pop    %ebp
c0106348:	c3                   	ret    
c0106349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106350:	8b 45 10             	mov    0x10(%ebp),%eax
c0106353:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010635a:	83 c4 2c             	add    $0x2c,%esp
c010635d:	31 c0                	xor    %eax,%eax
c010635f:	5b                   	pop    %ebx
c0106360:	5e                   	pop    %esi
c0106361:	5f                   	pop    %edi
c0106362:	5d                   	pop    %ebp
c0106363:	c3                   	ret    
c0106364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c010636a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

c0106370 <_svfiprintf_r>:
c0106370:	55                   	push   %ebp
c0106371:	89 e5                	mov    %esp,%ebp
c0106373:	57                   	push   %edi
c0106374:	56                   	push   %esi
c0106375:	53                   	push   %ebx
c0106376:	81 ec cc 00 00 00    	sub    $0xcc,%esp
c010637c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010637f:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0106383:	74 0b                	je     c0106390 <_svfiprintf_r+0x20>
c0106385:	8b 50 10             	mov    0x10(%eax),%edx
c0106388:	85 d2                	test   %edx,%edx
c010638a:	0f 84 1c 0d 00 00    	je     c01070ac <_svfiprintf_r+0xd3c>
c0106390:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106393:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106396:	89 c6                	mov    %eax,%esi
c0106398:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c010639e:	29 d8                	sub    %ebx,%eax
c01063a0:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c01063a7:	00 00 00 
c01063aa:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01063b1:	00 00 00 
c01063b4:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01063bb:	00 00 00 
c01063be:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
c01063c5:	00 00 00 
c01063c8:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
c01063ce:	8b 45 10             	mov    0x10(%ebp),%eax
c01063d1:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01063d4:	0f b6 00             	movzbl (%eax),%eax
c01063d7:	84 c0                	test   %al,%al
c01063d9:	74 58                	je     c0106433 <_svfiprintf_r+0xc3>
c01063db:	3c 25                	cmp    $0x25,%al
c01063dd:	75 13                	jne    c01063f2 <_svfiprintf_r+0x82>
c01063df:	eb 52                	jmp    c0106433 <_svfiprintf_r+0xc3>
c01063e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01063e8:	84 c0                	test   %al,%al
c01063ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01063f0:	74 0a                	je     c01063fc <_svfiprintf_r+0x8c>
c01063f2:	83 c3 01             	add    $0x1,%ebx
c01063f5:	0f b6 03             	movzbl (%ebx),%eax
c01063f8:	3c 25                	cmp    $0x25,%al
c01063fa:	75 ec                	jne    c01063e8 <_svfiprintf_r+0x78>
c01063fc:	89 df                	mov    %ebx,%edi
c01063fe:	2b 7d 10             	sub    0x10(%ebp),%edi
c0106401:	74 30                	je     c0106433 <_svfiprintf_r+0xc3>
c0106403:	8b 45 10             	mov    0x10(%ebp),%eax
c0106406:	83 c6 08             	add    $0x8,%esi
c0106409:	89 7e fc             	mov    %edi,-0x4(%esi)
c010640c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
c0106412:	89 46 f8             	mov    %eax,-0x8(%esi)
c0106415:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010641b:	83 c0 01             	add    $0x1,%eax
c010641e:	83 f8 07             	cmp    $0x7,%eax
c0106421:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106427:	0f 8f eb 0a 00 00    	jg     c0106f18 <_svfiprintf_r+0xba8>
c010642d:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
c0106433:	80 3b 00             	cmpb   $0x0,(%ebx)
c0106436:	0f 84 11 09 00 00    	je     c0106d4d <_svfiprintf_r+0x9dd>
c010643c:	8d 43 01             	lea    0x1(%ebx),%eax
c010643f:	31 ff                	xor    %edi,%edi
c0106441:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106448:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c010644f:	ff ff ff 
c0106452:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0106459:	00 00 00 
c010645c:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
c0106463:	00 00 00 
c0106466:	8d 50 01             	lea    0x1(%eax),%edx
c0106469:	0f be 00             	movsbl (%eax),%eax
c010646c:	8d 48 e0             	lea    -0x20(%eax),%ecx
c010646f:	83 f9 58             	cmp    $0x58,%ecx
c0106472:	0f 87 63 03 00 00    	ja     c01067db <_svfiprintf_r+0x46b>
c0106478:	ff 24 8d 88 84 10 c0 	jmp    *-0x3fef7b78(,%ecx,4)
c010647f:	90                   	nop
c0106480:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106487:	89 d0                	mov    %edx,%eax
c0106489:	eb db                	jmp    c0106466 <_svfiprintf_r+0xf6>
c010648b:	8b 45 14             	mov    0x14(%ebp),%eax
c010648e:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0106491:	8b 00                	mov    (%eax),%eax
c0106493:	83 c3 04             	add    $0x4,%ebx
c0106496:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0106499:	85 c0                	test   %eax,%eax
c010649b:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
c01064a1:	79 e4                	jns    c0106487 <_svfiprintf_r+0x117>
c01064a3:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
c01064a9:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
c01064b0:	89 d0                	mov    %edx,%eax
c01064b2:	eb b2                	jmp    c0106466 <_svfiprintf_r+0xf6>
c01064b4:	bf 2b 00 00 00       	mov    $0x2b,%edi
c01064b9:	89 d0                	mov    %edx,%eax
c01064bb:	eb a9                	jmp    c0106466 <_svfiprintf_r+0xf6>
c01064bd:	8b 45 14             	mov    0x14(%ebp),%eax
c01064c0:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c01064c7:	89 55 10             	mov    %edx,0x10(%ebp)
c01064ca:	ba 02 00 00 00       	mov    $0x2,%edx
c01064cf:	8b 08                	mov    (%eax),%ecx
c01064d1:	83 c0 04             	add    $0x4,%eax
c01064d4:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c01064db:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
c01064e2:	89 45 14             	mov    %eax,0x14(%ebp)
c01064e5:	c7 85 44 ff ff ff 1f 	movl   $0xc010811f,-0xbc(%ebp)
c01064ec:	81 10 c0 
c01064ef:	90                   	nop
c01064f0:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c01064f7:	31 ff                	xor    %edi,%edi
c01064f9:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
c01064ff:	89 d8                	mov    %ebx,%eax
c0106501:	24 7f                	and    $0x7f,%al
c0106503:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
c010650a:	0f 48 c3             	cmovs  %ebx,%eax
c010650d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0106513:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106519:	85 c0                	test   %eax,%eax
c010651b:	75 08                	jne    c0106525 <_svfiprintf_r+0x1b5>
c010651d:	85 c9                	test   %ecx,%ecx
c010651f:	0f 84 03 08 00 00    	je     c0106d28 <_svfiprintf_r+0x9b8>
c0106525:	80 fa 01             	cmp    $0x1,%dl
c0106528:	0f 84 8a 0a 00 00    	je     c0106fb8 <_svfiprintf_r+0xc48>
c010652e:	80 fa 02             	cmp    $0x2,%dl
c0106531:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106534:	0f 85 86 01 00 00    	jne    c01066c0 <_svfiprintf_r+0x350>
c010653a:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0106540:	89 c8                	mov    %ecx,%eax
c0106542:	83 eb 01             	sub    $0x1,%ebx
c0106545:	83 e0 0f             	and    $0xf,%eax
c0106548:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
c010654c:	c1 e9 04             	shr    $0x4,%ecx
c010654f:	85 c9                	test   %ecx,%ecx
c0106551:	88 03                	mov    %al,(%ebx)
c0106553:	75 eb                	jne    c0106540 <_svfiprintf_r+0x1d0>
c0106555:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106558:	29 d8                	sub    %ebx,%eax
c010655a:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106560:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106566:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
c010656c:	39 c1                	cmp    %eax,%ecx
c010656e:	0f 4d c1             	cmovge %ecx,%eax
c0106571:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0106577:	89 f8                	mov    %edi,%eax
c0106579:	3c 01                	cmp    $0x1,%al
c010657b:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
c0106582:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106588:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
c010658e:	89 d0                	mov    %edx,%eax
c0106590:	89 cf                	mov    %ecx,%edi
c0106592:	83 c0 02             	add    $0x2,%eax
c0106595:	83 e7 02             	and    $0x2,%edi
c0106598:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
c010659e:	89 cf                	mov    %ecx,%edi
c01065a0:	0f 44 c2             	cmove  %edx,%eax
c01065a3:	81 e7 84 00 00 00    	and    $0x84,%edi
c01065a9:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01065af:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c01065b5:	0f 85 cd 04 00 00    	jne    c0106a88 <_svfiprintf_r+0x718>
c01065bb:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c01065c1:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c01065c7:	85 ff                	test   %edi,%edi
c01065c9:	0f 8e b9 04 00 00    	jle    c0106a88 <_svfiprintf_r+0x718>
c01065cf:	83 ff 10             	cmp    $0x10,%edi
c01065d2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01065d8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01065de:	7e 7c                	jle    c010665c <_svfiprintf_r+0x2ec>
c01065e0:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
c01065e6:	89 f1                	mov    %esi,%ecx
c01065e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01065eb:	8b 75 0c             	mov    0xc(%ebp),%esi
c01065ee:	eb 08                	jmp    c01065f8 <_svfiprintf_r+0x288>
c01065f0:	83 ef 10             	sub    $0x10,%edi
c01065f3:	83 ff 10             	cmp    $0x10,%edi
c01065f6:	7e 5c                	jle    c0106654 <_svfiprintf_r+0x2e4>
c01065f8:	83 c0 01             	add    $0x1,%eax
c01065fb:	83 c2 10             	add    $0x10,%edx
c01065fe:	c7 01 fc 85 10 c0    	movl   $0xc01085fc,(%ecx)
c0106604:	83 c1 08             	add    $0x8,%ecx
c0106607:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010660e:	83 f8 07             	cmp    $0x7,%eax
c0106611:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106617:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010661d:	7e d1                	jle    c01065f0 <_svfiprintf_r+0x280>
c010661f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106625:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106629:	89 74 24 04          	mov    %esi,0x4(%esp)
c010662d:	89 1c 24             	mov    %ebx,(%esp)
c0106630:	e8 4b fb ff ff       	call   c0106180 <__ssprint_r>
c0106635:	85 c0                	test   %eax,%eax
c0106637:	0f 85 3b 07 00 00    	jne    c0106d78 <_svfiprintf_r+0xa08>
c010663d:	83 ef 10             	sub    $0x10,%edi
c0106640:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106646:	83 ff 10             	cmp    $0x10,%edi
c0106649:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010664f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106652:	7f a4                	jg     c01065f8 <_svfiprintf_r+0x288>
c0106654:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
c010665a:	89 ce                	mov    %ecx,%esi
c010665c:	83 c0 01             	add    $0x1,%eax
c010665f:	01 fa                	add    %edi,%edx
c0106661:	c7 06 fc 85 10 c0    	movl   $0xc01085fc,(%esi)
c0106667:	83 c6 08             	add    $0x8,%esi
c010666a:	89 7e fc             	mov    %edi,-0x4(%esi)
c010666d:	83 f8 07             	cmp    $0x7,%eax
c0106670:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106676:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010667c:	0f 8e 12 04 00 00    	jle    c0106a94 <_svfiprintf_r+0x724>
c0106682:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106688:	89 44 24 08          	mov    %eax,0x8(%esp)
c010668c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010668f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106693:	8b 45 08             	mov    0x8(%ebp),%eax
c0106696:	89 04 24             	mov    %eax,(%esp)
c0106699:	e8 e2 fa ff ff       	call   c0106180 <__ssprint_r>
c010669e:	85 c0                	test   %eax,%eax
c01066a0:	0f 85 d2 06 00 00    	jne    c0106d78 <_svfiprintf_r+0xa08>
c01066a6:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01066ac:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01066af:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01066b5:	e9 da 03 00 00       	jmp    c0106a94 <_svfiprintf_r+0x724>
c01066ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01066c0:	89 c8                	mov    %ecx,%eax
c01066c2:	83 eb 01             	sub    $0x1,%ebx
c01066c5:	83 e0 07             	and    $0x7,%eax
c01066c8:	c1 e9 03             	shr    $0x3,%ecx
c01066cb:	83 c0 30             	add    $0x30,%eax
c01066ce:	85 c9                	test   %ecx,%ecx
c01066d0:	88 03                	mov    %al,(%ebx)
c01066d2:	75 ec                	jne    c01066c0 <_svfiprintf_r+0x350>
c01066d4:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c01066db:	89 da                	mov    %ebx,%edx
c01066dd:	0f 84 72 fe ff ff    	je     c0106555 <_svfiprintf_r+0x1e5>
c01066e3:	3c 30                	cmp    $0x30,%al
c01066e5:	0f 84 6a fe ff ff    	je     c0106555 <_svfiprintf_r+0x1e5>
c01066eb:	83 eb 01             	sub    $0x1,%ebx
c01066ee:	8d 45 a8             	lea    -0x58(%ebp),%eax
c01066f1:	29 d8                	sub    %ebx,%eax
c01066f3:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c01066f7:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01066fd:	e9 5e fe ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c0106702:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106709:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106710:	89 55 10             	mov    %edx,0x10(%ebp)
c0106713:	8b 45 14             	mov    0x14(%ebp),%eax
c0106716:	0f 85 48 01 00 00    	jne    c0106864 <_svfiprintf_r+0x4f4>
c010671c:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106723:	0f 84 3b 01 00 00    	je     c0106864 <_svfiprintf_r+0x4f4>
c0106729:	0f b7 08             	movzwl (%eax),%ecx
c010672c:	83 c0 04             	add    $0x4,%eax
c010672f:	31 d2                	xor    %edx,%edx
c0106731:	89 45 14             	mov    %eax,0x14(%ebp)
c0106734:	e9 b7 fd ff ff       	jmp    c01064f0 <_svfiprintf_r+0x180>
c0106739:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106740:	89 f8                	mov    %edi,%eax
c0106742:	89 55 10             	mov    %edx,0x10(%ebp)
c0106745:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c010674b:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106752:	8b 45 14             	mov    0x14(%ebp),%eax
c0106755:	75 0d                	jne    c0106764 <_svfiprintf_r+0x3f4>
c0106757:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c010675e:	0f 85 f2 08 00 00    	jne    c0107056 <_svfiprintf_r+0xce6>
c0106764:	8b 08                	mov    (%eax),%ecx
c0106766:	83 c0 04             	add    $0x4,%eax
c0106769:	89 45 14             	mov    %eax,0x14(%ebp)
c010676c:	85 c9                	test   %ecx,%ecx
c010676e:	0f 88 f3 08 00 00    	js     c0107067 <_svfiprintf_r+0xcf7>
c0106774:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010677b:	ba 01 00 00 00       	mov    $0x1,%edx
c0106780:	e9 74 fd ff ff       	jmp    c01064f9 <_svfiprintf_r+0x189>
c0106785:	0f be 02             	movsbl (%edx),%eax
c0106788:	8d 5a 01             	lea    0x1(%edx),%ebx
c010678b:	83 f8 2a             	cmp    $0x2a,%eax
c010678e:	0f 84 af 09 00 00    	je     c0107143 <_svfiprintf_r+0xdd3>
c0106794:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106797:	31 d2                	xor    %edx,%edx
c0106799:	83 f9 09             	cmp    $0x9,%ecx
c010679c:	0f 87 90 09 00 00    	ja     c0107132 <_svfiprintf_r+0xdc2>
c01067a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01067a8:	8d 04 92             	lea    (%edx,%edx,4),%eax
c01067ab:	83 c3 01             	add    $0x1,%ebx
c01067ae:	8d 14 41             	lea    (%ecx,%eax,2),%edx
c01067b1:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
c01067b5:	8d 48 d0             	lea    -0x30(%eax),%ecx
c01067b8:	83 f9 09             	cmp    $0x9,%ecx
c01067bb:	76 eb                	jbe    c01067a8 <_svfiprintf_r+0x438>
c01067bd:	85 d2                	test   %edx,%edx
c01067bf:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c01067c4:	0f 48 d1             	cmovs  %ecx,%edx
c01067c7:	8d 48 e0             	lea    -0x20(%eax),%ecx
c01067ca:	83 f9 58             	cmp    $0x58,%ecx
c01067cd:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
c01067d3:	89 da                	mov    %ebx,%edx
c01067d5:	0f 86 9d fc ff ff    	jbe    c0106478 <_svfiprintf_r+0x108>
c01067db:	89 fb                	mov    %edi,%ebx
c01067dd:	85 c0                	test   %eax,%eax
c01067df:	89 55 10             	mov    %edx,0x10(%ebp)
c01067e2:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c01067e8:	0f 84 5f 05 00 00    	je     c0106d4d <_svfiprintf_r+0x9dd>
c01067ee:	88 45 80             	mov    %al,-0x80(%ebp)
c01067f1:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c01067f4:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c01067fb:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106802:	00 00 00 
c0106805:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c010680c:	00 00 00 
c010680f:	e9 5a 01 00 00       	jmp    c010696e <_svfiprintf_r+0x5fe>
c0106814:	31 db                	xor    %ebx,%ebx
c0106816:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106820:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
c0106823:	83 c2 01             	add    $0x1,%edx
c0106826:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
c0106829:	0f be 42 ff          	movsbl -0x1(%edx),%eax
c010682d:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106830:	83 f9 09             	cmp    $0x9,%ecx
c0106833:	76 eb                	jbe    c0106820 <_svfiprintf_r+0x4b0>
c0106835:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
c010683b:	e9 2c fc ff ff       	jmp    c010646c <_svfiprintf_r+0xfc>
c0106840:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
c0106847:	00 00 00 
c010684a:	89 d0                	mov    %edx,%eax
c010684c:	e9 15 fc ff ff       	jmp    c0106466 <_svfiprintf_r+0xf6>
c0106851:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106858:	89 55 10             	mov    %edx,0x10(%ebp)
c010685b:	8b 45 14             	mov    0x14(%ebp),%eax
c010685e:	0f 84 b8 fe ff ff    	je     c010671c <_svfiprintf_r+0x3ac>
c0106864:	8b 08                	mov    (%eax),%ecx
c0106866:	83 c0 04             	add    $0x4,%eax
c0106869:	31 d2                	xor    %edx,%edx
c010686b:	89 45 14             	mov    %eax,0x14(%ebp)
c010686e:	e9 7d fc ff ff       	jmp    c01064f0 <_svfiprintf_r+0x180>
c0106873:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c010687a:	89 f8                	mov    %edi,%eax
c010687c:	89 55 10             	mov    %edx,0x10(%ebp)
c010687f:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106885:	0f 85 a2 07 00 00    	jne    c010702d <_svfiprintf_r+0xcbd>
c010688b:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106892:	0f 84 95 07 00 00    	je     c010702d <_svfiprintf_r+0xcbd>
c0106898:	8b 45 14             	mov    0x14(%ebp),%eax
c010689b:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
c01068a2:	8b 00                	mov    (%eax),%eax
c01068a4:	66 89 18             	mov    %bx,(%eax)
c01068a7:	8b 45 14             	mov    0x14(%ebp),%eax
c01068aa:	83 c0 04             	add    $0x4,%eax
c01068ad:	89 45 14             	mov    %eax,0x14(%ebp)
c01068b0:	e9 19 fb ff ff       	jmp    c01063ce <_svfiprintf_r+0x5e>
c01068b5:	89 fb                	mov    %edi,%ebx
c01068b7:	89 55 10             	mov    %edx,0x10(%ebp)
c01068ba:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c01068c0:	c7 85 44 ff ff ff 1f 	movl   $0xc010811f,-0xbc(%ebp)
c01068c7:	81 10 c0 
c01068ca:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01068d1:	8b 5d 14             	mov    0x14(%ebp),%ebx
c01068d4:	75 0d                	jne    c01068e3 <_svfiprintf_r+0x573>
c01068d6:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01068dd:	0f 85 65 07 00 00    	jne    c0107048 <_svfiprintf_r+0xcd8>
c01068e3:	8b 0b                	mov    (%ebx),%ecx
c01068e5:	83 c3 04             	add    $0x4,%ebx
c01068e8:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01068eb:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c01068f2:	ba 02 00 00 00       	mov    $0x2,%edx
c01068f7:	0f 84 f3 fb ff ff    	je     c01064f0 <_svfiprintf_r+0x180>
c01068fd:	85 c9                	test   %ecx,%ecx
c01068ff:	0f 84 eb fb ff ff    	je     c01064f0 <_svfiprintf_r+0x180>
c0106905:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c010690c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
c0106912:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106919:	e9 d2 fb ff ff       	jmp    c01064f0 <_svfiprintf_r+0x180>
c010691e:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
c0106925:	89 d0                	mov    %edx,%eax
c0106927:	e9 3a fb ff ff       	jmp    c0106466 <_svfiprintf_r+0xf6>
c010692c:	89 f8                	mov    %edi,%eax
c010692e:	89 55 10             	mov    %edx,0x10(%ebp)
c0106931:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106937:	e9 0f fe ff ff       	jmp    c010674b <_svfiprintf_r+0x3db>
c010693c:	8b 45 14             	mov    0x14(%ebp),%eax
c010693f:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106942:	89 55 10             	mov    %edx,0x10(%ebp)
c0106945:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c010694c:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106953:	00 00 00 
c0106956:	8b 00                	mov    (%eax),%eax
c0106958:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c010695f:	00 00 00 
c0106962:	88 45 80             	mov    %al,-0x80(%ebp)
c0106965:	8b 45 14             	mov    0x14(%ebp),%eax
c0106968:	83 c0 04             	add    $0x4,%eax
c010696b:	89 45 14             	mov    %eax,0x14(%ebp)
c010696e:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106975:	00 00 00 
c0106978:	e9 05 fc ff ff       	jmp    c0106582 <_svfiprintf_r+0x212>
c010697d:	89 fb                	mov    %edi,%ebx
c010697f:	89 55 10             	mov    %edx,0x10(%ebp)
c0106982:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106988:	c7 85 44 ff ff ff 0e 	movl   $0xc010810e,-0xbc(%ebp)
c010698f:	81 10 c0 
c0106992:	e9 33 ff ff ff       	jmp    c01068ca <_svfiprintf_r+0x55a>
c0106997:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c010699e:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01069a5:	89 55 10             	mov    %edx,0x10(%ebp)
c01069a8:	8b 45 14             	mov    0x14(%ebp),%eax
c01069ab:	75 39                	jne    c01069e6 <_svfiprintf_r+0x676>
c01069ad:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c01069b4:	74 30                	je     c01069e6 <_svfiprintf_r+0x676>
c01069b6:	0f b7 08             	movzwl (%eax),%ecx
c01069b9:	83 c0 04             	add    $0x4,%eax
c01069bc:	ba 01 00 00 00       	mov    $0x1,%edx
c01069c1:	89 45 14             	mov    %eax,0x14(%ebp)
c01069c4:	e9 27 fb ff ff       	jmp    c01064f0 <_svfiprintf_r+0x180>
c01069c9:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
c01069d0:	89 d0                	mov    %edx,%eax
c01069d2:	e9 8f fa ff ff       	jmp    c0106466 <_svfiprintf_r+0xf6>
c01069d7:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c01069de:	89 55 10             	mov    %edx,0x10(%ebp)
c01069e1:	8b 45 14             	mov    0x14(%ebp),%eax
c01069e4:	74 c7                	je     c01069ad <_svfiprintf_r+0x63d>
c01069e6:	8b 08                	mov    (%eax),%ecx
c01069e8:	83 c0 04             	add    $0x4,%eax
c01069eb:	ba 01 00 00 00       	mov    $0x1,%edx
c01069f0:	89 45 14             	mov    %eax,0x14(%ebp)
c01069f3:	e9 f8 fa ff ff       	jmp    c01064f0 <_svfiprintf_r+0x180>
c01069f8:	8b 45 14             	mov    0x14(%ebp),%eax
c01069fb:	89 55 10             	mov    %edx,0x10(%ebp)
c01069fe:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106a05:	8b 18                	mov    (%eax),%ebx
c0106a07:	8d 50 04             	lea    0x4(%eax),%edx
c0106a0a:	85 db                	test   %ebx,%ebx
c0106a0c:	0f 84 cc 06 00 00    	je     c01070de <_svfiprintf_r+0xd6e>
c0106a12:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106a18:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
c0106a1e:	85 ff                	test   %edi,%edi
c0106a20:	0f 88 59 06 00 00    	js     c010707f <_svfiprintf_r+0xd0f>
c0106a26:	89 7c 24 08          	mov    %edi,0x8(%esp)
c0106a2a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106a31:	00 
c0106a32:	89 1c 24             	mov    %ebx,(%esp)
c0106a35:	e8 06 e7 ff ff       	call   c0105140 <memchr>
c0106a3a:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106a40:	85 c0                	test   %eax,%eax
c0106a42:	0f 84 c5 06 00 00    	je     c010710d <_svfiprintf_r+0xd9d>
c0106a48:	29 d8                	sub    %ebx,%eax
c0106a4a:	39 f8                	cmp    %edi,%eax
c0106a4c:	0f 4f c7             	cmovg  %edi,%eax
c0106a4f:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0106a56:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106a5c:	89 55 14             	mov    %edx,0x14(%ebp)
c0106a5f:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0106a66:	00 00 00 
c0106a69:	e9 f2 fa ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c0106a6e:	89 f8                	mov    %edi,%eax
c0106a70:	84 c0                	test   %al,%al
c0106a72:	b8 20 00 00 00       	mov    $0x20,%eax
c0106a77:	0f 44 f8             	cmove  %eax,%edi
c0106a7a:	89 d0                	mov    %edx,%eax
c0106a7c:	e9 e5 f9 ff ff       	jmp    c0106466 <_svfiprintf_r+0xf6>
c0106a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106a88:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106a8e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106a94:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
c0106a9b:	74 2e                	je     c0106acb <_svfiprintf_r+0x75b>
c0106a9d:	83 c0 01             	add    $0x1,%eax
c0106aa0:	83 c2 01             	add    $0x1,%edx
c0106aa3:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
c0106aa9:	83 c6 08             	add    $0x8,%esi
c0106aac:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106aaf:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
c0106ab6:	83 f8 07             	cmp    $0x7,%eax
c0106ab9:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106abf:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106ac5:	0f 8f b5 04 00 00    	jg     c0106f80 <_svfiprintf_r+0xc10>
c0106acb:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
c0106ad1:	85 c9                	test   %ecx,%ecx
c0106ad3:	74 2e                	je     c0106b03 <_svfiprintf_r+0x793>
c0106ad5:	83 c0 01             	add    $0x1,%eax
c0106ad8:	83 c2 02             	add    $0x2,%edx
c0106adb:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
c0106ae1:	83 c6 08             	add    $0x8,%esi
c0106ae4:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0106ae7:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
c0106aee:	83 f8 07             	cmp    $0x7,%eax
c0106af1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106af7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106afd:	0f 8f 45 04 00 00    	jg     c0106f48 <_svfiprintf_r+0xbd8>
c0106b03:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
c0106b0a:	00 00 00 
c0106b0d:	0f 84 9d 02 00 00    	je     c0106db0 <_svfiprintf_r+0xa40>
c0106b13:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0106b19:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
c0106b1f:	85 ff                	test   %edi,%edi
c0106b21:	0f 8e e1 00 00 00    	jle    c0106c08 <_svfiprintf_r+0x898>
c0106b27:	83 ff 10             	cmp    $0x10,%edi
c0106b2a:	0f 8e 7c 00 00 00    	jle    c0106bac <_svfiprintf_r+0x83c>
c0106b30:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
c0106b36:	89 f1                	mov    %esi,%ecx
c0106b38:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106b3b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106b3e:	eb 08                	jmp    c0106b48 <_svfiprintf_r+0x7d8>
c0106b40:	83 ef 10             	sub    $0x10,%edi
c0106b43:	83 ff 10             	cmp    $0x10,%edi
c0106b46:	7e 5c                	jle    c0106ba4 <_svfiprintf_r+0x834>
c0106b48:	83 c0 01             	add    $0x1,%eax
c0106b4b:	83 c2 10             	add    $0x10,%edx
c0106b4e:	c7 01 ec 85 10 c0    	movl   $0xc01085ec,(%ecx)
c0106b54:	83 c1 08             	add    $0x8,%ecx
c0106b57:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106b5e:	83 f8 07             	cmp    $0x7,%eax
c0106b61:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106b67:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106b6d:	7e d1                	jle    c0106b40 <_svfiprintf_r+0x7d0>
c0106b6f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106b75:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106b79:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106b7d:	89 1c 24             	mov    %ebx,(%esp)
c0106b80:	e8 fb f5 ff ff       	call   c0106180 <__ssprint_r>
c0106b85:	85 c0                	test   %eax,%eax
c0106b87:	0f 85 eb 01 00 00    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106b8d:	83 ef 10             	sub    $0x10,%edi
c0106b90:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106b96:	83 ff 10             	cmp    $0x10,%edi
c0106b99:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106b9f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106ba2:	7f a4                	jg     c0106b48 <_svfiprintf_r+0x7d8>
c0106ba4:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0106baa:	89 ce                	mov    %ecx,%esi
c0106bac:	83 c0 01             	add    $0x1,%eax
c0106baf:	01 fa                	add    %edi,%edx
c0106bb1:	c7 06 ec 85 10 c0    	movl   $0xc01085ec,(%esi)
c0106bb7:	83 c6 08             	add    $0x8,%esi
c0106bba:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106bbd:	83 f8 07             	cmp    $0x7,%eax
c0106bc0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106bc6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106bcc:	7e 3a                	jle    c0106c08 <_svfiprintf_r+0x898>
c0106bce:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106bd4:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106bd8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106bdb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0106be2:	89 04 24             	mov    %eax,(%esp)
c0106be5:	e8 96 f5 ff ff       	call   c0106180 <__ssprint_r>
c0106bea:	85 c0                	test   %eax,%eax
c0106bec:	0f 85 86 01 00 00    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106bf2:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106bf8:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106bfb:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106c08:	89 1e                	mov    %ebx,(%esi)
c0106c0a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
c0106c10:	83 c0 01             	add    $0x1,%eax
c0106c13:	83 c6 08             	add    $0x8,%esi
c0106c16:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c1c:	89 5e fc             	mov    %ebx,-0x4(%esi)
c0106c1f:	01 da                	add    %ebx,%edx
c0106c21:	83 f8 07             	cmp    $0x7,%eax
c0106c24:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c2a:	0f 8f 80 02 00 00    	jg     c0106eb0 <_svfiprintf_r+0xb40>
c0106c30:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
c0106c37:	0f 84 b9 00 00 00    	je     c0106cf6 <_svfiprintf_r+0x986>
c0106c3d:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106c43:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106c49:	85 ff                	test   %edi,%edi
c0106c4b:	0f 8e a5 00 00 00    	jle    c0106cf6 <_svfiprintf_r+0x986>
c0106c51:	83 ff 10             	cmp    $0x10,%edi
c0106c54:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106c5a:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0106c60:	7e 71                	jle    c0106cd3 <_svfiprintf_r+0x963>
c0106c62:	89 f1                	mov    %esi,%ecx
c0106c64:	8b 75 08             	mov    0x8(%ebp),%esi
c0106c67:	eb 0f                	jmp    c0106c78 <_svfiprintf_r+0x908>
c0106c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106c70:	83 ef 10             	sub    $0x10,%edi
c0106c73:	83 ff 10             	cmp    $0x10,%edi
c0106c76:	7e 59                	jle    c0106cd1 <_svfiprintf_r+0x961>
c0106c78:	83 c0 01             	add    $0x1,%eax
c0106c7b:	83 c2 10             	add    $0x10,%edx
c0106c7e:	c7 01 fc 85 10 c0    	movl   $0xc01085fc,(%ecx)
c0106c84:	83 c1 08             	add    $0x8,%ecx
c0106c87:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106c8e:	83 f8 07             	cmp    $0x7,%eax
c0106c91:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106c97:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106c9d:	7e d1                	jle    c0106c70 <_svfiprintf_r+0x900>
c0106c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ca2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0106ca6:	89 34 24             	mov    %esi,(%esp)
c0106ca9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106cad:	e8 ce f4 ff ff       	call   c0106180 <__ssprint_r>
c0106cb2:	85 c0                	test   %eax,%eax
c0106cb4:	0f 85 be 00 00 00    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106cba:	83 ef 10             	sub    $0x10,%edi
c0106cbd:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106cc3:	83 ff 10             	cmp    $0x10,%edi
c0106cc6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ccc:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106ccf:	7f a7                	jg     c0106c78 <_svfiprintf_r+0x908>
c0106cd1:	89 ce                	mov    %ecx,%esi
c0106cd3:	83 c0 01             	add    $0x1,%eax
c0106cd6:	01 fa                	add    %edi,%edx
c0106cd8:	83 f8 07             	cmp    $0x7,%eax
c0106cdb:	c7 06 fc 85 10 c0    	movl   $0xc01085fc,(%esi)
c0106ce1:	89 7e 04             	mov    %edi,0x4(%esi)
c0106ce4:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106cea:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106cf0:	0f 8f ee 02 00 00    	jg     c0106fe4 <_svfiprintf_r+0xc74>
c0106cf6:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
c0106cfc:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
c0106d02:	39 c6                	cmp    %eax,%esi
c0106d04:	0f 4d c6             	cmovge %esi,%eax
c0106d07:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
c0106d0d:	85 d2                	test   %edx,%edx
c0106d0f:	0f 85 d3 01 00 00    	jne    c0106ee8 <_svfiprintf_r+0xb78>
c0106d15:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106d1c:	00 00 00 
c0106d1f:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106d22:	e9 a7 f6 ff ff       	jmp    c01063ce <_svfiprintf_r+0x5e>
c0106d27:	90                   	nop
c0106d28:	84 d2                	test   %dl,%dl
c0106d2a:	75 6c                	jne    c0106d98 <_svfiprintf_r+0xa28>
c0106d2c:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106d33:	74 63                	je     c0106d98 <_svfiprintf_r+0xa28>
c0106d35:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0106d3b:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106d3e:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0106d42:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106d48:	e9 13 f8 ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c0106d4d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0106d53:	85 c0                	test   %eax,%eax
c0106d55:	74 21                	je     c0106d78 <_svfiprintf_r+0xa08>
c0106d57:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106d5d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106d61:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106d64:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106d68:	8b 45 08             	mov    0x8(%ebp),%eax
c0106d6b:	89 04 24             	mov    %eax,(%esp)
c0106d6e:	e8 0d f4 ff ff       	call   c0106180 <__ssprint_r>
c0106d73:	90                   	nop
c0106d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106d78:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106d7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106d80:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
c0106d84:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
c0106d8b:	81 c4 cc 00 00 00    	add    $0xcc,%esp
c0106d91:	5b                   	pop    %ebx
c0106d92:	5e                   	pop    %esi
c0106d93:	5f                   	pop    %edi
c0106d94:	5d                   	pop    %ebp
c0106d95:	c3                   	ret    
c0106d96:	66 90                	xchg   %ax,%ax
c0106d98:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c0106d9f:	00 00 00 
c0106da2:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106da5:	e9 b6 f7 ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c0106daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106db0:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106db6:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106dbc:	85 ff                	test   %edi,%edi
c0106dbe:	0f 8e 4f fd ff ff    	jle    c0106b13 <_svfiprintf_r+0x7a3>
c0106dc4:	83 ff 10             	cmp    $0x10,%edi
c0106dc7:	0f 8e 7f 00 00 00    	jle    c0106e4c <_svfiprintf_r+0xadc>
c0106dcd:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
c0106dd3:	89 f1                	mov    %esi,%ecx
c0106dd5:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106dd8:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106ddb:	eb 0b                	jmp    c0106de8 <_svfiprintf_r+0xa78>
c0106ddd:	8d 76 00             	lea    0x0(%esi),%esi
c0106de0:	83 ef 10             	sub    $0x10,%edi
c0106de3:	83 ff 10             	cmp    $0x10,%edi
c0106de6:	7e 5c                	jle    c0106e44 <_svfiprintf_r+0xad4>
c0106de8:	83 c0 01             	add    $0x1,%eax
c0106deb:	83 c2 10             	add    $0x10,%edx
c0106dee:	c7 01 ec 85 10 c0    	movl   $0xc01085ec,(%ecx)
c0106df4:	83 c1 08             	add    $0x8,%ecx
c0106df7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106dfe:	83 f8 07             	cmp    $0x7,%eax
c0106e01:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e07:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e0d:	7e d1                	jle    c0106de0 <_svfiprintf_r+0xa70>
c0106e0f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e15:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e19:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106e1d:	89 1c 24             	mov    %ebx,(%esp)
c0106e20:	e8 5b f3 ff ff       	call   c0106180 <__ssprint_r>
c0106e25:	85 c0                	test   %eax,%eax
c0106e27:	0f 85 4b ff ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106e2d:	83 ef 10             	sub    $0x10,%edi
c0106e30:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106e36:	83 ff 10             	cmp    $0x10,%edi
c0106e39:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106e3f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106e42:	7f a4                	jg     c0106de8 <_svfiprintf_r+0xa78>
c0106e44:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
c0106e4a:	89 ce                	mov    %ecx,%esi
c0106e4c:	83 c0 01             	add    $0x1,%eax
c0106e4f:	01 fa                	add    %edi,%edx
c0106e51:	c7 06 ec 85 10 c0    	movl   $0xc01085ec,(%esi)
c0106e57:	83 c6 08             	add    $0x8,%esi
c0106e5a:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106e5d:	83 f8 07             	cmp    $0x7,%eax
c0106e60:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e66:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e6c:	0f 8e a1 fc ff ff    	jle    c0106b13 <_svfiprintf_r+0x7a3>
c0106e72:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e78:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106e7f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106e83:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e86:	89 04 24             	mov    %eax,(%esp)
c0106e89:	e8 f2 f2 ff ff       	call   c0106180 <__ssprint_r>
c0106e8e:	85 c0                	test   %eax,%eax
c0106e90:	0f 85 e2 fe ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106e96:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106e9c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106e9f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ea5:	e9 69 fc ff ff       	jmp    c0106b13 <_svfiprintf_r+0x7a3>
c0106eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106eb0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106eb6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106eba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ebd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ec1:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ec4:	89 04 24             	mov    %eax,(%esp)
c0106ec7:	e8 b4 f2 ff ff       	call   c0106180 <__ssprint_r>
c0106ecc:	85 c0                	test   %eax,%eax
c0106ece:	0f 85 a4 fe ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106ed4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106eda:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106edd:	e9 4e fd ff ff       	jmp    c0106c30 <_svfiprintf_r+0x8c0>
c0106ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106ee8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106eee:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106ef2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ef5:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ef9:	8b 45 08             	mov    0x8(%ebp),%eax
c0106efc:	89 04 24             	mov    %eax,(%esp)
c0106eff:	e8 7c f2 ff ff       	call   c0106180 <__ssprint_r>
c0106f04:	85 c0                	test   %eax,%eax
c0106f06:	0f 84 09 fe ff ff    	je     c0106d15 <_svfiprintf_r+0x9a5>
c0106f0c:	e9 67 fe ff ff       	jmp    c0106d78 <_svfiprintf_r+0xa08>
c0106f11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106f18:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f1e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f22:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f25:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f29:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f2c:	89 04 24             	mov    %eax,(%esp)
c0106f2f:	e8 4c f2 ff ff       	call   c0106180 <__ssprint_r>
c0106f34:	85 c0                	test   %eax,%eax
c0106f36:	0f 85 3c fe ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106f3c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106f3f:	e9 e9 f4 ff ff       	jmp    c010642d <_svfiprintf_r+0xbd>
c0106f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106f48:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f4e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f55:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f59:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f5c:	89 04 24             	mov    %eax,(%esp)
c0106f5f:	e8 1c f2 ff ff       	call   c0106180 <__ssprint_r>
c0106f64:	85 c0                	test   %eax,%eax
c0106f66:	0f 85 0c fe ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106f6c:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106f72:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106f75:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106f7b:	e9 83 fb ff ff       	jmp    c0106b03 <_svfiprintf_r+0x793>
c0106f80:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106f86:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f8d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f91:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f94:	89 04 24             	mov    %eax,(%esp)
c0106f97:	e8 e4 f1 ff ff       	call   c0106180 <__ssprint_r>
c0106f9c:	85 c0                	test   %eax,%eax
c0106f9e:	0f 85 d4 fd ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0106fa4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106faa:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106fad:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106fb3:	e9 13 fb ff ff       	jmp    c0106acb <_svfiprintf_r+0x75b>
c0106fb8:	83 f9 09             	cmp    $0x9,%ecx
c0106fbb:	76 56                	jbe    c0107013 <_svfiprintf_r+0xca3>
c0106fbd:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106fc0:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c0106fc5:	83 eb 01             	sub    $0x1,%ebx
c0106fc8:	f7 e1                	mul    %ecx
c0106fca:	c1 ea 03             	shr    $0x3,%edx
c0106fcd:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0106fd0:	01 c0                	add    %eax,%eax
c0106fd2:	29 c1                	sub    %eax,%ecx
c0106fd4:	83 c1 30             	add    $0x30,%ecx
c0106fd7:	85 d2                	test   %edx,%edx
c0106fd9:	88 0b                	mov    %cl,(%ebx)
c0106fdb:	89 d1                	mov    %edx,%ecx
c0106fdd:	75 e1                	jne    c0106fc0 <_svfiprintf_r+0xc50>
c0106fdf:	e9 71 f5 ff ff       	jmp    c0106555 <_svfiprintf_r+0x1e5>
c0106fe4:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106fea:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106fee:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ff1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ff5:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ff8:	89 04 24             	mov    %eax,(%esp)
c0106ffb:	e8 80 f1 ff ff       	call   c0106180 <__ssprint_r>
c0107000:	85 c0                	test   %eax,%eax
c0107002:	0f 85 70 fd ff ff    	jne    c0106d78 <_svfiprintf_r+0xa08>
c0107008:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010700e:	e9 e3 fc ff ff       	jmp    c0106cf6 <_svfiprintf_r+0x986>
c0107013:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c0107019:	83 c1 30             	add    $0x30,%ecx
c010701c:	88 4d a7             	mov    %cl,-0x59(%ebp)
c010701f:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0107022:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107028:	e9 33 f5 ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c010702d:	8b 45 14             	mov    0x14(%ebp),%eax
c0107030:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
c0107036:	8b 00                	mov    (%eax),%eax
c0107038:	89 18                	mov    %ebx,(%eax)
c010703a:	8b 45 14             	mov    0x14(%ebp),%eax
c010703d:	83 c0 04             	add    $0x4,%eax
c0107040:	89 45 14             	mov    %eax,0x14(%ebp)
c0107043:	e9 86 f3 ff ff       	jmp    c01063ce <_svfiprintf_r+0x5e>
c0107048:	0f b7 0b             	movzwl (%ebx),%ecx
c010704b:	83 c3 04             	add    $0x4,%ebx
c010704e:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0107051:	e9 95 f8 ff ff       	jmp    c01068eb <_svfiprintf_r+0x57b>
c0107056:	0f bf 08             	movswl (%eax),%ecx
c0107059:	83 c0 04             	add    $0x4,%eax
c010705c:	89 45 14             	mov    %eax,0x14(%ebp)
c010705f:	85 c9                	test   %ecx,%ecx
c0107061:	0f 89 0d f7 ff ff    	jns    c0106774 <_svfiprintf_r+0x404>
c0107067:	f7 d9                	neg    %ecx
c0107069:	bf 2d 00 00 00       	mov    $0x2d,%edi
c010706e:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
c0107075:	ba 01 00 00 00       	mov    $0x1,%edx
c010707a:	e9 7a f4 ff ff       	jmp    c01064f9 <_svfiprintf_r+0x189>
c010707f:	89 1c 24             	mov    %ebx,(%esp)
c0107082:	e8 79 f0 ff ff       	call   c0106100 <strlen>
c0107087:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c010708d:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0107094:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010709b:	00 00 00 
c010709e:	89 55 14             	mov    %edx,0x14(%ebp)
c01070a1:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01070a7:	e9 b4 f4 ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c01070ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01070af:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c01070b6:	00 
c01070b7:	89 04 24             	mov    %eax,(%esp)
c01070ba:	e8 41 d9 ff ff       	call   c0104a00 <_malloc_r>
c01070bf:	8b 75 0c             	mov    0xc(%ebp),%esi
c01070c2:	85 c0                	test   %eax,%eax
c01070c4:	89 06                	mov    %eax,(%esi)
c01070c6:	89 46 10             	mov    %eax,0x10(%esi)
c01070c9:	0f 84 a3 00 00 00    	je     c0107172 <_svfiprintf_r+0xe02>
c01070cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01070d2:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c01070d9:	e9 b2 f2 ff ff       	jmp    c0106390 <_svfiprintf_r+0x20>
c01070de:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c01070e4:	b8 06 00 00 00       	mov    $0x6,%eax
c01070e9:	89 55 14             	mov    %edx,0x14(%ebp)
c01070ec:	83 ff 06             	cmp    $0x6,%edi
c01070ef:	0f 46 c7             	cmovbe %edi,%eax
c01070f2:	85 c0                	test   %eax,%eax
c01070f4:	0f 49 d8             	cmovns %eax,%ebx
c01070f7:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
c01070fd:	bb 30 81 10 c0       	mov    $0xc0108130,%ebx
c0107102:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107108:	e9 61 f8 ff ff       	jmp    c010696e <_svfiprintf_r+0x5fe>
c010710d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0107113:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c010711a:	89 55 14             	mov    %edx,0x14(%ebp)
c010711d:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0107124:	00 00 00 
c0107127:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c010712d:	e9 2e f4 ff ff       	jmp    c0106560 <_svfiprintf_r+0x1f0>
c0107132:	89 da                	mov    %ebx,%edx
c0107134:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010713b:	00 00 00 
c010713e:	e9 29 f3 ff ff       	jmp    c010646c <_svfiprintf_r+0xfc>
c0107143:	8b 4d 14             	mov    0x14(%ebp),%ecx
c0107146:	89 da                	mov    %ebx,%edx
c0107148:	8b 45 14             	mov    0x14(%ebp),%eax
c010714b:	8b 09                	mov    (%ecx),%ecx
c010714d:	83 c0 04             	add    $0x4,%eax
c0107150:	89 45 14             	mov    %eax,0x14(%ebp)
c0107153:	85 c9                	test   %ecx,%ecx
c0107155:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c010715b:	0f 89 26 f3 ff ff    	jns    c0106487 <_svfiprintf_r+0x117>
c0107161:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c0107168:	ff ff ff 
c010716b:	89 d0                	mov    %edx,%eax
c010716d:	e9 f4 f2 ff ff       	jmp    c0106466 <_svfiprintf_r+0xf6>
c0107172:	8b 45 08             	mov    0x8(%ebp),%eax
c0107175:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010717b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0107180:	e9 06 fc ff ff       	jmp    c0106d8b <_svfiprintf_r+0xa1b>
c0107185:	66 90                	xchg   %ax,%ax
c0107187:	66 90                	xchg   %ax,%ax
c0107189:	66 90                	xchg   %ax,%ax
c010718b:	66 90                	xchg   %ax,%ax
c010718d:	66 90                	xchg   %ax,%ax
c010718f:	90                   	nop

c0107190 <_calloc_r>:
c0107190:	55                   	push   %ebp
c0107191:	89 e5                	mov    %esp,%ebp
c0107193:	53                   	push   %ebx
c0107194:	83 ec 14             	sub    $0x14,%esp
c0107197:	8b 45 10             	mov    0x10(%ebp),%eax
c010719a:	0f af 45 0c          	imul   0xc(%ebp),%eax
c010719e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01071a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01071a5:	89 04 24             	mov    %eax,(%esp)
c01071a8:	e8 53 d8 ff ff       	call   c0104a00 <_malloc_r>
c01071ad:	85 c0                	test   %eax,%eax
c01071af:	89 c3                	mov    %eax,%ebx
c01071b1:	0f 84 91 00 00 00    	je     c0107248 <_calloc_r+0xb8>
c01071b7:	8b 40 fc             	mov    -0x4(%eax),%eax
c01071ba:	83 e0 fc             	and    $0xfffffffc,%eax
c01071bd:	83 e8 04             	sub    $0x4,%eax
c01071c0:	83 f8 24             	cmp    $0x24,%eax
c01071c3:	77 63                	ja     c0107228 <_calloc_r+0x98>
c01071c5:	83 f8 13             	cmp    $0x13,%eax
c01071c8:	89 da                	mov    %ebx,%edx
c01071ca:	77 1c                	ja     c01071e8 <_calloc_r+0x58>
c01071cc:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
c01071d2:	89 d8                	mov    %ebx,%eax
c01071d4:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
c01071db:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
c01071e2:	83 c4 14             	add    $0x14,%esp
c01071e5:	5b                   	pop    %ebx
c01071e6:	5d                   	pop    %ebp
c01071e7:	c3                   	ret    
c01071e8:	83 f8 1b             	cmp    $0x1b,%eax
c01071eb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c01071f1:	8d 53 08             	lea    0x8(%ebx),%edx
c01071f4:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
c01071fb:	76 cf                	jbe    c01071cc <_calloc_r+0x3c>
c01071fd:	83 f8 24             	cmp    $0x24,%eax
c0107200:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c0107207:	8d 53 10             	lea    0x10(%ebx),%edx
c010720a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
c0107211:	75 b9                	jne    c01071cc <_calloc_r+0x3c>
c0107213:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
c010721a:	8d 53 18             	lea    0x18(%ebx),%edx
c010721d:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
c0107224:	eb a6                	jmp    c01071cc <_calloc_r+0x3c>
c0107226:	66 90                	xchg   %ax,%ax
c0107228:	89 1c 24             	mov    %ebx,(%esp)
c010722b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010722f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107236:	00 
c0107237:	e8 5c a2 ff ff       	call   c0101498 <memset>
c010723c:	83 c4 14             	add    $0x14,%esp
c010723f:	89 d8                	mov    %ebx,%eax
c0107241:	5b                   	pop    %ebx
c0107242:	5d                   	pop    %ebp
c0107243:	c3                   	ret    
c0107244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107248:	31 c0                	xor    %eax,%eax
c010724a:	eb 96                	jmp    c01071e2 <_calloc_r+0x52>
c010724c:	66 90                	xchg   %ax,%ax
c010724e:	66 90                	xchg   %ax,%ax

c0107250 <_malloc_trim_r>:
c0107250:	55                   	push   %ebp
c0107251:	89 e5                	mov    %esp,%ebp
c0107253:	57                   	push   %edi
c0107254:	56                   	push   %esi
c0107255:	53                   	push   %ebx
c0107256:	83 ec 1c             	sub    $0x1c,%esp
c0107259:	8b 75 08             	mov    0x8(%ebp),%esi
c010725c:	89 34 24             	mov    %esi,(%esp)
c010725f:	e8 7c df ff ff       	call   c01051e0 <__malloc_lock>
c0107264:	a1 68 aa 10 c0       	mov    0xc010aa68,%eax
c0107269:	8b 58 04             	mov    0x4(%eax),%ebx
c010726c:	83 e3 fc             	and    $0xfffffffc,%ebx
c010726f:	89 d8                	mov    %ebx,%eax
c0107271:	2b 45 0c             	sub    0xc(%ebp),%eax
c0107274:	05 ef 0f 00 00       	add    $0xfef,%eax
c0107279:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010727e:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
c0107284:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
c010728a:	7e 1c                	jle    c01072a8 <_malloc_trim_r+0x58>
c010728c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107293:	00 
c0107294:	89 34 24             	mov    %esi,(%esp)
c0107297:	e8 44 ed ff ff       	call   c0105fe0 <_sbrk_r>
c010729c:	8b 15 68 aa 10 c0    	mov    0xc010aa68,%edx
c01072a2:	01 da                	add    %ebx,%edx
c01072a4:	39 d0                	cmp    %edx,%eax
c01072a6:	74 18                	je     c01072c0 <_malloc_trim_r+0x70>
c01072a8:	89 34 24             	mov    %esi,(%esp)
c01072ab:	e8 40 df ff ff       	call   c01051f0 <__malloc_unlock>
c01072b0:	83 c4 1c             	add    $0x1c,%esp
c01072b3:	31 c0                	xor    %eax,%eax
c01072b5:	5b                   	pop    %ebx
c01072b6:	5e                   	pop    %esi
c01072b7:	5f                   	pop    %edi
c01072b8:	5d                   	pop    %ebp
c01072b9:	c3                   	ret    
c01072ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01072c0:	89 f8                	mov    %edi,%eax
c01072c2:	f7 d8                	neg    %eax
c01072c4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01072c8:	89 34 24             	mov    %esi,(%esp)
c01072cb:	e8 10 ed ff ff       	call   c0105fe0 <_sbrk_r>
c01072d0:	83 f8 ff             	cmp    $0xffffffff,%eax
c01072d3:	74 2b                	je     c0107300 <_malloc_trim_r+0xb0>
c01072d5:	a1 68 aa 10 c0       	mov    0xc010aa68,%eax
c01072da:	29 fb                	sub    %edi,%ebx
c01072dc:	83 cb 01             	or     $0x1,%ebx
c01072df:	29 3d 60 25 16 c0    	sub    %edi,0xc0162560
c01072e5:	89 58 04             	mov    %ebx,0x4(%eax)
c01072e8:	89 34 24             	mov    %esi,(%esp)
c01072eb:	e8 00 df ff ff       	call   c01051f0 <__malloc_unlock>
c01072f0:	83 c4 1c             	add    $0x1c,%esp
c01072f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01072f8:	5b                   	pop    %ebx
c01072f9:	5e                   	pop    %esi
c01072fa:	5f                   	pop    %edi
c01072fb:	5d                   	pop    %ebp
c01072fc:	c3                   	ret    
c01072fd:	8d 76 00             	lea    0x0(%esi),%esi
c0107300:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107307:	00 
c0107308:	89 34 24             	mov    %esi,(%esp)
c010730b:	e8 d0 ec ff ff       	call   c0105fe0 <_sbrk_r>
c0107310:	8b 15 68 aa 10 c0    	mov    0xc010aa68,%edx
c0107316:	89 c1                	mov    %eax,%ecx
c0107318:	29 d1                	sub    %edx,%ecx
c010731a:	83 f9 0f             	cmp    $0xf,%ecx
c010731d:	7e 89                	jle    c01072a8 <_malloc_trim_r+0x58>
c010731f:	2b 05 40 aa 10 c0    	sub    0xc010aa40,%eax
c0107325:	83 c9 01             	or     $0x1,%ecx
c0107328:	89 4a 04             	mov    %ecx,0x4(%edx)
c010732b:	a3 60 25 16 c0       	mov    %eax,0xc0162560
c0107330:	e9 73 ff ff ff       	jmp    c01072a8 <_malloc_trim_r+0x58>
c0107335:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0107340 <_free_r>:
c0107340:	55                   	push   %ebp
c0107341:	89 e5                	mov    %esp,%ebp
c0107343:	57                   	push   %edi
c0107344:	56                   	push   %esi
c0107345:	53                   	push   %ebx
c0107346:	83 ec 1c             	sub    $0x1c,%esp
c0107349:	8b 75 0c             	mov    0xc(%ebp),%esi
c010734c:	8b 45 08             	mov    0x8(%ebp),%eax
c010734f:	85 f6                	test   %esi,%esi
c0107351:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107354:	0f 84 fe 00 00 00    	je     c0107458 <_free_r+0x118>
c010735a:	89 04 24             	mov    %eax,(%esp)
c010735d:	e8 7e de ff ff       	call   c01051e0 <__malloc_lock>
c0107362:	8b 7e fc             	mov    -0x4(%esi),%edi
c0107365:	8d 56 f8             	lea    -0x8(%esi),%edx
c0107368:	89 f8                	mov    %edi,%eax
c010736a:	83 e0 fe             	and    $0xfffffffe,%eax
c010736d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
c0107370:	8b 59 04             	mov    0x4(%ecx),%ebx
c0107373:	83 e3 fc             	and    $0xfffffffc,%ebx
c0107376:	39 0d 68 aa 10 c0    	cmp    %ecx,0xc010aa68
c010737c:	0f 84 0e 01 00 00    	je     c0107490 <_free_r+0x150>
c0107382:	83 e7 01             	and    $0x1,%edi
c0107385:	89 59 04             	mov    %ebx,0x4(%ecx)
c0107388:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010738f:	75 1f                	jne    c01073b0 <_free_r+0x70>
c0107391:	8b 76 f8             	mov    -0x8(%esi),%esi
c0107394:	29 f2                	sub    %esi,%edx
c0107396:	01 f0                	add    %esi,%eax
c0107398:	8b 72 08             	mov    0x8(%edx),%esi
c010739b:	81 fe 68 aa 10 c0    	cmp    $0xc010aa68,%esi
c01073a1:	0f 84 39 01 00 00    	je     c01074e0 <_free_r+0x1a0>
c01073a7:	8b 7a 0c             	mov    0xc(%edx),%edi
c01073aa:	89 7e 0c             	mov    %edi,0xc(%esi)
c01073ad:	89 77 08             	mov    %esi,0x8(%edi)
c01073b0:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
c01073b5:	75 21                	jne    c01073d8 <_free_r+0x98>
c01073b7:	8b 75 e0             	mov    -0x20(%ebp),%esi
c01073ba:	01 d8                	add    %ebx,%eax
c01073bc:	8b 59 08             	mov    0x8(%ecx),%ebx
c01073bf:	85 f6                	test   %esi,%esi
c01073c1:	75 0c                	jne    c01073cf <_free_r+0x8f>
c01073c3:	81 fb 68 aa 10 c0    	cmp    $0xc010aa68,%ebx
c01073c9:	0f 84 21 01 00 00    	je     c01074f0 <_free_r+0x1b0>
c01073cf:	8b 49 0c             	mov    0xc(%ecx),%ecx
c01073d2:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01073d5:	89 59 08             	mov    %ebx,0x8(%ecx)
c01073d8:	89 c1                	mov    %eax,%ecx
c01073da:	83 c9 01             	or     $0x1,%ecx
c01073dd:	89 4a 04             	mov    %ecx,0x4(%edx)
c01073e0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01073e3:	89 04 02             	mov    %eax,(%edx,%eax,1)
c01073e6:	85 c9                	test   %ecx,%ecx
c01073e8:	75 56                	jne    c0107440 <_free_r+0x100>
c01073ea:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c01073ef:	76 6f                	jbe    c0107460 <_free_r+0x120>
c01073f1:	89 c1                	mov    %eax,%ecx
c01073f3:	c1 e9 09             	shr    $0x9,%ecx
c01073f6:	83 f9 04             	cmp    $0x4,%ecx
c01073f9:	0f 87 21 01 00 00    	ja     c0107520 <_free_r+0x1e0>
c01073ff:	89 c1                	mov    %eax,%ecx
c0107401:	c1 e9 06             	shr    $0x6,%ecx
c0107404:	83 c1 38             	add    $0x38,%ecx
c0107407:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010740a:	8d 34 9d 60 aa 10 c0 	lea    -0x3fef55a0(,%ebx,4),%esi
c0107411:	8b 5e 08             	mov    0x8(%esi),%ebx
c0107414:	39 f3                	cmp    %esi,%ebx
c0107416:	0f 84 14 01 00 00    	je     c0107530 <_free_r+0x1f0>
c010741c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107420:	8b 4b 04             	mov    0x4(%ebx),%ecx
c0107423:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107426:	39 c8                	cmp    %ecx,%eax
c0107428:	73 07                	jae    c0107431 <_free_r+0xf1>
c010742a:	8b 5b 08             	mov    0x8(%ebx),%ebx
c010742d:	39 de                	cmp    %ebx,%esi
c010742f:	75 ef                	jne    c0107420 <_free_r+0xe0>
c0107431:	8b 43 0c             	mov    0xc(%ebx),%eax
c0107434:	89 42 0c             	mov    %eax,0xc(%edx)
c0107437:	89 5a 08             	mov    %ebx,0x8(%edx)
c010743a:	89 50 08             	mov    %edx,0x8(%eax)
c010743d:	89 53 0c             	mov    %edx,0xc(%ebx)
c0107440:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107443:	89 45 08             	mov    %eax,0x8(%ebp)
c0107446:	83 c4 1c             	add    $0x1c,%esp
c0107449:	5b                   	pop    %ebx
c010744a:	5e                   	pop    %esi
c010744b:	5f                   	pop    %edi
c010744c:	5d                   	pop    %ebp
c010744d:	e9 9e dd ff ff       	jmp    c01051f0 <__malloc_unlock>
c0107452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107458:	83 c4 1c             	add    $0x1c,%esp
c010745b:	5b                   	pop    %ebx
c010745c:	5e                   	pop    %esi
c010745d:	5f                   	pop    %edi
c010745e:	5d                   	pop    %ebp
c010745f:	c3                   	ret    
c0107460:	c1 e8 03             	shr    $0x3,%eax
c0107463:	bb 01 00 00 00       	mov    $0x1,%ebx
c0107468:	89 c1                	mov    %eax,%ecx
c010746a:	c1 f9 02             	sar    $0x2,%ecx
c010746d:	8d 04 c5 60 aa 10 c0 	lea    -0x3fef55a0(,%eax,8),%eax
c0107474:	d3 e3                	shl    %cl,%ebx
c0107476:	8b 48 08             	mov    0x8(%eax),%ecx
c0107479:	09 1d 64 aa 10 c0    	or     %ebx,0xc010aa64
c010747f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107482:	89 4a 08             	mov    %ecx,0x8(%edx)
c0107485:	89 50 08             	mov    %edx,0x8(%eax)
c0107488:	89 51 0c             	mov    %edx,0xc(%ecx)
c010748b:	eb b3                	jmp    c0107440 <_free_r+0x100>
c010748d:	8d 76 00             	lea    0x0(%esi),%esi
c0107490:	01 d8                	add    %ebx,%eax
c0107492:	83 e7 01             	and    $0x1,%edi
c0107495:	75 13                	jne    c01074aa <_free_r+0x16a>
c0107497:	8b 4e f8             	mov    -0x8(%esi),%ecx
c010749a:	29 ca                	sub    %ecx,%edx
c010749c:	01 c8                	add    %ecx,%eax
c010749e:	8b 5a 08             	mov    0x8(%edx),%ebx
c01074a1:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01074a4:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01074a7:	89 59 08             	mov    %ebx,0x8(%ecx)
c01074aa:	89 c1                	mov    %eax,%ecx
c01074ac:	83 c9 01             	or     $0x1,%ecx
c01074af:	3b 05 44 aa 10 c0    	cmp    0xc010aa44,%eax
c01074b5:	89 4a 04             	mov    %ecx,0x4(%edx)
c01074b8:	89 15 68 aa 10 c0    	mov    %edx,0xc010aa68
c01074be:	72 80                	jb     c0107440 <_free_r+0x100>
c01074c0:	a1 90 25 16 c0       	mov    0xc0162590,%eax
c01074c5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01074c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01074cc:	89 04 24             	mov    %eax,(%esp)
c01074cf:	e8 7c fd ff ff       	call   c0107250 <_malloc_trim_r>
c01074d4:	e9 67 ff ff ff       	jmp    c0107440 <_free_r+0x100>
c01074d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01074e0:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c01074e7:	e9 c4 fe ff ff       	jmp    c01073b0 <_free_r+0x70>
c01074ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01074f0:	89 c1                	mov    %eax,%ecx
c01074f2:	83 c9 01             	or     $0x1,%ecx
c01074f5:	89 15 74 aa 10 c0    	mov    %edx,0xc010aa74
c01074fb:	89 15 70 aa 10 c0    	mov    %edx,0xc010aa70
c0107501:	c7 42 0c 68 aa 10 c0 	movl   $0xc010aa68,0xc(%edx)
c0107508:	c7 42 08 68 aa 10 c0 	movl   $0xc010aa68,0x8(%edx)
c010750f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107512:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107515:	e9 26 ff ff ff       	jmp    c0107440 <_free_r+0x100>
c010751a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107520:	83 f9 14             	cmp    $0x14,%ecx
c0107523:	77 23                	ja     c0107548 <_free_r+0x208>
c0107525:	83 c1 5b             	add    $0x5b,%ecx
c0107528:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c010752b:	e9 da fe ff ff       	jmp    c010740a <_free_r+0xca>
c0107530:	c1 f9 02             	sar    $0x2,%ecx
c0107533:	b8 01 00 00 00       	mov    $0x1,%eax
c0107538:	d3 e0                	shl    %cl,%eax
c010753a:	09 05 64 aa 10 c0    	or     %eax,0xc010aa64
c0107540:	89 d8                	mov    %ebx,%eax
c0107542:	e9 ed fe ff ff       	jmp    c0107434 <_free_r+0xf4>
c0107547:	90                   	nop
c0107548:	83 f9 54             	cmp    $0x54,%ecx
c010754b:	77 10                	ja     c010755d <_free_r+0x21d>
c010754d:	89 c1                	mov    %eax,%ecx
c010754f:	c1 e9 0c             	shr    $0xc,%ecx
c0107552:	83 c1 6e             	add    $0x6e,%ecx
c0107555:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107558:	e9 ad fe ff ff       	jmp    c010740a <_free_r+0xca>
c010755d:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c0107563:	77 10                	ja     c0107575 <_free_r+0x235>
c0107565:	89 c1                	mov    %eax,%ecx
c0107567:	c1 e9 0f             	shr    $0xf,%ecx
c010756a:	83 c1 77             	add    $0x77,%ecx
c010756d:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107570:	e9 95 fe ff ff       	jmp    c010740a <_free_r+0xca>
c0107575:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c010757b:	77 10                	ja     c010758d <_free_r+0x24d>
c010757d:	89 c1                	mov    %eax,%ecx
c010757f:	c1 e9 12             	shr    $0x12,%ecx
c0107582:	83 c1 7c             	add    $0x7c,%ecx
c0107585:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107588:	e9 7d fe ff ff       	jmp    c010740a <_free_r+0xca>
c010758d:	bb fc 00 00 00       	mov    $0xfc,%ebx
c0107592:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0107597:	e9 6e fe ff ff       	jmp    c010740a <_free_r+0xca>
c010759c:	66 90                	xchg   %ax,%ax
c010759e:	66 90                	xchg   %ax,%ax

c01075a0 <memmove>:
c01075a0:	55                   	push   %ebp
c01075a1:	89 e5                	mov    %esp,%ebp
c01075a3:	56                   	push   %esi
c01075a4:	57                   	push   %edi
c01075a5:	53                   	push   %ebx
c01075a6:	8b 7d 08             	mov    0x8(%ebp),%edi
c01075a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01075ac:	8b 75 0c             	mov    0xc(%ebp),%esi
c01075af:	fc                   	cld    
c01075b0:	39 fe                	cmp    %edi,%esi
c01075b2:	73 43                	jae    c01075f7 <memmove+0x57>
c01075b4:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
c01075b8:	39 df                	cmp    %ebx,%edi
c01075ba:	77 3b                	ja     c01075f7 <memmove+0x57>
c01075bc:	01 ce                	add    %ecx,%esi
c01075be:	01 cf                	add    %ecx,%edi
c01075c0:	fd                   	std    
c01075c1:	83 f9 08             	cmp    $0x8,%ecx
c01075c4:	76 2b                	jbe    c01075f1 <memmove+0x51>
c01075c6:	89 fa                	mov    %edi,%edx
c01075c8:	89 cb                	mov    %ecx,%ebx
c01075ca:	83 e2 03             	and    $0x3,%edx
c01075cd:	74 0c                	je     c01075db <memmove+0x3b>
c01075cf:	89 d1                	mov    %edx,%ecx
c01075d1:	4e                   	dec    %esi
c01075d2:	4f                   	dec    %edi
c01075d3:	29 cb                	sub    %ecx,%ebx
c01075d5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01075d7:	89 d9                	mov    %ebx,%ecx
c01075d9:	46                   	inc    %esi
c01075da:	47                   	inc    %edi
c01075db:	c1 e9 02             	shr    $0x2,%ecx
c01075de:	83 ee 04             	sub    $0x4,%esi
c01075e1:	83 ef 04             	sub    $0x4,%edi
c01075e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01075e6:	83 c6 04             	add    $0x4,%esi
c01075e9:	83 c7 04             	add    $0x4,%edi
c01075ec:	89 d9                	mov    %ebx,%ecx
c01075ee:	83 e1 03             	and    $0x3,%ecx
c01075f1:	4e                   	dec    %esi
c01075f2:	4f                   	dec    %edi
c01075f3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01075f5:	eb 2a                	jmp    c0107621 <memmove+0x81>
c01075f7:	83 f9 08             	cmp    $0x8,%ecx
c01075fa:	76 23                	jbe    c010761f <memmove+0x7f>
c01075fc:	89 fa                	mov    %edi,%edx
c01075fe:	89 cb                	mov    %ecx,%ebx
c0107600:	83 e2 03             	and    $0x3,%edx
c0107603:	74 10                	je     c0107615 <memmove+0x75>
c0107605:	b9 04 00 00 00       	mov    $0x4,%ecx
c010760a:	29 d1                	sub    %edx,%ecx
c010760c:	83 e1 03             	and    $0x3,%ecx
c010760f:	29 cb                	sub    %ecx,%ebx
c0107611:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107613:	89 d9                	mov    %ebx,%ecx
c0107615:	c1 e9 02             	shr    $0x2,%ecx
c0107618:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010761a:	89 d9                	mov    %ebx,%ecx
c010761c:	83 e1 03             	and    $0x3,%ecx
c010761f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107621:	8b 45 08             	mov    0x8(%ebp),%eax
c0107624:	fc                   	cld    
c0107625:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107628:	5b                   	pop    %ebx
c0107629:	5f                   	pop    %edi
c010762a:	5e                   	pop    %esi
c010762b:	c9                   	leave  
c010762c:	c3                   	ret    
c010762d:	66 90                	xchg   %ax,%ax
c010762f:	90                   	nop

c0107630 <_realloc_r>:
c0107630:	55                   	push   %ebp
c0107631:	89 e5                	mov    %esp,%ebp
c0107633:	57                   	push   %edi
c0107634:	56                   	push   %esi
c0107635:	53                   	push   %ebx
c0107636:	83 ec 3c             	sub    $0x3c,%esp
c0107639:	8b 45 08             	mov    0x8(%ebp),%eax
c010763c:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010763f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107642:	8b 45 10             	mov    0x10(%ebp),%eax
c0107645:	85 ff                	test   %edi,%edi
c0107647:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010764a:	0f 84 50 02 00 00    	je     c01078a0 <_realloc_r+0x270>
c0107650:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107653:	8d 77 f8             	lea    -0x8(%edi),%esi
c0107656:	89 04 24             	mov    %eax,(%esp)
c0107659:	e8 82 db ff ff       	call   c01051e0 <__malloc_lock>
c010765e:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107661:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107664:	89 c3                	mov    %eax,%ebx
c0107666:	8d 51 0b             	lea    0xb(%ecx),%edx
c0107669:	83 e3 fc             	and    $0xfffffffc,%ebx
c010766c:	83 fa 16             	cmp    $0x16,%edx
c010766f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107672:	0f 87 00 01 00 00    	ja     c0107778 <_realloc_r+0x148>
c0107678:	31 d2                	xor    %edx,%edx
c010767a:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
c0107681:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0107688:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010768b:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
c010768e:	0f 82 1c 02 00 00    	jb     c01078b0 <_realloc_r+0x280>
c0107694:	84 d2                	test   %dl,%dl
c0107696:	0f 85 14 02 00 00    	jne    c01078b0 <_realloc_r+0x280>
c010769c:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
c010769f:	0f 8d eb 00 00 00    	jge    c0107790 <_realloc_r+0x160>
c01076a5:	8b 0d 68 aa 10 c0    	mov    0xc010aa68,%ecx
c01076ab:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
c01076ae:	39 d1                	cmp    %edx,%ecx
c01076b0:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c01076b3:	0f 84 6f 02 00 00    	je     c0107928 <_realloc_r+0x2f8>
c01076b9:	8b 4a 04             	mov    0x4(%edx),%ecx
c01076bc:	89 c8                	mov    %ecx,%eax
c01076be:	83 e0 fe             	and    $0xfffffffe,%eax
c01076c1:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
c01076c6:	0f 84 f4 00 00 00    	je     c01077c0 <_realloc_r+0x190>
c01076cc:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
c01076d3:	31 d2                	xor    %edx,%edx
c01076d5:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
c01076d9:	0f 85 39 01 00 00    	jne    c0107818 <_realloc_r+0x1e8>
c01076df:	89 f1                	mov    %esi,%ecx
c01076e1:	2b 4f f8             	sub    -0x8(%edi),%ecx
c01076e4:	8b 41 04             	mov    0x4(%ecx),%eax
c01076e7:	83 e0 fc             	and    $0xfffffffc,%eax
c01076ea:	85 d2                	test   %edx,%edx
c01076ec:	0f 84 f6 02 00 00    	je     c01079e8 <_realloc_r+0x3b8>
c01076f2:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c01076f5:	0f 84 f5 02 00 00    	je     c01079f0 <_realloc_r+0x3c0>
c01076fb:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c01076fe:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0107701:	01 d8                	add    %ebx,%eax
c0107703:	01 c2                	add    %eax,%edx
c0107705:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107708:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010770b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010770e:	0f 8c ac 01 00 00    	jl     c01078c0 <_realloc_r+0x290>
c0107714:	8b 42 0c             	mov    0xc(%edx),%eax
c0107717:	83 eb 04             	sub    $0x4,%ebx
c010771a:	8b 52 08             	mov    0x8(%edx),%edx
c010771d:	83 fb 24             	cmp    $0x24,%ebx
c0107720:	8d 71 08             	lea    0x8(%ecx),%esi
c0107723:	89 42 0c             	mov    %eax,0xc(%edx)
c0107726:	89 50 08             	mov    %edx,0x8(%eax)
c0107729:	8b 41 0c             	mov    0xc(%ecx),%eax
c010772c:	8b 51 08             	mov    0x8(%ecx),%edx
c010772f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107732:	89 50 08             	mov    %edx,0x8(%eax)
c0107735:	0f 87 85 03 00 00    	ja     c0107ac0 <_realloc_r+0x490>
c010773b:	83 fb 13             	cmp    $0x13,%ebx
c010773e:	89 f0                	mov    %esi,%eax
c0107740:	76 1a                	jbe    c010775c <_realloc_r+0x12c>
c0107742:	8b 07                	mov    (%edi),%eax
c0107744:	83 fb 1b             	cmp    $0x1b,%ebx
c0107747:	89 41 08             	mov    %eax,0x8(%ecx)
c010774a:	8b 47 04             	mov    0x4(%edi),%eax
c010774d:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107750:	0f 87 8f 03 00 00    	ja     c0107ae5 <_realloc_r+0x4b5>
c0107756:	8d 41 10             	lea    0x10(%ecx),%eax
c0107759:	83 c7 08             	add    $0x8,%edi
c010775c:	8b 17                	mov    (%edi),%edx
c010775e:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107761:	89 10                	mov    %edx,(%eax)
c0107763:	8b 57 04             	mov    0x4(%edi),%edx
c0107766:	89 50 04             	mov    %edx,0x4(%eax)
c0107769:	8b 57 08             	mov    0x8(%edi),%edx
c010776c:	89 f7                	mov    %esi,%edi
c010776e:	89 ce                	mov    %ecx,%esi
c0107770:	89 50 08             	mov    %edx,0x8(%eax)
c0107773:	8b 41 04             	mov    0x4(%ecx),%eax
c0107776:	eb 1b                	jmp    c0107793 <_realloc_r+0x163>
c0107778:	83 e2 f8             	and    $0xfffffff8,%edx
c010777b:	89 55 dc             	mov    %edx,-0x24(%ebp)
c010777e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0107781:	c1 ea 1f             	shr    $0x1f,%edx
c0107784:	e9 ff fe ff ff       	jmp    c0107688 <_realloc_r+0x58>
c0107789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107790:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0107793:	89 da                	mov    %ebx,%edx
c0107795:	2b 55 dc             	sub    -0x24(%ebp),%edx
c0107798:	83 fa 0f             	cmp    $0xf,%edx
c010779b:	77 4b                	ja     c01077e8 <_realloc_r+0x1b8>
c010779d:	83 e0 01             	and    $0x1,%eax
c01077a0:	09 d8                	or     %ebx,%eax
c01077a2:	89 46 04             	mov    %eax,0x4(%esi)
c01077a5:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
c01077aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01077ad:	89 04 24             	mov    %eax,(%esp)
c01077b0:	e8 3b da ff ff       	call   c01051f0 <__malloc_unlock>
c01077b5:	89 f8                	mov    %edi,%eax
c01077b7:	83 c4 3c             	add    $0x3c,%esp
c01077ba:	5b                   	pop    %ebx
c01077bb:	5e                   	pop    %esi
c01077bc:	5f                   	pop    %edi
c01077bd:	5d                   	pop    %ebp
c01077be:	c3                   	ret    
c01077bf:	90                   	nop
c01077c0:	83 e1 fc             	and    $0xfffffffc,%ecx
c01077c3:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c01077c6:	01 d9                	add    %ebx,%ecx
c01077c8:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
c01077cb:	0f 8c 04 ff ff ff    	jl     c01076d5 <_realloc_r+0xa5>
c01077d1:	8b 5a 0c             	mov    0xc(%edx),%ebx
c01077d4:	8b 52 08             	mov    0x8(%edx),%edx
c01077d7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01077da:	89 5a 0c             	mov    %ebx,0xc(%edx)
c01077dd:	89 53 08             	mov    %edx,0x8(%ebx)
c01077e0:	89 cb                	mov    %ecx,%ebx
c01077e2:	eb af                	jmp    c0107793 <_realloc_r+0x163>
c01077e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01077e8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c01077eb:	83 e0 01             	and    $0x1,%eax
c01077ee:	09 d8                	or     %ebx,%eax
c01077f0:	89 46 04             	mov    %eax,0x4(%esi)
c01077f3:	89 d0                	mov    %edx,%eax
c01077f5:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
c01077f8:	83 c8 01             	or     $0x1,%eax
c01077fb:	89 41 04             	mov    %eax,0x4(%ecx)
c01077fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107801:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
c0107806:	83 c1 08             	add    $0x8,%ecx
c0107809:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010780d:	89 04 24             	mov    %eax,(%esp)
c0107810:	e8 2b fb ff ff       	call   c0107340 <_free_r>
c0107815:	eb 93                	jmp    c01077aa <_realloc_r+0x17a>
c0107817:	90                   	nop
c0107818:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010781b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010781f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107822:	89 04 24             	mov    %eax,(%esp)
c0107825:	e8 d6 d1 ff ff       	call   c0104a00 <_malloc_r>
c010782a:	85 c0                	test   %eax,%eax
c010782c:	89 c1                	mov    %eax,%ecx
c010782e:	0f 84 65 03 00 00    	je     c0107b99 <_realloc_r+0x569>
c0107834:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107837:	8d 51 f8             	lea    -0x8(%ecx),%edx
c010783a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010783d:	89 c2                	mov    %eax,%edx
c010783f:	83 e2 fe             	and    $0xfffffffe,%edx
c0107842:	01 f2                	add    %esi,%edx
c0107844:	39 55 e0             	cmp    %edx,-0x20(%ebp)
c0107847:	0f 84 63 02 00 00    	je     c0107ab0 <_realloc_r+0x480>
c010784d:	83 eb 04             	sub    $0x4,%ebx
c0107850:	83 fb 24             	cmp    $0x24,%ebx
c0107853:	0f 87 6f 01 00 00    	ja     c01079c8 <_realloc_r+0x398>
c0107859:	83 fb 13             	cmp    $0x13,%ebx
c010785c:	0f 87 ee 00 00 00    	ja     c0107950 <_realloc_r+0x320>
c0107862:	89 c8                	mov    %ecx,%eax
c0107864:	89 fa                	mov    %edi,%edx
c0107866:	8b 1a                	mov    (%edx),%ebx
c0107868:	89 18                	mov    %ebx,(%eax)
c010786a:	8b 5a 04             	mov    0x4(%edx),%ebx
c010786d:	89 58 04             	mov    %ebx,0x4(%eax)
c0107870:	8b 52 08             	mov    0x8(%edx),%edx
c0107873:	89 50 08             	mov    %edx,0x8(%eax)
c0107876:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0107879:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010787d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107880:	89 34 24             	mov    %esi,(%esp)
c0107883:	e8 b8 fa ff ff       	call   c0107340 <_free_r>
c0107888:	89 34 24             	mov    %esi,(%esp)
c010788b:	e8 60 d9 ff ff       	call   c01051f0 <__malloc_unlock>
c0107890:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107893:	83 c4 3c             	add    $0x3c,%esp
c0107896:	5b                   	pop    %ebx
c0107897:	5e                   	pop    %esi
c0107898:	5f                   	pop    %edi
c0107899:	89 c8                	mov    %ecx,%eax
c010789b:	5d                   	pop    %ebp
c010789c:	c3                   	ret    
c010789d:	8d 76 00             	lea    0x0(%esi),%esi
c01078a0:	89 45 0c             	mov    %eax,0xc(%ebp)
c01078a3:	83 c4 3c             	add    $0x3c,%esp
c01078a6:	5b                   	pop    %ebx
c01078a7:	5e                   	pop    %esi
c01078a8:	5f                   	pop    %edi
c01078a9:	5d                   	pop    %ebp
c01078aa:	e9 51 d1 ff ff       	jmp    c0104a00 <_malloc_r>
c01078af:	90                   	nop
c01078b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01078b3:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c01078b9:	31 c0                	xor    %eax,%eax
c01078bb:	e9 f7 fe ff ff       	jmp    c01077b7 <_realloc_r+0x187>
c01078c0:	89 c2                	mov    %eax,%edx
c01078c2:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c01078c5:	0f 8c 4d ff ff ff    	jl     c0107818 <_realloc_r+0x1e8>
c01078cb:	8b 71 08             	mov    0x8(%ecx),%esi
c01078ce:	83 eb 04             	sub    $0x4,%ebx
c01078d1:	8b 41 0c             	mov    0xc(%ecx),%eax
c01078d4:	83 fb 24             	cmp    $0x24,%ebx
c01078d7:	89 46 0c             	mov    %eax,0xc(%esi)
c01078da:	89 70 08             	mov    %esi,0x8(%eax)
c01078dd:	8d 71 08             	lea    0x8(%ecx),%esi
c01078e0:	0f 87 88 00 00 00    	ja     c010796e <_realloc_r+0x33e>
c01078e6:	83 fb 13             	cmp    $0x13,%ebx
c01078e9:	89 f0                	mov    %esi,%eax
c01078eb:	76 1a                	jbe    c0107907 <_realloc_r+0x2d7>
c01078ed:	8b 07                	mov    (%edi),%eax
c01078ef:	83 fb 1b             	cmp    $0x1b,%ebx
c01078f2:	89 41 08             	mov    %eax,0x8(%ecx)
c01078f5:	8b 47 04             	mov    0x4(%edi),%eax
c01078f8:	89 41 0c             	mov    %eax,0xc(%ecx)
c01078fb:	0f 87 17 02 00 00    	ja     c0107b18 <_realloc_r+0x4e8>
c0107901:	8d 41 10             	lea    0x10(%ecx),%eax
c0107904:	83 c7 08             	add    $0x8,%edi
c0107907:	8b 1f                	mov    (%edi),%ebx
c0107909:	89 18                	mov    %ebx,(%eax)
c010790b:	8b 5f 04             	mov    0x4(%edi),%ebx
c010790e:	89 58 04             	mov    %ebx,0x4(%eax)
c0107911:	8b 5f 08             	mov    0x8(%edi),%ebx
c0107914:	89 f7                	mov    %esi,%edi
c0107916:	89 ce                	mov    %ecx,%esi
c0107918:	89 58 08             	mov    %ebx,0x8(%eax)
c010791b:	89 d3                	mov    %edx,%ebx
c010791d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107920:	e9 6e fe ff ff       	jmp    c0107793 <_realloc_r+0x163>
c0107925:	8d 76 00             	lea    0x0(%esi),%esi
c0107928:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010792b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010792e:	8b 48 04             	mov    0x4(%eax),%ecx
c0107931:	83 c2 10             	add    $0x10,%edx
c0107934:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107937:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
c010793b:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c010793e:	01 d9                	add    %ebx,%ecx
c0107940:	39 d1                	cmp    %edx,%ecx
c0107942:	7d 54                	jge    c0107998 <_realloc_r+0x368>
c0107944:	89 c2                	mov    %eax,%edx
c0107946:	e9 8a fd ff ff       	jmp    c01076d5 <_realloc_r+0xa5>
c010794b:	90                   	nop
c010794c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107950:	8b 07                	mov    (%edi),%eax
c0107952:	83 fb 1b             	cmp    $0x1b,%ebx
c0107955:	89 01                	mov    %eax,(%ecx)
c0107957:	8b 47 04             	mov    0x4(%edi),%eax
c010795a:	89 41 04             	mov    %eax,0x4(%ecx)
c010795d:	0f 87 2d 01 00 00    	ja     c0107a90 <_realloc_r+0x460>
c0107963:	8d 41 08             	lea    0x8(%ecx),%eax
c0107966:	8d 57 08             	lea    0x8(%edi),%edx
c0107969:	e9 f8 fe ff ff       	jmp    c0107866 <_realloc_r+0x236>
c010796e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107972:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107976:	89 f7                	mov    %esi,%edi
c0107978:	89 34 24             	mov    %esi,(%esp)
c010797b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010797e:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107981:	e8 1a fc ff ff       	call   c01075a0 <memmove>
c0107986:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107989:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010798c:	8b 41 04             	mov    0x4(%ecx),%eax
c010798f:	89 ce                	mov    %ecx,%esi
c0107991:	89 d3                	mov    %edx,%ebx
c0107993:	e9 fb fd ff ff       	jmp    c0107793 <_realloc_r+0x163>
c0107998:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010799b:	29 d9                	sub    %ebx,%ecx
c010799d:	01 de                	add    %ebx,%esi
c010799f:	83 c9 01             	or     $0x1,%ecx
c01079a2:	89 35 68 aa 10 c0    	mov    %esi,0xc010aa68
c01079a8:	89 4e 04             	mov    %ecx,0x4(%esi)
c01079ab:	8b 47 fc             	mov    -0x4(%edi),%eax
c01079ae:	83 e0 01             	and    $0x1,%eax
c01079b1:	09 d8                	or     %ebx,%eax
c01079b3:	89 47 fc             	mov    %eax,-0x4(%edi)
c01079b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01079b9:	89 04 24             	mov    %eax,(%esp)
c01079bc:	e8 2f d8 ff ff       	call   c01051f0 <__malloc_unlock>
c01079c1:	89 f8                	mov    %edi,%eax
c01079c3:	e9 ef fd ff ff       	jmp    c01077b7 <_realloc_r+0x187>
c01079c8:	89 0c 24             	mov    %ecx,(%esp)
c01079cb:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01079cf:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01079d3:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01079d6:	e8 c5 fb ff ff       	call   c01075a0 <memmove>
c01079db:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01079de:	e9 93 fe ff ff       	jmp    c0107876 <_realloc_r+0x246>
c01079e3:	90                   	nop
c01079e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01079e8:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c01079eb:	e9 d2 fe ff ff       	jmp    c01078c2 <_realloc_r+0x292>
c01079f0:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c01079f3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01079f6:	01 d0                	add    %edx,%eax
c01079f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01079fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01079fe:	83 c0 10             	add    $0x10,%eax
c0107a01:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0107a04:	0f 8c b8 fe ff ff    	jl     c01078c2 <_realloc_r+0x292>
c0107a0a:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107a0d:	83 eb 04             	sub    $0x4,%ebx
c0107a10:	8b 51 08             	mov    0x8(%ecx),%edx
c0107a13:	83 fb 24             	cmp    $0x24,%ebx
c0107a16:	8d 71 08             	lea    0x8(%ecx),%esi
c0107a19:	89 42 0c             	mov    %eax,0xc(%edx)
c0107a1c:	89 50 08             	mov    %edx,0x8(%eax)
c0107a1f:	0f 87 3d 01 00 00    	ja     c0107b62 <_realloc_r+0x532>
c0107a25:	83 fb 13             	cmp    $0x13,%ebx
c0107a28:	89 f0                	mov    %esi,%eax
c0107a2a:	76 1a                	jbe    c0107a46 <_realloc_r+0x416>
c0107a2c:	8b 07                	mov    (%edi),%eax
c0107a2e:	83 fb 1b             	cmp    $0x1b,%ebx
c0107a31:	89 41 08             	mov    %eax,0x8(%ecx)
c0107a34:	8b 47 04             	mov    0x4(%edi),%eax
c0107a37:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107a3a:	0f 87 3d 01 00 00    	ja     c0107b7d <_realloc_r+0x54d>
c0107a40:	8d 41 10             	lea    0x10(%ecx),%eax
c0107a43:	83 c7 08             	add    $0x8,%edi
c0107a46:	8b 17                	mov    (%edi),%edx
c0107a48:	89 10                	mov    %edx,(%eax)
c0107a4a:	8b 57 04             	mov    0x4(%edi),%edx
c0107a4d:	89 50 04             	mov    %edx,0x4(%eax)
c0107a50:	8b 57 08             	mov    0x8(%edi),%edx
c0107a53:	89 50 08             	mov    %edx,0x8(%eax)
c0107a56:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107a59:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0107a5c:	89 d8                	mov    %ebx,%eax
c0107a5e:	29 df                	sub    %ebx,%edi
c0107a60:	01 c8                	add    %ecx,%eax
c0107a62:	83 cf 01             	or     $0x1,%edi
c0107a65:	a3 68 aa 10 c0       	mov    %eax,0xc010aa68
c0107a6a:	89 78 04             	mov    %edi,0x4(%eax)
c0107a6d:	8b 41 04             	mov    0x4(%ecx),%eax
c0107a70:	83 e0 01             	and    $0x1,%eax
c0107a73:	09 d8                	or     %ebx,%eax
c0107a75:	89 41 04             	mov    %eax,0x4(%ecx)
c0107a78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107a7b:	89 04 24             	mov    %eax,(%esp)
c0107a7e:	e8 6d d7 ff ff       	call   c01051f0 <__malloc_unlock>
c0107a83:	89 f0                	mov    %esi,%eax
c0107a85:	e9 2d fd ff ff       	jmp    c01077b7 <_realloc_r+0x187>
c0107a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107a90:	8b 47 08             	mov    0x8(%edi),%eax
c0107a93:	83 fb 24             	cmp    $0x24,%ebx
c0107a96:	89 41 08             	mov    %eax,0x8(%ecx)
c0107a99:	8b 47 0c             	mov    0xc(%edi),%eax
c0107a9c:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107a9f:	74 60                	je     c0107b01 <_realloc_r+0x4d1>
c0107aa1:	8d 41 10             	lea    0x10(%ecx),%eax
c0107aa4:	8d 57 10             	lea    0x10(%edi),%edx
c0107aa7:	e9 ba fd ff ff       	jmp    c0107866 <_realloc_r+0x236>
c0107aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107ab0:	8b 51 fc             	mov    -0x4(%ecx),%edx
c0107ab3:	83 e2 fc             	and    $0xfffffffc,%edx
c0107ab6:	01 d3                	add    %edx,%ebx
c0107ab8:	e9 d6 fc ff ff       	jmp    c0107793 <_realloc_r+0x163>
c0107abd:	8d 76 00             	lea    0x0(%esi),%esi
c0107ac0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107ac4:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107ac8:	89 f7                	mov    %esi,%edi
c0107aca:	89 34 24             	mov    %esi,(%esp)
c0107acd:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107ad0:	e8 cb fa ff ff       	call   c01075a0 <memmove>
c0107ad5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107ad8:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107adb:	8b 41 04             	mov    0x4(%ecx),%eax
c0107ade:	89 ce                	mov    %ecx,%esi
c0107ae0:	e9 ae fc ff ff       	jmp    c0107793 <_realloc_r+0x163>
c0107ae5:	8b 47 08             	mov    0x8(%edi),%eax
c0107ae8:	83 fb 24             	cmp    $0x24,%ebx
c0107aeb:	89 41 10             	mov    %eax,0x10(%ecx)
c0107aee:	8b 47 0c             	mov    0xc(%edi),%eax
c0107af1:	89 41 14             	mov    %eax,0x14(%ecx)
c0107af4:	74 3e                	je     c0107b34 <_realloc_r+0x504>
c0107af6:	8d 41 18             	lea    0x18(%ecx),%eax
c0107af9:	83 c7 10             	add    $0x10,%edi
c0107afc:	e9 5b fc ff ff       	jmp    c010775c <_realloc_r+0x12c>
c0107b01:	8b 47 10             	mov    0x10(%edi),%eax
c0107b04:	8d 57 18             	lea    0x18(%edi),%edx
c0107b07:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b0a:	8b 5f 14             	mov    0x14(%edi),%ebx
c0107b0d:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b10:	89 59 14             	mov    %ebx,0x14(%ecx)
c0107b13:	e9 4e fd ff ff       	jmp    c0107866 <_realloc_r+0x236>
c0107b18:	8b 47 08             	mov    0x8(%edi),%eax
c0107b1b:	83 fb 24             	cmp    $0x24,%ebx
c0107b1e:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b21:	8b 47 0c             	mov    0xc(%edi),%eax
c0107b24:	89 41 14             	mov    %eax,0x14(%ecx)
c0107b27:	74 22                	je     c0107b4b <_realloc_r+0x51b>
c0107b29:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b2c:	83 c7 10             	add    $0x10,%edi
c0107b2f:	e9 d3 fd ff ff       	jmp    c0107907 <_realloc_r+0x2d7>
c0107b34:	8b 47 10             	mov    0x10(%edi),%eax
c0107b37:	83 c7 18             	add    $0x18,%edi
c0107b3a:	89 41 18             	mov    %eax,0x18(%ecx)
c0107b3d:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107b40:	8d 41 20             	lea    0x20(%ecx),%eax
c0107b43:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107b46:	e9 11 fc ff ff       	jmp    c010775c <_realloc_r+0x12c>
c0107b4b:	8b 47 10             	mov    0x10(%edi),%eax
c0107b4e:	83 c7 18             	add    $0x18,%edi
c0107b51:	89 41 18             	mov    %eax,0x18(%ecx)
c0107b54:	8b 5f fc             	mov    -0x4(%edi),%ebx
c0107b57:	8d 41 20             	lea    0x20(%ecx),%eax
c0107b5a:	89 59 1c             	mov    %ebx,0x1c(%ecx)
c0107b5d:	e9 a5 fd ff ff       	jmp    c0107907 <_realloc_r+0x2d7>
c0107b62:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107b66:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0107b6a:	89 34 24             	mov    %esi,(%esp)
c0107b6d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0107b70:	e8 2b fa ff ff       	call   c01075a0 <memmove>
c0107b75:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107b78:	e9 d9 fe ff ff       	jmp    c0107a56 <_realloc_r+0x426>
c0107b7d:	8b 47 08             	mov    0x8(%edi),%eax
c0107b80:	83 fb 24             	cmp    $0x24,%ebx
c0107b83:	89 41 10             	mov    %eax,0x10(%ecx)
c0107b86:	8b 47 0c             	mov    0xc(%edi),%eax
c0107b89:	89 41 14             	mov    %eax,0x14(%ecx)
c0107b8c:	74 1d                	je     c0107bab <_realloc_r+0x57b>
c0107b8e:	8d 41 18             	lea    0x18(%ecx),%eax
c0107b91:	83 c7 10             	add    $0x10,%edi
c0107b94:	e9 ad fe ff ff       	jmp    c0107a46 <_realloc_r+0x416>
c0107b99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107b9c:	89 04 24             	mov    %eax,(%esp)
c0107b9f:	e8 4c d6 ff ff       	call   c01051f0 <__malloc_unlock>
c0107ba4:	31 c0                	xor    %eax,%eax
c0107ba6:	e9 0c fc ff ff       	jmp    c01077b7 <_realloc_r+0x187>
c0107bab:	8b 47 10             	mov    0x10(%edi),%eax
c0107bae:	83 c7 18             	add    $0x18,%edi
c0107bb1:	89 41 18             	mov    %eax,0x18(%ecx)
c0107bb4:	8b 57 fc             	mov    -0x4(%edi),%edx
c0107bb7:	8d 41 20             	lea    0x20(%ecx),%eax
c0107bba:	89 51 1c             	mov    %edx,0x1c(%ecx)
c0107bbd:	e9 84 fe ff ff       	jmp    c0107a46 <_realloc_r+0x416>
c0107bc2:	66 90                	xchg   %ax,%ax
c0107bc4:	66 90                	xchg   %ax,%ax
c0107bc6:	66 90                	xchg   %ax,%ax
c0107bc8:	66 90                	xchg   %ax,%ax
c0107bca:	66 90                	xchg   %ax,%ax
c0107bcc:	66 90                	xchg   %ax,%ax
c0107bce:	66 90                	xchg   %ax,%ax

c0107bd0 <cleanup_glue>:
c0107bd0:	55                   	push   %ebp
c0107bd1:	89 e5                	mov    %esp,%ebp
c0107bd3:	56                   	push   %esi
c0107bd4:	53                   	push   %ebx
c0107bd5:	83 ec 10             	sub    $0x10,%esp
c0107bd8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0107bdb:	8b 75 08             	mov    0x8(%ebp),%esi
c0107bde:	8b 03                	mov    (%ebx),%eax
c0107be0:	85 c0                	test   %eax,%eax
c0107be2:	74 0c                	je     c0107bf0 <cleanup_glue+0x20>
c0107be4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107be8:	89 34 24             	mov    %esi,(%esp)
c0107beb:	e8 e0 ff ff ff       	call   c0107bd0 <cleanup_glue>
c0107bf0:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0107bf3:	89 75 08             	mov    %esi,0x8(%ebp)
c0107bf6:	83 c4 10             	add    $0x10,%esp
c0107bf9:	5b                   	pop    %ebx
c0107bfa:	5e                   	pop    %esi
c0107bfb:	5d                   	pop    %ebp
c0107bfc:	e9 3f f7 ff ff       	jmp    c0107340 <_free_r>
c0107c01:	eb 0d                	jmp    c0107c10 <_reclaim_reent>
c0107c03:	90                   	nop
c0107c04:	90                   	nop
c0107c05:	90                   	nop
c0107c06:	90                   	nop
c0107c07:	90                   	nop
c0107c08:	90                   	nop
c0107c09:	90                   	nop
c0107c0a:	90                   	nop
c0107c0b:	90                   	nop
c0107c0c:	90                   	nop
c0107c0d:	90                   	nop
c0107c0e:	90                   	nop
c0107c0f:	90                   	nop

c0107c10 <_reclaim_reent>:
c0107c10:	55                   	push   %ebp
c0107c11:	89 e5                	mov    %esp,%ebp
c0107c13:	57                   	push   %edi
c0107c14:	56                   	push   %esi
c0107c15:	53                   	push   %ebx
c0107c16:	83 ec 1c             	sub    $0x1c,%esp
c0107c19:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0107c1c:	3b 1d 60 a5 10 c0    	cmp    0xc010a560,%ebx
c0107c22:	0f 84 a6 00 00 00    	je     c0107cce <_reclaim_reent+0xbe>
c0107c28:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107c2b:	85 d2                	test   %edx,%edx
c0107c2d:	74 46                	je     c0107c75 <_reclaim_reent+0x65>
c0107c2f:	31 c0                	xor    %eax,%eax
c0107c31:	31 f6                	xor    %esi,%esi
c0107c33:	90                   	nop
c0107c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107c38:	8b 04 82             	mov    (%edx,%eax,4),%eax
c0107c3b:	85 c0                	test   %eax,%eax
c0107c3d:	75 0b                	jne    c0107c4a <_reclaim_reent+0x3a>
c0107c3f:	eb 1e                	jmp    c0107c5f <_reclaim_reent+0x4f>
c0107c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107c48:	89 f8                	mov    %edi,%eax
c0107c4a:	8b 38                	mov    (%eax),%edi
c0107c4c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107c50:	89 1c 24             	mov    %ebx,(%esp)
c0107c53:	e8 e8 f6 ff ff       	call   c0107340 <_free_r>
c0107c58:	85 ff                	test   %edi,%edi
c0107c5a:	75 ec                	jne    c0107c48 <_reclaim_reent+0x38>
c0107c5c:	8b 53 4c             	mov    0x4c(%ebx),%edx
c0107c5f:	83 c6 01             	add    $0x1,%esi
c0107c62:	83 fe 20             	cmp    $0x20,%esi
c0107c65:	89 f0                	mov    %esi,%eax
c0107c67:	75 cf                	jne    c0107c38 <_reclaim_reent+0x28>
c0107c69:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107c6d:	89 1c 24             	mov    %ebx,(%esp)
c0107c70:	e8 cb f6 ff ff       	call   c0107340 <_free_r>
c0107c75:	8b 43 40             	mov    0x40(%ebx),%eax
c0107c78:	85 c0                	test   %eax,%eax
c0107c7a:	74 0c                	je     c0107c88 <_reclaim_reent+0x78>
c0107c7c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107c80:	89 1c 24             	mov    %ebx,(%esp)
c0107c83:	e8 b8 f6 ff ff       	call   c0107340 <_free_r>
c0107c88:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
c0107c8e:	85 c0                	test   %eax,%eax
c0107c90:	74 22                	je     c0107cb4 <_reclaim_reent+0xa4>
c0107c92:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
c0107c98:	39 f0                	cmp    %esi,%eax
c0107c9a:	75 06                	jne    c0107ca2 <_reclaim_reent+0x92>
c0107c9c:	eb 16                	jmp    c0107cb4 <_reclaim_reent+0xa4>
c0107c9e:	66 90                	xchg   %ax,%ax
c0107ca0:	89 f8                	mov    %edi,%eax
c0107ca2:	8b 38                	mov    (%eax),%edi
c0107ca4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107ca8:	89 1c 24             	mov    %ebx,(%esp)
c0107cab:	e8 90 f6 ff ff       	call   c0107340 <_free_r>
c0107cb0:	39 fe                	cmp    %edi,%esi
c0107cb2:	75 ec                	jne    c0107ca0 <_reclaim_reent+0x90>
c0107cb4:	8b 43 54             	mov    0x54(%ebx),%eax
c0107cb7:	85 c0                	test   %eax,%eax
c0107cb9:	74 0c                	je     c0107cc7 <_reclaim_reent+0xb7>
c0107cbb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107cbf:	89 1c 24             	mov    %ebx,(%esp)
c0107cc2:	e8 79 f6 ff ff       	call   c0107340 <_free_r>
c0107cc7:	8b 43 38             	mov    0x38(%ebx),%eax
c0107cca:	85 c0                	test   %eax,%eax
c0107ccc:	75 08                	jne    c0107cd6 <_reclaim_reent+0xc6>
c0107cce:	83 c4 1c             	add    $0x1c,%esp
c0107cd1:	5b                   	pop    %ebx
c0107cd2:	5e                   	pop    %esi
c0107cd3:	5f                   	pop    %edi
c0107cd4:	5d                   	pop    %ebp
c0107cd5:	c3                   	ret    
c0107cd6:	89 1c 24             	mov    %ebx,(%esp)
c0107cd9:	ff 53 3c             	call   *0x3c(%ebx)
c0107cdc:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
c0107ce2:	85 c0                	test   %eax,%eax
c0107ce4:	74 e8                	je     c0107cce <_reclaim_reent+0xbe>
c0107ce6:	89 1c 24             	mov    %ebx,(%esp)
c0107ce9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107ced:	e8 de fe ff ff       	call   c0107bd0 <cleanup_glue>
c0107cf2:	83 c4 1c             	add    $0x1c,%esp
c0107cf5:	5b                   	pop    %ebx
c0107cf6:	5e                   	pop    %esi
c0107cf7:	5f                   	pop    %edi
c0107cf8:	5d                   	pop    %ebp
c0107cf9:	c3                   	ret    
