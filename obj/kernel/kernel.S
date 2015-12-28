
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
c010002b:	e9 10 0b 00 00       	jmp    c0100b40 <init>

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
c0100066:	e8 45 13 00 00       	call   c01013b0 <get_updir>
c010006b:	89 c6                	mov    %eax,%esi
c010006d:	e8 4e 13 00 00       	call   c01013c0 <get_ucr3>
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
c01000d7:	a1 60 b3 10 c0       	mov    0xc010b360,%eax
c01000dc:	3d ff 7f 00 00       	cmp    $0x7fff,%eax
c01000e1:	0f 8f c1 01 00 00    	jg     c01002a8 <mm_malloc+0x258>
c01000e7:	89 c1                	mov    %eax,%ecx
c01000e9:	83 c0 01             	add    $0x1,%eax
c01000ec:	c1 e1 0c             	shl    $0xc,%ecx
c01000ef:	83 c9 07             	or     $0x7,%ecx
c01000f2:	89 0e                	mov    %ecx,(%esi)
c01000f4:	a3 60 b3 10 c0       	mov    %eax,0xc010b360
c01000f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
c01000ff:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
c0100102:	74 54                	je     c0100158 <mm_malloc+0x108>
c0100104:	89 d8                	mov    %ebx,%eax
c0100106:	c1 e8 16             	shr    $0x16,%eax
c0100109:	8d 0c 87             	lea    (%edi,%eax,4),%ecx
c010010c:	f6 01 01             	testb  $0x1,(%ecx)
c010010f:	75 a7                	jne    c01000b8 <mm_malloc+0x68>
c0100111:	a1 00 c0 10 c0       	mov    0xc010c000,%eax
c0100116:	89 c6                	mov    %eax,%esi
c0100118:	83 c0 01             	add    $0x1,%eax
c010011b:	c1 e6 0c             	shl    $0xc,%esi
c010011e:	81 c6 00 d0 10 c0    	add    $0xc010d000,%esi
c0100124:	a3 00 c0 10 c0       	mov    %eax,0xc010c000
c0100129:	8d 86 00 00 00 40    	lea    0x40000000(%esi),%eax
c010012f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0100134:	83 c8 07             	or     $0x7,%eax
c0100137:	89 01                	mov    %eax,(%ecx)
c0100139:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0100140:	00 
c0100141:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100148:	00 
c0100149:	89 34 24             	mov    %esi,(%esp)
c010014c:	e8 d7 1a 00 00       	call   c0101c28 <memset>
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
c0100178:	c7 44 24 10 e4 84 10 	movl   $0xc01084e4,0x10(%esp)
c010017f:	c0 
c0100180:	c7 44 24 0c 48 85 10 	movl   $0xc0108548,0xc(%esp)
c0100187:	c0 
c0100188:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010018f:	00 
c0100190:	c7 44 24 04 d3 84 10 	movl   $0xc01084d3,0x4(%esp)
c0100197:	c0 
c0100198:	c7 04 24 f4 84 10 c0 	movl   $0xc01084f4,(%esp)
c010019f:	e8 3c 15 00 00       	call   c01016e0 <printk>
c01001a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01001a9:	d6                   	(bad)  
c01001aa:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01001ad:	8d 86 00 00 00 c0    	lea    -0x40000000(%esi),%eax
c01001b3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01001b8:	c1 ea 0c             	shr    $0xc,%edx
c01001bb:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c01001c1:	f6 04 90 01          	testb  $0x1,(%eax,%edx,4)
c01001c5:	75 32                	jne    c01001f9 <mm_malloc+0x1a9>
c01001c7:	c7 44 24 10 ec 84 10 	movl   $0xc01084ec,0x10(%esp)
c01001ce:	c0 
c01001cf:	c7 44 24 0c 48 85 10 	movl   $0xc0108548,0xc(%esp)
c01001d6:	c0 
c01001d7:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c01001de:	00 
c01001df:	c7 44 24 04 d3 84 10 	movl   $0xc01084d3,0x4(%esp)
c01001e6:	c0 
c01001e7:	c7 04 24 f4 84 10 c0 	movl   $0xc01084f4,(%esp)
c01001ee:	e8 ed 14 00 00       	call   c01016e0 <printk>
c01001f3:	b8 01 00 00 00       	mov    $0x1,%eax
c01001f8:	d6                   	(bad)  
c01001f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01001fc:	c1 e8 16             	shr    $0x16,%eax
c01001ff:	8b 1c 83             	mov    (%ebx,%eax,4),%ebx
c0100202:	f6 c3 01             	test   $0x1,%bl
c0100205:	75 32                	jne    c0100239 <mm_malloc+0x1e9>
c0100207:	c7 44 24 10 e4 84 10 	movl   $0xc01084e4,0x10(%esp)
c010020e:	c0 
c010020f:	c7 44 24 0c 48 85 10 	movl   $0xc0108548,0xc(%esp)
c0100216:	c0 
c0100217:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
c010021e:	00 
c010021f:	c7 44 24 04 d3 84 10 	movl   $0xc01084d3,0x4(%esp)
c0100226:	c0 
c0100227:	c7 04 24 f4 84 10 c0 	movl   $0xc01084f4,(%esp)
c010022e:	e8 ad 14 00 00       	call   c01016e0 <printk>
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
c0100258:	c7 44 24 10 ec 84 10 	movl   $0xc01084ec,0x10(%esp)
c010025f:	c0 
c0100260:	c7 44 24 0c 48 85 10 	movl   $0xc0108548,0xc(%esp)
c0100267:	c0 
c0100268:	c7 44 24 08 13 00 00 	movl   $0x13,0x8(%esp)
c010026f:	00 
c0100270:	c7 44 24 04 d3 84 10 	movl   $0xc01084d3,0x4(%esp)
c0100277:	c0 
c0100278:	c7 04 24 f4 84 10 c0 	movl   $0xc01084f4,(%esp)
c010027f:	e8 5c 14 00 00       	call   c01016e0 <printk>
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
c01002a8:	c7 44 24 10 c0 84 10 	movl   $0xc01084c0,0x10(%esp)
c01002af:	c0 
c01002b0:	c7 44 24 0c 3e 85 10 	movl   $0xc010853e,0xc(%esp)
c01002b7:	c0 
c01002b8:	c7 44 24 08 31 00 00 	movl   $0x31,0x8(%esp)
c01002bf:	00 
c01002c0:	c7 44 24 04 d3 84 10 	movl   $0xc01084d3,0x4(%esp)
c01002c7:	c0 
c01002c8:	c7 04 24 f4 84 10 c0 	movl   $0xc01084f4,(%esp)
c01002cf:	e8 0c 14 00 00       	call   c01016e0 <printk>
c01002d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01002d9:	d6                   	(bad)  
c01002da:	a1 60 b3 10 c0       	mov    0xc010b360,%eax
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
c010039a:	e8 c1 09 00 00       	call   c0100d60 <irq_handle>
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
c01003be:	0f 84 9a 00 00 00    	je     c010045e <fs_open+0xae>
c01003c4:	be c0 88 10 c0       	mov    $0xc01088c0,%esi
c01003c9:	31 db                	xor    %ebx,%ebx
c01003cb:	eb 0e                	jmp    c01003db <fs_open+0x2b>
c01003cd:	8d 76 00             	lea    0x0(%esi),%esi
c01003d0:	83 c3 01             	add    $0x1,%ebx
c01003d3:	83 c6 0c             	add    $0xc,%esi
c01003d6:	83 fb 19             	cmp    $0x19,%ebx
c01003d9:	74 55                	je     c0100430 <fs_open+0x80>
c01003db:	83 ec 08             	sub    $0x8,%esp
c01003de:	ff 36                	pushl  (%esi)
c01003e0:	57                   	push   %edi
c01003e1:	e8 ca 18 00 00       	call   c0101cb0 <strcmp>
c01003e6:	83 c4 10             	add    $0x10,%esp
c01003e9:	85 c0                	test   %eax,%eax
c01003eb:	75 e3                	jne    c01003d0 <fs_open+0x20>
c01003ed:	83 c3 03             	add    $0x3,%ebx
c01003f0:	83 ec 0c             	sub    $0xc,%esp
c01003f3:	c6 04 dd 00 d0 12 c0 	movb   $0x1,-0x3fed3000(,%ebx,8)
c01003fa:	01 
c01003fb:	c7 04 dd 04 d0 12 c0 	movl   $0x0,-0x3fed2ffc(,%ebx,8)
c0100402:	00 00 00 00 
c0100406:	53                   	push   %ebx
c0100407:	68 a3 88 10 c0       	push   $0xc01088a3
c010040c:	6a 3e                	push   $0x3e
c010040e:	68 57 85 10 c0       	push   $0xc0108557
c0100413:	68 90 86 10 c0       	push   $0xc0108690
c0100418:	e8 c3 12 00 00       	call   c01016e0 <printk>
c010041d:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100420:	89 d8                	mov    %ebx,%eax
c0100422:	5b                   	pop    %ebx
c0100423:	5e                   	pop    %esi
c0100424:	5f                   	pop    %edi
c0100425:	5d                   	pop    %ebp
c0100426:	c3                   	ret    
c0100427:	89 f6                	mov    %esi,%esi
c0100429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100430:	83 ec 0c             	sub    $0xc,%esp
c0100433:	68 6a 85 10 c0       	push   $0xc010856a
c0100438:	68 a3 88 10 c0       	push   $0xc01088a3
c010043d:	6a 3b                	push   $0x3b
c010043f:	68 57 85 10 c0       	push   $0xc0108557
c0100444:	68 f4 84 10 c0       	push   $0xc01084f4
c0100449:	e8 92 12 00 00       	call   c01016e0 <printk>
c010044e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100453:	d6                   	(bad)  
c0100454:	bb 1c 00 00 00       	mov    $0x1c,%ebx
c0100459:	83 c4 20             	add    $0x20,%esp
c010045c:	eb 92                	jmp    c01003f0 <fs_open+0x40>
c010045e:	83 ec 0c             	sub    $0xc,%esp
c0100461:	68 4e 85 10 c0       	push   $0xc010854e
c0100466:	68 a3 88 10 c0       	push   $0xc01088a3
c010046b:	6a 34                	push   $0x34
c010046d:	68 57 85 10 c0       	push   $0xc0108557
c0100472:	68 f4 84 10 c0       	push   $0xc01084f4
c0100477:	e8 64 12 00 00       	call   c01016e0 <printk>
c010047c:	b8 01 00 00 00       	mov    $0x1,%eax
c0100481:	d6                   	(bad)  
c0100482:	83 c4 20             	add    $0x20,%esp
c0100485:	e9 3a ff ff ff       	jmp    c01003c4 <fs_open+0x14>
c010048a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0100490 <fs_read>:
c0100490:	55                   	push   %ebp
c0100491:	89 e5                	mov    %esp,%ebp
c0100493:	57                   	push   %edi
c0100494:	56                   	push   %esi
c0100495:	53                   	push   %ebx
c0100496:	83 ec 10             	sub    $0x10,%esp
c0100499:	8b 5d 08             	mov    0x8(%ebp),%ebx
c010049c:	ff 75 10             	pushl  0x10(%ebp)
c010049f:	ff 75 0c             	pushl  0xc(%ebp)
c01004a2:	8d 73 fd             	lea    -0x3(%ebx),%esi
c01004a5:	53                   	push   %ebx
c01004a6:	68 9b 88 10 c0       	push   $0xc010889b
c01004ab:	6a 43                	push   $0x43
c01004ad:	68 57 85 10 c0       	push   $0xc0108557
c01004b2:	68 c4 86 10 c0       	push   $0xc01086c4
c01004b7:	e8 24 12 00 00       	call   c01016e0 <printk>
c01004bc:	83 c4 20             	add    $0x20,%esp
c01004bf:	83 fe 18             	cmp    $0x18,%esi
c01004c2:	0f 87 f8 00 00 00    	ja     c01005c0 <fs_read+0x130>
c01004c8:	80 3c dd 00 d0 12 c0 	cmpb   $0x0,-0x3fed3000(,%ebx,8)
c01004cf:	00 
c01004d0:	0f 84 ba 00 00 00    	je     c0100590 <fs_read+0x100>
c01004d6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01004d9:	85 d2                	test   %edx,%edx
c01004db:	0f 84 1f 01 00 00    	je     c0100600 <fs_read+0x170>
c01004e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01004e4:	85 c0                	test   %eax,%eax
c01004e6:	74 78                	je     c0100560 <fs_read+0xd0>
c01004e8:	8d 04 76             	lea    (%esi,%esi,2),%eax
c01004eb:	8b 04 85 c4 88 10 c0 	mov    -0x3fef773c(,%eax,4),%eax
c01004f2:	2b 04 dd 04 d0 12 c0 	sub    -0x3fed2ffc(,%ebx,8),%eax
c01004f9:	85 c0                	test   %eax,%eax
c01004fb:	0f 8e ef 00 00 00    	jle    c01005f0 <fs_read+0x160>
c0100501:	3b 45 10             	cmp    0x10(%ebp),%eax
c0100504:	89 c7                	mov    %eax,%edi
c0100506:	7f 50                	jg     c0100558 <fs_read+0xc8>
c0100508:	83 ec 0c             	sub    $0xc,%esp
c010050b:	57                   	push   %edi
c010050c:	68 9b 88 10 c0       	push   $0xc010889b
c0100511:	6a 51                	push   $0x51
c0100513:	68 57 85 10 c0       	push   $0xc0108557
c0100518:	68 10 87 10 c0       	push   $0xc0108710
c010051d:	e8 be 11 00 00       	call   c01016e0 <printk>
c0100522:	8d 14 76             	lea    (%esi,%esi,2),%edx
c0100525:	83 c4 1c             	add    $0x1c,%esp
c0100528:	57                   	push   %edi
c0100529:	8b 14 95 c8 88 10 c0 	mov    -0x3fef7738(,%edx,4),%edx
c0100530:	03 14 dd 04 d0 12 c0 	add    -0x3fed2ffc(,%ebx,8),%edx
c0100537:	52                   	push   %edx
c0100538:	ff 75 0c             	pushl  0xc(%ebp)
c010053b:	e8 00 13 00 00       	call   c0101840 <ide_read>
c0100540:	01 3c dd 04 d0 12 c0 	add    %edi,-0x3fed2ffc(,%ebx,8)
c0100547:	83 c4 10             	add    $0x10,%esp
c010054a:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010054d:	89 f8                	mov    %edi,%eax
c010054f:	5b                   	pop    %ebx
c0100550:	5e                   	pop    %esi
c0100551:	5f                   	pop    %edi
c0100552:	5d                   	pop    %ebp
c0100553:	c3                   	ret    
c0100554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100558:	8b 7d 10             	mov    0x10(%ebp),%edi
c010055b:	eb ab                	jmp    c0100508 <fs_read+0x78>
c010055d:	8d 76 00             	lea    0x0(%esi),%esi
c0100560:	83 ec 0c             	sub    $0xc,%esp
c0100563:	68 a9 85 10 c0       	push   $0xc01085a9
c0100568:	68 9b 88 10 c0       	push   $0xc010889b
c010056d:	6a 48                	push   $0x48
c010056f:	68 57 85 10 c0       	push   $0xc0108557
c0100574:	68 f4 84 10 c0       	push   $0xc01084f4
c0100579:	e8 62 11 00 00       	call   c01016e0 <printk>
c010057e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100583:	d6                   	(bad)  
c0100584:	83 c4 20             	add    $0x20,%esp
c0100587:	e9 5c ff ff ff       	jmp    c01004e8 <fs_read+0x58>
c010058c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100590:	83 ec 0c             	sub    $0xc,%esp
c0100593:	68 94 85 10 c0       	push   $0xc0108594
c0100598:	68 9b 88 10 c0       	push   $0xc010889b
c010059d:	6a 45                	push   $0x45
c010059f:	68 57 85 10 c0       	push   $0xc0108557
c01005a4:	68 f4 84 10 c0       	push   $0xc01084f4
c01005a9:	e8 32 11 00 00       	call   c01016e0 <printk>
c01005ae:	b8 01 00 00 00       	mov    $0x1,%eax
c01005b3:	d6                   	(bad)  
c01005b4:	83 c4 20             	add    $0x20,%esp
c01005b7:	e9 1a ff ff ff       	jmp    c01004d6 <fs_read+0x46>
c01005bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01005c0:	83 ec 0c             	sub    $0xc,%esp
c01005c3:	68 77 85 10 c0       	push   $0xc0108577
c01005c8:	68 9b 88 10 c0       	push   $0xc010889b
c01005cd:	6a 44                	push   $0x44
c01005cf:	68 57 85 10 c0       	push   $0xc0108557
c01005d4:	68 f4 84 10 c0       	push   $0xc01084f4
c01005d9:	e8 02 11 00 00       	call   c01016e0 <printk>
c01005de:	b8 01 00 00 00       	mov    $0x1,%eax
c01005e3:	d6                   	(bad)  
c01005e4:	83 c4 20             	add    $0x20,%esp
c01005e7:	e9 dc fe ff ff       	jmp    c01004c8 <fs_read+0x38>
c01005ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01005f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01005f3:	31 ff                	xor    %edi,%edi
c01005f5:	89 f8                	mov    %edi,%eax
c01005f7:	5b                   	pop    %ebx
c01005f8:	5e                   	pop    %esi
c01005f9:	5f                   	pop    %edi
c01005fa:	5d                   	pop    %ebp
c01005fb:	c3                   	ret    
c01005fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100600:	83 ec 0c             	sub    $0xc,%esp
c0100603:	68 a5 85 10 c0       	push   $0xc01085a5
c0100608:	68 9b 88 10 c0       	push   $0xc010889b
c010060d:	6a 47                	push   $0x47
c010060f:	68 57 85 10 c0       	push   $0xc0108557
c0100614:	68 f4 84 10 c0       	push   $0xc01084f4
c0100619:	e8 c2 10 00 00       	call   c01016e0 <printk>
c010061e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100623:	d6                   	(bad)  
c0100624:	83 c4 20             	add    $0x20,%esp
c0100627:	e9 b5 fe ff ff       	jmp    c01004e1 <fs_read+0x51>
c010062c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100630 <fs_write>:
c0100630:	55                   	push   %ebp
c0100631:	89 e5                	mov    %esp,%ebp
c0100633:	57                   	push   %edi
c0100634:	56                   	push   %esi
c0100635:	53                   	push   %ebx
c0100636:	83 ec 18             	sub    $0x18,%esp
c0100639:	8b 7d 08             	mov    0x8(%ebp),%edi
c010063c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010063f:	8b 75 10             	mov    0x10(%ebp),%esi
c0100642:	57                   	push   %edi
c0100643:	68 92 88 10 c0       	push   $0xc0108892
c0100648:	6a 59                	push   $0x59
c010064a:	68 57 85 10 c0       	push   $0xc0108557
c010064f:	68 3c 87 10 c0       	push   $0xc010873c
c0100654:	e8 87 10 00 00       	call   c01016e0 <printk>
c0100659:	8d 47 ff             	lea    -0x1(%edi),%eax
c010065c:	83 c4 20             	add    $0x20,%esp
c010065f:	83 f8 1a             	cmp    $0x1a,%eax
c0100662:	0f 87 d8 00 00 00    	ja     c0100740 <fs_write+0x110>
c0100668:	85 db                	test   %ebx,%ebx
c010066a:	0f 84 70 01 00 00    	je     c01007e0 <fs_write+0x1b0>
c0100670:	85 f6                	test   %esi,%esi
c0100672:	0f 84 90 00 00 00    	je     c0100708 <fs_write+0xd8>
c0100678:	83 ff 01             	cmp    $0x1,%edi
c010067b:	0f 84 ef 00 00 00    	je     c0100770 <fs_write+0x140>
c0100681:	83 ff 02             	cmp    $0x2,%edi
c0100684:	0f 84 82 01 00 00    	je     c010080c <fs_write+0x1dc>
c010068a:	68 92 88 10 c0       	push   $0xc0108892
c010068f:	6a 6b                	push   $0x6b
c0100691:	68 57 85 10 c0       	push   $0xc0108557
c0100696:	68 70 87 10 c0       	push   $0xc0108770
c010069b:	e8 40 10 00 00       	call   c01016e0 <printk>
c01006a0:	83 c4 10             	add    $0x10,%esp
c01006a3:	80 3c fd 00 d0 12 c0 	cmpb   $0x0,-0x3fed3000(,%edi,8)
c01006aa:	00 
c01006ab:	0f 84 ef 00 00 00    	je     c01007a0 <fs_write+0x170>
c01006b1:	8d 57 fd             	lea    -0x3(%edi),%edx
c01006b4:	8b 0c fd 04 d0 12 c0 	mov    -0x3fed2ffc(,%edi,8),%ecx
c01006bb:	8d 04 52             	lea    (%edx,%edx,2),%eax
c01006be:	8b 04 85 c4 88 10 c0 	mov    -0x3fef773c(,%eax,4),%eax
c01006c5:	29 c8                	sub    %ecx,%eax
c01006c7:	85 c0                	test   %eax,%eax
c01006c9:	0f 8e 01 01 00 00    	jle    c01007d0 <fs_write+0x1a0>
c01006cf:	39 c6                	cmp    %eax,%esi
c01006d1:	7f 2d                	jg     c0100700 <fs_write+0xd0>
c01006d3:	8d 04 52             	lea    (%edx,%edx,2),%eax
c01006d6:	83 ec 04             	sub    $0x4,%esp
c01006d9:	56                   	push   %esi
c01006da:	03 0c 85 c8 88 10 c0 	add    -0x3fef7738(,%eax,4),%ecx
c01006e1:	51                   	push   %ecx
c01006e2:	53                   	push   %ebx
c01006e3:	e8 98 11 00 00       	call   c0101880 <ide_write>
c01006e8:	01 34 fd 04 d0 12 c0 	add    %esi,-0x3fed2ffc(,%edi,8)
c01006ef:	83 c4 10             	add    $0x10,%esp
c01006f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01006f5:	89 f0                	mov    %esi,%eax
c01006f7:	5b                   	pop    %ebx
c01006f8:	5e                   	pop    %esi
c01006f9:	5f                   	pop    %edi
c01006fa:	5d                   	pop    %ebp
c01006fb:	c3                   	ret    
c01006fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100700:	89 c6                	mov    %eax,%esi
c0100702:	eb cf                	jmp    c01006d3 <fs_write+0xa3>
c0100704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100708:	83 ec 0c             	sub    $0xc,%esp
c010070b:	68 a9 85 10 c0       	push   $0xc01085a9
c0100710:	68 92 88 10 c0       	push   $0xc0108892
c0100715:	6a 5c                	push   $0x5c
c0100717:	68 57 85 10 c0       	push   $0xc0108557
c010071c:	68 f4 84 10 c0       	push   $0xc01084f4
c0100721:	e8 ba 0f 00 00       	call   c01016e0 <printk>
c0100726:	b8 01 00 00 00       	mov    $0x1,%eax
c010072b:	d6                   	(bad)  
c010072c:	83 c4 20             	add    $0x20,%esp
c010072f:	83 ff 01             	cmp    $0x1,%edi
c0100732:	0f 85 49 ff ff ff    	jne    c0100681 <fs_write+0x51>
c0100738:	eb b8                	jmp    c01006f2 <fs_write+0xc2>
c010073a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100740:	83 ec 0c             	sub    $0xc,%esp
c0100743:	68 ad 85 10 c0       	push   $0xc01085ad
c0100748:	68 92 88 10 c0       	push   $0xc0108892
c010074d:	6a 5a                	push   $0x5a
c010074f:	68 57 85 10 c0       	push   $0xc0108557
c0100754:	68 f4 84 10 c0       	push   $0xc01084f4
c0100759:	e8 82 0f 00 00       	call   c01016e0 <printk>
c010075e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100763:	d6                   	(bad)  
c0100764:	83 c4 20             	add    $0x20,%esp
c0100767:	e9 fc fe ff ff       	jmp    c0100668 <fs_write+0x38>
c010076c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100770:	85 f6                	test   %esi,%esi
c0100772:	0f 8e 7a ff ff ff    	jle    c01006f2 <fs_write+0xc2>
c0100778:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
c010077b:	90                   	nop
c010077c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100780:	0f be 03             	movsbl (%ebx),%eax
c0100783:	83 ec 0c             	sub    $0xc,%esp
c0100786:	83 c3 01             	add    $0x1,%ebx
c0100789:	50                   	push   %eax
c010078a:	e8 f1 0f 00 00       	call   c0101780 <serial_printc>
c010078f:	83 c4 10             	add    $0x10,%esp
c0100792:	39 fb                	cmp    %edi,%ebx
c0100794:	75 ea                	jne    c0100780 <fs_write+0x150>
c0100796:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0100799:	89 f0                	mov    %esi,%eax
c010079b:	5b                   	pop    %ebx
c010079c:	5e                   	pop    %esi
c010079d:	5f                   	pop    %edi
c010079e:	5d                   	pop    %ebp
c010079f:	c3                   	ret    
c01007a0:	83 ec 0c             	sub    $0xc,%esp
c01007a3:	68 94 85 10 c0       	push   $0xc0108594
c01007a8:	68 92 88 10 c0       	push   $0xc0108892
c01007ad:	6a 6c                	push   $0x6c
c01007af:	68 57 85 10 c0       	push   $0xc0108557
c01007b4:	68 f4 84 10 c0       	push   $0xc01084f4
c01007b9:	e8 22 0f 00 00       	call   c01016e0 <printk>
c01007be:	b8 01 00 00 00       	mov    $0x1,%eax
c01007c3:	d6                   	(bad)  
c01007c4:	83 c4 20             	add    $0x20,%esp
c01007c7:	e9 e5 fe ff ff       	jmp    c01006b1 <fs_write+0x81>
c01007cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01007d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01007d3:	31 f6                	xor    %esi,%esi
c01007d5:	89 f0                	mov    %esi,%eax
c01007d7:	5b                   	pop    %ebx
c01007d8:	5e                   	pop    %esi
c01007d9:	5f                   	pop    %edi
c01007da:	5d                   	pop    %ebp
c01007db:	c3                   	ret    
c01007dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01007e0:	83 ec 0c             	sub    $0xc,%esp
c01007e3:	68 a5 85 10 c0       	push   $0xc01085a5
c01007e8:	68 92 88 10 c0       	push   $0xc0108892
c01007ed:	6a 5b                	push   $0x5b
c01007ef:	68 57 85 10 c0       	push   $0xc0108557
c01007f4:	68 f4 84 10 c0       	push   $0xc01084f4
c01007f9:	e8 e2 0e 00 00       	call   c01016e0 <printk>
c01007fe:	b8 01 00 00 00       	mov    $0x1,%eax
c0100803:	d6                   	(bad)  
c0100804:	83 c4 20             	add    $0x20,%esp
c0100807:	e9 64 fe ff ff       	jmp    c0100670 <fs_write+0x40>
c010080c:	83 ec 0c             	sub    $0xc,%esp
c010080f:	68 c9 85 10 c0       	push   $0xc01085c9
c0100814:	68 92 88 10 c0       	push   $0xc0108892
c0100819:	6a 68                	push   $0x68
c010081b:	68 57 85 10 c0       	push   $0xc0108557
c0100820:	68 f4 84 10 c0       	push   $0xc01084f4
c0100825:	e8 b6 0e 00 00       	call   c01016e0 <printk>
c010082a:	b8 01 00 00 00       	mov    $0x1,%eax
c010082f:	d6                   	(bad)  
c0100830:	be ff ff ff ff       	mov    $0xffffffff,%esi
c0100835:	83 c4 20             	add    $0x20,%esp
c0100838:	e9 b5 fe ff ff       	jmp    c01006f2 <fs_write+0xc2>
c010083d:	8d 76 00             	lea    0x0(%esi),%esi

c0100840 <fs_lseek>:
c0100840:	55                   	push   %ebp
c0100841:	89 e5                	mov    %esp,%ebp
c0100843:	57                   	push   %edi
c0100844:	56                   	push   %esi
c0100845:	53                   	push   %ebx
c0100846:	83 ec 20             	sub    $0x20,%esp
c0100849:	8b 7d 08             	mov    0x8(%ebp),%edi
c010084c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010084f:	8b 75 10             	mov    0x10(%ebp),%esi
c0100852:	56                   	push   %esi
c0100853:	53                   	push   %ebx
c0100854:	57                   	push   %edi
c0100855:	68 89 88 10 c0       	push   $0xc0108889
c010085a:	6a 7e                	push   $0x7e
c010085c:	68 57 85 10 c0       	push   $0xc0108557
c0100861:	68 a0 87 10 c0       	push   $0xc01087a0
c0100866:	e8 75 0e 00 00       	call   c01016e0 <printk>
c010086b:	8d 57 fd             	lea    -0x3(%edi),%edx
c010086e:	83 c4 20             	add    $0x20,%esp
c0100871:	83 fa 18             	cmp    $0x18,%edx
c0100874:	0f 87 96 01 00 00    	ja     c0100a10 <fs_lseek+0x1d0>
c010087a:	80 3c fd 00 d0 12 c0 	cmpb   $0x0,-0x3fed3000(,%edi,8)
c0100881:	00 
c0100882:	0f 84 30 01 00 00    	je     c01009b8 <fs_lseek+0x178>
c0100888:	83 fe 01             	cmp    $0x1,%esi
c010088b:	0f 84 60 01 00 00    	je     c01009f1 <fs_lseek+0x1b1>
c0100891:	83 fe 02             	cmp    $0x2,%esi
c0100894:	0f 84 ae 01 00 00    	je     c0100a48 <fs_lseek+0x208>
c010089a:	85 f6                	test   %esi,%esi
c010089c:	0f 84 96 00 00 00    	je     c0100938 <fs_lseek+0xf8>
c01008a2:	83 ec 0c             	sub    $0xc,%esp
c01008a5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01008a8:	68 c9 85 10 c0       	push   $0xc01085c9
c01008ad:	68 89 88 10 c0       	push   $0xc0108889
c01008b2:	68 87 00 00 00       	push   $0x87
c01008b7:	68 57 85 10 c0       	push   $0xc0108557
c01008bc:	68 f4 84 10 c0       	push   $0xc01084f4
c01008c1:	e8 1a 0e 00 00       	call   c01016e0 <printk>
c01008c6:	b8 01 00 00 00       	mov    $0x1,%eax
c01008cb:	d6                   	(bad)  
c01008cc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01008cf:	83 c4 20             	add    $0x20,%esp
c01008d2:	8d 04 52             	lea    (%edx,%edx,2),%eax
c01008d5:	8b 34 85 c4 88 10 c0 	mov    -0x3fef773c(,%eax,4),%esi
c01008dc:	83 fe ff             	cmp    $0xffffffff,%esi
c01008df:	75 69                	jne    c010094a <fs_lseek+0x10a>
c01008e1:	83 ec 0c             	sub    $0xc,%esp
c01008e4:	83 cb ff             	or     $0xffffffff,%ebx
c01008e7:	6a ff                	push   $0xffffffff
c01008e9:	68 89 88 10 c0       	push   $0xc0108889
c01008ee:	68 8a 00 00 00       	push   $0x8a
c01008f3:	68 57 85 10 c0       	push   $0xc0108557
c01008f8:	68 ec 87 10 c0       	push   $0xc01087ec
c01008fd:	e8 de 0d 00 00       	call   c01016e0 <printk>
c0100902:	83 c4 20             	add    $0x20,%esp
c0100905:	8d 76 00             	lea    0x0(%esi),%esi
c0100908:	83 ec 0c             	sub    $0xc,%esp
c010090b:	68 20 88 10 c0       	push   $0xc0108820
c0100910:	68 89 88 10 c0       	push   $0xc0108889
c0100915:	68 8b 00 00 00       	push   $0x8b
c010091a:	68 57 85 10 c0       	push   $0xc0108557
c010091f:	68 f4 84 10 c0       	push   $0xc01084f4
c0100924:	e8 b7 0d 00 00       	call   c01016e0 <printk>
c0100929:	b8 01 00 00 00       	mov    $0x1,%eax
c010092e:	d6                   	(bad)  
c010092f:	83 c4 20             	add    $0x20,%esp
c0100932:	eb 3c                	jmp    c0100970 <fs_lseek+0x130>
c0100934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100938:	8d 04 52             	lea    (%edx,%edx,2),%eax
c010093b:	8b 04 85 c4 88 10 c0 	mov    -0x3fef773c(,%eax,4),%eax
c0100942:	39 c3                	cmp    %eax,%ebx
c0100944:	89 de                	mov    %ebx,%esi
c0100946:	76 40                	jbe    c0100988 <fs_lseek+0x148>
c0100948:	89 c6                	mov    %eax,%esi
c010094a:	83 ec 0c             	sub    $0xc,%esp
c010094d:	89 f3                	mov    %esi,%ebx
c010094f:	56                   	push   %esi
c0100950:	68 89 88 10 c0       	push   $0xc0108889
c0100955:	68 8a 00 00 00       	push   $0x8a
c010095a:	68 57 85 10 c0       	push   $0xc0108557
c010095f:	68 ec 87 10 c0       	push   $0xc01087ec
c0100964:	e8 77 0d 00 00       	call   c01016e0 <printk>
c0100969:	83 c4 20             	add    $0x20,%esp
c010096c:	85 f6                	test   %esi,%esi
c010096e:	78 98                	js     c0100908 <fs_lseek+0xc8>
c0100970:	89 34 fd 04 d0 12 c0 	mov    %esi,-0x3fed2ffc(,%edi,8)
c0100977:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010097a:	89 d8                	mov    %ebx,%eax
c010097c:	5b                   	pop    %ebx
c010097d:	5e                   	pop    %esi
c010097e:	5f                   	pop    %edi
c010097f:	5d                   	pop    %ebp
c0100980:	c3                   	ret    
c0100981:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100988:	83 ec 0c             	sub    $0xc,%esp
c010098b:	53                   	push   %ebx
c010098c:	68 89 88 10 c0       	push   $0xc0108889
c0100991:	68 8a 00 00 00       	push   $0x8a
c0100996:	68 57 85 10 c0       	push   $0xc0108557
c010099b:	68 ec 87 10 c0       	push   $0xc01087ec
c01009a0:	e8 3b 0d 00 00       	call   c01016e0 <printk>
c01009a5:	83 c4 20             	add    $0x20,%esp
c01009a8:	85 db                	test   %ebx,%ebx
c01009aa:	79 c4                	jns    c0100970 <fs_lseek+0x130>
c01009ac:	e9 57 ff ff ff       	jmp    c0100908 <fs_lseek+0xc8>
c01009b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01009b8:	83 ec 0c             	sub    $0xc,%esp
c01009bb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01009be:	68 94 85 10 c0       	push   $0xc0108594
c01009c3:	68 89 88 10 c0       	push   $0xc0108889
c01009c8:	68 80 00 00 00       	push   $0x80
c01009cd:	68 57 85 10 c0       	push   $0xc0108557
c01009d2:	68 f4 84 10 c0       	push   $0xc01084f4
c01009d7:	e8 04 0d 00 00       	call   c01016e0 <printk>
c01009dc:	b8 01 00 00 00       	mov    $0x1,%eax
c01009e1:	d6                   	(bad)  
c01009e2:	83 c4 20             	add    $0x20,%esp
c01009e5:	83 fe 01             	cmp    $0x1,%esi
c01009e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01009eb:	0f 85 a0 fe ff ff    	jne    c0100891 <fs_lseek+0x51>
c01009f1:	8d 04 52             	lea    (%edx,%edx,2),%eax
c01009f4:	03 1c fd 04 d0 12 c0 	add    -0x3fed2ffc(,%edi,8),%ebx
c01009fb:	8b 04 85 c4 88 10 c0 	mov    -0x3fef773c(,%eax,4),%eax
c0100a02:	e9 3b ff ff ff       	jmp    c0100942 <fs_lseek+0x102>
c0100a07:	89 f6                	mov    %esi,%esi
c0100a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100a10:	83 ec 0c             	sub    $0xc,%esp
c0100a13:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0100a16:	68 77 85 10 c0       	push   $0xc0108577
c0100a1b:	68 89 88 10 c0       	push   $0xc0108889
c0100a20:	6a 7f                	push   $0x7f
c0100a22:	68 57 85 10 c0       	push   $0xc0108557
c0100a27:	68 f4 84 10 c0       	push   $0xc01084f4
c0100a2c:	e8 af 0c 00 00       	call   c01016e0 <printk>
c0100a31:	b8 01 00 00 00       	mov    $0x1,%eax
c0100a36:	d6                   	(bad)  
c0100a37:	83 c4 20             	add    $0x20,%esp
c0100a3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100a3d:	e9 38 fe ff ff       	jmp    c010087a <fs_lseek+0x3a>
c0100a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100a48:	8d 04 52             	lea    (%edx,%edx,2),%eax
c0100a4b:	8b 04 85 c4 88 10 c0 	mov    -0x3fef773c(,%eax,4),%eax
c0100a52:	01 c3                	add    %eax,%ebx
c0100a54:	e9 e9 fe ff ff       	jmp    c0100942 <fs_lseek+0x102>
c0100a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0100a60 <fs_close>:
c0100a60:	55                   	push   %ebp
c0100a61:	89 e5                	mov    %esp,%ebp
c0100a63:	53                   	push   %ebx
c0100a64:	83 ec 04             	sub    $0x4,%esp
c0100a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100a6a:	8d 43 fd             	lea    -0x3(%ebx),%eax
c0100a6d:	83 f8 18             	cmp    $0x18,%eax
c0100a70:	76 2a                	jbe    c0100a9c <fs_close+0x3c>
c0100a72:	83 ec 0c             	sub    $0xc,%esp
c0100a75:	68 77 85 10 c0       	push   $0xc0108577
c0100a7a:	68 80 88 10 c0       	push   $0xc0108880
c0100a7f:	68 91 00 00 00       	push   $0x91
c0100a84:	68 57 85 10 c0       	push   $0xc0108557
c0100a89:	68 f4 84 10 c0       	push   $0xc01084f4
c0100a8e:	e8 4d 0c 00 00       	call   c01016e0 <printk>
c0100a93:	b8 01 00 00 00       	mov    $0x1,%eax
c0100a98:	d6                   	(bad)  
c0100a99:	83 c4 20             	add    $0x20,%esp
c0100a9c:	c6 04 dd 00 d0 12 c0 	movb   $0x0,-0x3fed3000(,%ebx,8)
c0100aa3:	00 
c0100aa4:	31 c0                	xor    %eax,%eax
c0100aa6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100aa9:	c9                   	leave  
c0100aaa:	c3                   	ret    
c0100aab:	66 90                	xchg   %ax,%ax
c0100aad:	66 90                	xchg   %ax,%ax
c0100aaf:	90                   	nop

c0100ab0 <init_cond>:
c0100ab0:	55                   	push   %ebp
c0100ab1:	89 e5                	mov    %esp,%ebp
c0100ab3:	53                   	push   %ebx
c0100ab4:	83 ec 04             	sub    $0x4,%esp
c0100ab7:	e8 34 0a 00 00       	call   c01014f0 <init_segment>
c0100abc:	e8 ff 03 00 00       	call   c0100ec0 <init_idt>
c0100ac1:	e8 8a 03 00 00       	call   c0100e50 <init_i8259>
c0100ac6:	e8 75 0c 00 00       	call   c0101740 <init_serial>
c0100acb:	e8 30 0e 00 00       	call   c0101900 <init_ide>
c0100ad0:	fb                   	sti    
c0100ad1:	e8 2a 09 00 00       	call   c0101400 <init_mm>
c0100ad6:	68 7f 8a 10 c0       	push   $0xc0108a7f
c0100adb:	6a 4a                	push   $0x4a
c0100add:	68 ec 89 10 c0       	push   $0xc01089ec
c0100ae2:	68 00 8a 10 c0       	push   $0xc0108a00
c0100ae7:	e8 f4 0b 00 00       	call   c01016e0 <printk>
c0100aec:	e8 2f 08 00 00       	call   c0101320 <video_mapping_write_test>
c0100af1:	e8 aa 0a 00 00       	call   c01015a0 <loader>
c0100af6:	89 c3                	mov    %eax,%ebx
c0100af8:	e8 43 08 00 00       	call   c0101340 <video_mapping_read_test>
c0100afd:	e8 8e 08 00 00       	call   c0101390 <video_mapping_clear>
c0100b02:	bc 00 00 00 c0       	mov    $0xc0000000,%esp
c0100b07:	bd 00 00 00 00       	mov    $0x0,%ebp
c0100b0c:	83 ec 10             	sub    $0x10,%esp
c0100b0f:	ff d3                	call   *%ebx
c0100b11:	68 7f 8a 10 c0       	push   $0xc0108a7f
c0100b16:	6a 6b                	push   $0x6b
c0100b18:	68 ec 89 10 c0       	push   $0xc01089ec
c0100b1d:	68 34 8a 10 c0       	push   $0xc0108a34
c0100b22:	e8 b9 0b 00 00       	call   c01016e0 <printk>
c0100b27:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b2c:	d6                   	(bad)  
c0100b2d:	83 c4 20             	add    $0x20,%esp
c0100b30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100b33:	c9                   	leave  
c0100b34:	c3                   	ret    
c0100b35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0100b40 <init>:
c0100b40:	55                   	push   %ebp
c0100b41:	89 e5                	mov    %esp,%ebp
c0100b43:	83 ec 08             	sub    $0x8,%esp
c0100b46:	e8 25 09 00 00       	call   c0101470 <init_page>
c0100b4b:	81 c4 00 00 00 c0    	add    $0xc0000000,%esp
c0100b51:	b8 b0 0a 10 c0       	mov    $0xc0100ab0,%eax
c0100b56:	ff e0                	jmp    *%eax
c0100b58:	68 89 8a 10 c0       	push   $0xc0108a89
c0100b5d:	6a 24                	push   $0x24
c0100b5f:	68 ec 89 10 c0       	push   $0xc01089ec
c0100b64:	68 34 8a 10 c0       	push   $0xc0108a34
c0100b69:	e8 72 0b 00 00       	call   c01016e0 <printk>
c0100b6e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100b73:	d6                   	(bad)  
c0100b74:	83 c4 10             	add    $0x10,%esp
c0100b77:	c9                   	leave  
c0100b78:	c3                   	ret    
c0100b79:	66 90                	xchg   %ax,%ax
c0100b7b:	66 90                	xchg   %ax,%ax
c0100b7d:	66 90                	xchg   %ax,%ax
c0100b7f:	90                   	nop

c0100b80 <do_syscall>:
c0100b80:	55                   	push   %ebp
c0100b81:	89 e5                	mov    %esp,%ebp
c0100b83:	53                   	push   %ebx
c0100b84:	83 ec 04             	sub    $0x4,%esp
c0100b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100b8a:	8b 43 1c             	mov    0x1c(%ebx),%eax
c0100b8d:	83 f8 2d             	cmp    $0x2d,%eax
c0100b90:	0f 87 ea 00 00 00    	ja     c0100c80 <do_syscall+0x100>
c0100b96:	ff 24 85 04 8b 10 c0 	jmp    *-0x3fef74fc(,%eax,4)
c0100b9d:	8d 76 00             	lea    0x0(%esi),%esi
c0100ba0:	83 ec 0c             	sub    $0xc,%esp
c0100ba3:	ff 73 10             	pushl  0x10(%ebx)
c0100ba6:	e8 25 08 00 00       	call   c01013d0 <mm_brk>
c0100bab:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
c0100bb2:	83 c4 10             	add    $0x10,%esp
c0100bb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bb8:	c9                   	leave  
c0100bb9:	c3                   	ret    
c0100bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100bc0:	fa                   	cli    
c0100bc1:	83 ec 08             	sub    $0x8,%esp
c0100bc4:	ff 73 18             	pushl  0x18(%ebx)
c0100bc7:	ff 73 10             	pushl  0x10(%ebx)
c0100bca:	e8 e1 00 00 00       	call   c0100cb0 <add_irq_handle>
c0100bcf:	fb                   	sti    
c0100bd0:	83 c4 10             	add    $0x10,%esp
c0100bd3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bd6:	c9                   	leave  
c0100bd7:	c3                   	ret    
c0100bd8:	90                   	nop
c0100bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100be0:	83 ec 04             	sub    $0x4,%esp
c0100be3:	ff 73 14             	pushl  0x14(%ebx)
c0100be6:	ff 73 18             	pushl  0x18(%ebx)
c0100be9:	ff 73 10             	pushl  0x10(%ebx)
c0100bec:	e8 9f f8 ff ff       	call   c0100490 <fs_read>
c0100bf1:	83 c4 10             	add    $0x10,%esp
c0100bf4:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100bf7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100bfa:	c9                   	leave  
c0100bfb:	c3                   	ret    
c0100bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100c00:	83 ec 04             	sub    $0x4,%esp
c0100c03:	ff 73 14             	pushl  0x14(%ebx)
c0100c06:	ff 73 18             	pushl  0x18(%ebx)
c0100c09:	ff 73 10             	pushl  0x10(%ebx)
c0100c0c:	e8 1f fa ff ff       	call   c0100630 <fs_write>
c0100c11:	83 c4 10             	add    $0x10,%esp
c0100c14:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100c17:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c1a:	c9                   	leave  
c0100c1b:	c3                   	ret    
c0100c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100c20:	83 ec 08             	sub    $0x8,%esp
c0100c23:	ff 73 18             	pushl  0x18(%ebx)
c0100c26:	ff 73 10             	pushl  0x10(%ebx)
c0100c29:	e8 82 f7 ff ff       	call   c01003b0 <fs_open>
c0100c2e:	83 c4 10             	add    $0x10,%esp
c0100c31:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100c34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c37:	c9                   	leave  
c0100c38:	c3                   	ret    
c0100c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100c40:	83 ec 0c             	sub    $0xc,%esp
c0100c43:	ff 73 10             	pushl  0x10(%ebx)
c0100c46:	e8 15 fe ff ff       	call   c0100a60 <fs_close>
c0100c4b:	83 c4 10             	add    $0x10,%esp
c0100c4e:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100c51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c54:	c9                   	leave  
c0100c55:	c3                   	ret    
c0100c56:	8d 76 00             	lea    0x0(%esi),%esi
c0100c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0100c60:	83 ec 04             	sub    $0x4,%esp
c0100c63:	ff 73 14             	pushl  0x14(%ebx)
c0100c66:	ff 73 18             	pushl  0x18(%ebx)
c0100c69:	ff 73 10             	pushl  0x10(%ebx)
c0100c6c:	e8 cf fb ff ff       	call   c0100840 <fs_lseek>
c0100c71:	83 c4 10             	add    $0x10,%esp
c0100c74:	89 43 1c             	mov    %eax,0x1c(%ebx)
c0100c77:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c7a:	c9                   	leave  
c0100c7b:	c3                   	ret    
c0100c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100c80:	83 ec 0c             	sub    $0xc,%esp
c0100c83:	50                   	push   %eax
c0100c84:	68 bc 8b 10 c0       	push   $0xc0108bbc
c0100c89:	6a 30                	push   $0x30
c0100c8b:	68 90 8a 10 c0       	push   $0xc0108a90
c0100c90:	68 b0 8a 10 c0       	push   $0xc0108ab0
c0100c95:	e8 46 0a 00 00       	call   c01016e0 <printk>
c0100c9a:	b8 01 00 00 00       	mov    $0x1,%eax
c0100c9f:	d6                   	(bad)  
c0100ca0:	83 c4 20             	add    $0x20,%esp
c0100ca3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100ca6:	c9                   	leave  
c0100ca7:	c3                   	ret    
c0100ca8:	66 90                	xchg   %ax,%ax
c0100caa:	66 90                	xchg   %ax,%ax
c0100cac:	66 90                	xchg   %ax,%ax
c0100cae:	66 90                	xchg   %ax,%ax

c0100cb0 <add_irq_handle>:
c0100cb0:	55                   	push   %ebp
c0100cb1:	89 e5                	mov    %esp,%ebp
c0100cb3:	53                   	push   %ebx
c0100cb4:	83 ec 04             	sub    $0x4,%esp
c0100cb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0100cba:	83 fb 0f             	cmp    $0xf,%ebx
c0100cbd:	7f 71                	jg     c0100d30 <add_irq_handle+0x80>
c0100cbf:	a1 00 d1 12 c0       	mov    0xc012d100,%eax
c0100cc4:	83 f8 20             	cmp    $0x20,%eax
c0100cc7:	7e 2c                	jle    c0100cf5 <add_irq_handle+0x45>
c0100cc9:	83 ec 0c             	sub    $0xc,%esp
c0100ccc:	68 f6 8b 10 c0       	push   $0xc0108bf6
c0100cd1:	68 dd 8c 10 c0       	push   $0xc0108cdd
c0100cd6:	6a 16                	push   $0x16
c0100cd8:	68 da 8b 10 c0       	push   $0xc0108bda
c0100cdd:	68 f4 84 10 c0       	push   $0xc01084f4
c0100ce2:	e8 f9 09 00 00       	call   c01016e0 <printk>
c0100ce7:	b8 01 00 00 00       	mov    $0x1,%eax
c0100cec:	d6                   	(bad)  
c0100ced:	a1 00 d1 12 c0       	mov    0xc012d100,%eax
c0100cf2:	83 c4 20             	add    $0x20,%esp
c0100cf5:	8d 50 01             	lea    0x1(%eax),%edx
c0100cf8:	89 15 00 d1 12 c0    	mov    %edx,0xc012d100
c0100cfe:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100d01:	89 14 c5 80 d1 12 c0 	mov    %edx,-0x3fed2e80(,%eax,8)
c0100d08:	8b 14 9d 40 d1 12 c0 	mov    -0x3fed2ec0(,%ebx,4),%edx
c0100d0f:	89 14 c5 84 d1 12 c0 	mov    %edx,-0x3fed2e7c(,%eax,8)
c0100d16:	8d 04 c5 80 d1 12 c0 	lea    -0x3fed2e80(,%eax,8),%eax
c0100d1d:	89 04 9d 40 d1 12 c0 	mov    %eax,-0x3fed2ec0(,%ebx,4)
c0100d24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100d27:	c9                   	leave  
c0100d28:	c3                   	ret    
c0100d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100d30:	83 ec 0c             	sub    $0xc,%esp
c0100d33:	68 c7 8b 10 c0       	push   $0xc0108bc7
c0100d38:	68 dd 8c 10 c0       	push   $0xc0108cdd
c0100d3d:	6a 15                	push   $0x15
c0100d3f:	68 da 8b 10 c0       	push   $0xc0108bda
c0100d44:	68 f4 84 10 c0       	push   $0xc01084f4
c0100d49:	e8 92 09 00 00       	call   c01016e0 <printk>
c0100d4e:	b8 01 00 00 00       	mov    $0x1,%eax
c0100d53:	d6                   	(bad)  
c0100d54:	83 c4 20             	add    $0x20,%esp
c0100d57:	e9 63 ff ff ff       	jmp    c0100cbf <add_irq_handle+0xf>
c0100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0100d60 <irq_handle>:
c0100d60:	55                   	push   %ebp
c0100d61:	89 e5                	mov    %esp,%ebp
c0100d63:	53                   	push   %ebx
c0100d64:	83 ec 04             	sub    $0x4,%esp
c0100d67:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d6a:	8b 42 20             	mov    0x20(%edx),%eax
c0100d6d:	85 c0                	test   %eax,%eax
c0100d6f:	0f 88 9b 00 00 00    	js     c0100e10 <irq_handle+0xb0>
c0100d75:	3d 80 00 00 00       	cmp    $0x80,%eax
c0100d7a:	0f 84 b8 00 00 00    	je     c0100e38 <irq_handle+0xd8>
c0100d80:	3d e7 03 00 00       	cmp    $0x3e7,%eax
c0100d85:	7e 59                	jle    c0100de0 <irq_handle+0x80>
c0100d87:	8d 98 18 fc ff ff    	lea    -0x3e8(%eax),%ebx
c0100d8d:	83 fb 0f             	cmp    $0xf,%ebx
c0100d90:	7f 1e                	jg     c0100db0 <irq_handle+0x50>
c0100d92:	8b 1c 9d 40 d1 12 c0 	mov    -0x3fed2ec0(,%ebx,4),%ebx
c0100d99:	85 db                	test   %ebx,%ebx
c0100d9b:	74 0c                	je     c0100da9 <irq_handle+0x49>
c0100d9d:	8d 76 00             	lea    0x0(%esi),%esi
c0100da0:	ff 13                	call   *(%ebx)
c0100da2:	8b 5b 04             	mov    0x4(%ebx),%ebx
c0100da5:	85 db                	test   %ebx,%ebx
c0100da7:	75 f7                	jne    c0100da0 <irq_handle+0x40>
c0100da9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100dac:	c9                   	leave  
c0100dad:	c3                   	ret    
c0100dae:	66 90                	xchg   %ax,%ax
c0100db0:	83 ec 0c             	sub    $0xc,%esp
c0100db3:	68 14 8c 10 c0       	push   $0xc0108c14
c0100db8:	68 d2 8c 10 c0       	push   $0xc0108cd2
c0100dbd:	6a 32                	push   $0x32
c0100dbf:	68 da 8b 10 c0       	push   $0xc0108bda
c0100dc4:	68 f4 84 10 c0       	push   $0xc01084f4
c0100dc9:	e8 12 09 00 00       	call   c01016e0 <printk>
c0100dce:	b8 01 00 00 00       	mov    $0x1,%eax
c0100dd3:	d6                   	(bad)  
c0100dd4:	83 c4 20             	add    $0x20,%esp
c0100dd7:	eb b9                	jmp    c0100d92 <irq_handle+0x32>
c0100dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0100de0:	83 ec 08             	sub    $0x8,%esp
c0100de3:	ff 72 28             	pushl  0x28(%edx)
c0100de6:	50                   	push   %eax
c0100de7:	68 d2 8c 10 c0       	push   $0xc0108cd2
c0100dec:	6a 2f                	push   $0x2f
c0100dee:	68 da 8b 10 c0       	push   $0xc0108bda
c0100df3:	68 78 8c 10 c0       	push   $0xc0108c78
c0100df8:	e8 e3 08 00 00       	call   c01016e0 <printk>
c0100dfd:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e02:	d6                   	(bad)  
c0100e03:	83 c4 20             	add    $0x20,%esp
c0100e06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100e09:	c9                   	leave  
c0100e0a:	c3                   	ret    
c0100e0b:	90                   	nop
c0100e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100e10:	68 d2 8c 10 c0       	push   $0xc0108cd2
c0100e15:	6a 29                	push   $0x29
c0100e17:	68 da 8b 10 c0       	push   $0xc0108bda
c0100e1c:	68 2c 8c 10 c0       	push   $0xc0108c2c
c0100e21:	e8 ba 08 00 00       	call   c01016e0 <printk>
c0100e26:	b8 01 00 00 00       	mov    $0x1,%eax
c0100e2b:	d6                   	(bad)  
c0100e2c:	83 c4 10             	add    $0x10,%esp
c0100e2f:	e9 75 ff ff ff       	jmp    c0100da9 <irq_handle+0x49>
c0100e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0100e38:	89 55 08             	mov    %edx,0x8(%ebp)
c0100e3b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100e3e:	c9                   	leave  
c0100e3f:	e9 3c fd ff ff       	jmp    c0100b80 <do_syscall>
c0100e44:	66 90                	xchg   %ax,%ax
c0100e46:	66 90                	xchg   %ax,%ax
c0100e48:	66 90                	xchg   %ax,%ax
c0100e4a:	66 90                	xchg   %ax,%ax
c0100e4c:	66 90                	xchg   %ax,%ax
c0100e4e:	66 90                	xchg   %ax,%ax

c0100e50 <init_i8259>:
c0100e50:	55                   	push   %ebp
c0100e51:	ba 21 00 00 00       	mov    $0x21,%edx
c0100e56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0100e5b:	89 e5                	mov    %esp,%ebp
c0100e5d:	ee                   	out    %al,(%dx)
c0100e5e:	b2 a1                	mov    $0xa1,%dl
c0100e60:	ee                   	out    %al,(%dx)
c0100e61:	b8 11 00 00 00       	mov    $0x11,%eax
c0100e66:	b2 20                	mov    $0x20,%dl
c0100e68:	ee                   	out    %al,(%dx)
c0100e69:	b8 20 00 00 00       	mov    $0x20,%eax
c0100e6e:	b2 21                	mov    $0x21,%dl
c0100e70:	ee                   	out    %al,(%dx)
c0100e71:	b8 04 00 00 00       	mov    $0x4,%eax
c0100e76:	ee                   	out    %al,(%dx)
c0100e77:	b8 03 00 00 00       	mov    $0x3,%eax
c0100e7c:	ee                   	out    %al,(%dx)
c0100e7d:	b8 11 00 00 00       	mov    $0x11,%eax
c0100e82:	b2 a0                	mov    $0xa0,%dl
c0100e84:	ee                   	out    %al,(%dx)
c0100e85:	b8 28 00 00 00       	mov    $0x28,%eax
c0100e8a:	b2 a1                	mov    $0xa1,%dl
c0100e8c:	ee                   	out    %al,(%dx)
c0100e8d:	b8 02 00 00 00       	mov    $0x2,%eax
c0100e92:	ee                   	out    %al,(%dx)
c0100e93:	b8 03 00 00 00       	mov    $0x3,%eax
c0100e98:	ee                   	out    %al,(%dx)
c0100e99:	b8 68 00 00 00       	mov    $0x68,%eax
c0100e9e:	b2 20                	mov    $0x20,%dl
c0100ea0:	ee                   	out    %al,(%dx)
c0100ea1:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100ea6:	ee                   	out    %al,(%dx)
c0100ea7:	b8 68 00 00 00       	mov    $0x68,%eax
c0100eac:	b2 a0                	mov    $0xa0,%dl
c0100eae:	ee                   	out    %al,(%dx)
c0100eaf:	b8 0a 00 00 00       	mov    $0xa,%eax
c0100eb4:	ee                   	out    %al,(%dx)
c0100eb5:	5d                   	pop    %ebp
c0100eb6:	c3                   	ret    
c0100eb7:	66 90                	xchg   %ax,%ax
c0100eb9:	66 90                	xchg   %ax,%ax
c0100ebb:	66 90                	xchg   %ax,%ax
c0100ebd:	66 90                	xchg   %ax,%ax
c0100ebf:	90                   	nop

c0100ec0 <init_idt>:
c0100ec0:	55                   	push   %ebp
c0100ec1:	ba 8f 03 10 c0       	mov    $0xc010038f,%edx
c0100ec6:	b8 c0 d2 12 c0       	mov    $0xc012d2c0,%eax
c0100ecb:	89 d1                	mov    %edx,%ecx
c0100ecd:	c1 ea 10             	shr    $0x10,%edx
c0100ed0:	89 e5                	mov    %esp,%ebp
c0100ed2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0100ed8:	66 89 08             	mov    %cx,(%eax)
c0100edb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0100ee1:	83 c0 08             	add    $0x8,%eax
c0100ee4:	c6 40 fc 00          	movb   $0x0,-0x4(%eax)
c0100ee8:	c6 40 fd 8f          	movb   $0x8f,-0x3(%eax)
c0100eec:	66 89 50 fe          	mov    %dx,-0x2(%eax)
c0100ef0:	3d c0 da 12 c0       	cmp    $0xc012dac0,%eax
c0100ef5:	75 e1                	jne    c0100ed8 <init_idt+0x18>
c0100ef7:	b8 e4 02 10 c0       	mov    $0xc01002e4,%eax
c0100efc:	ba 08 00 00 00       	mov    $0x8,%edx
c0100f01:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100f06:	66 a3 c0 d2 12 c0    	mov    %ax,0xc012d2c0
c0100f0c:	c1 e8 10             	shr    $0x10,%eax
c0100f0f:	66 89 15 c2 d2 12 c0 	mov    %dx,0xc012d2c2
c0100f16:	66 a3 c6 d2 12 c0    	mov    %ax,0xc012d2c6
c0100f1c:	b8 ed 02 10 c0       	mov    $0xc01002ed,%eax
c0100f21:	ba 08 00 00 00       	mov    $0x8,%edx
c0100f26:	66 a3 c8 d2 12 c0    	mov    %ax,0xc012d2c8
c0100f2c:	c1 e8 10             	shr    $0x10,%eax
c0100f2f:	66 89 0d ca d2 12 c0 	mov    %cx,0xc012d2ca
c0100f36:	66 a3 ce d2 12 c0    	mov    %ax,0xc012d2ce
c0100f3c:	b8 f6 02 10 c0       	mov    $0xc01002f6,%eax
c0100f41:	66 89 15 d2 d2 12 c0 	mov    %dx,0xc012d2d2
c0100f48:	66 a3 d0 d2 12 c0    	mov    %ax,0xc012d2d0
c0100f4e:	c1 e8 10             	shr    $0x10,%eax
c0100f51:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100f56:	66 a3 d6 d2 12 c0    	mov    %ax,0xc012d2d6
c0100f5c:	b8 ff 02 10 c0       	mov    $0xc01002ff,%eax
c0100f61:	ba 08 00 00 00       	mov    $0x8,%edx
c0100f66:	66 a3 d8 d2 12 c0    	mov    %ax,0xc012d2d8
c0100f6c:	c1 e8 10             	shr    $0x10,%eax
c0100f6f:	66 89 0d da d2 12 c0 	mov    %cx,0xc012d2da
c0100f76:	66 a3 de d2 12 c0    	mov    %ax,0xc012d2de
c0100f7c:	b8 08 03 10 c0       	mov    $0xc0100308,%eax
c0100f81:	66 89 15 e2 d2 12 c0 	mov    %dx,0xc012d2e2
c0100f88:	66 a3 e0 d2 12 c0    	mov    %ax,0xc012d2e0
c0100f8e:	c1 e8 10             	shr    $0x10,%eax
c0100f91:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100f96:	66 a3 e6 d2 12 c0    	mov    %ax,0xc012d2e6
c0100f9c:	b8 11 03 10 c0       	mov    $0xc0100311,%eax
c0100fa1:	ba 08 00 00 00       	mov    $0x8,%edx
c0100fa6:	66 a3 e8 d2 12 c0    	mov    %ax,0xc012d2e8
c0100fac:	c1 e8 10             	shr    $0x10,%eax
c0100faf:	66 89 0d ea d2 12 c0 	mov    %cx,0xc012d2ea
c0100fb6:	66 a3 ee d2 12 c0    	mov    %ax,0xc012d2ee
c0100fbc:	b8 1a 03 10 c0       	mov    $0xc010031a,%eax
c0100fc1:	66 89 15 f2 d2 12 c0 	mov    %dx,0xc012d2f2
c0100fc8:	66 a3 f0 d2 12 c0    	mov    %ax,0xc012d2f0
c0100fce:	c1 e8 10             	shr    $0x10,%eax
c0100fd1:	c6 05 c4 d2 12 c0 00 	movb   $0x0,0xc012d2c4
c0100fd8:	c6 05 c5 d2 12 c0 8f 	movb   $0x8f,0xc012d2c5
c0100fdf:	c6 05 cc d2 12 c0 00 	movb   $0x0,0xc012d2cc
c0100fe6:	b9 08 00 00 00       	mov    $0x8,%ecx
c0100feb:	c6 05 cd d2 12 c0 8f 	movb   $0x8f,0xc012d2cd
c0100ff2:	c6 05 d4 d2 12 c0 00 	movb   $0x0,0xc012d2d4
c0100ff9:	ba 08 00 00 00       	mov    $0x8,%edx
c0100ffe:	c6 05 d5 d2 12 c0 8f 	movb   $0x8f,0xc012d2d5
c0101005:	c6 05 dc d2 12 c0 00 	movb   $0x0,0xc012d2dc
c010100c:	c6 05 dd d2 12 c0 8f 	movb   $0x8f,0xc012d2dd
c0101013:	c6 05 e4 d2 12 c0 00 	movb   $0x0,0xc012d2e4
c010101a:	c6 05 e5 d2 12 c0 8f 	movb   $0x8f,0xc012d2e5
c0101021:	c6 05 ec d2 12 c0 00 	movb   $0x0,0xc012d2ec
c0101028:	c6 05 ed d2 12 c0 8f 	movb   $0x8f,0xc012d2ed
c010102f:	c6 05 f4 d2 12 c0 00 	movb   $0x0,0xc012d2f4
c0101036:	c6 05 f5 d2 12 c0 8f 	movb   $0x8f,0xc012d2f5
c010103d:	66 a3 f6 d2 12 c0    	mov    %ax,0xc012d2f6
c0101043:	b8 23 03 10 c0       	mov    $0xc0100323,%eax
c0101048:	66 a3 f8 d2 12 c0    	mov    %ax,0xc012d2f8
c010104e:	c1 e8 10             	shr    $0x10,%eax
c0101051:	66 89 0d fa d2 12 c0 	mov    %cx,0xc012d2fa
c0101058:	66 a3 fe d2 12 c0    	mov    %ax,0xc012d2fe
c010105e:	b8 2c 03 10 c0       	mov    $0xc010032c,%eax
c0101063:	b9 08 00 00 00       	mov    $0x8,%ecx
c0101068:	66 a3 00 d3 12 c0    	mov    %ax,0xc012d300
c010106e:	c1 e8 10             	shr    $0x10,%eax
c0101071:	66 89 15 02 d3 12 c0 	mov    %dx,0xc012d302
c0101078:	66 a3 06 d3 12 c0    	mov    %ax,0xc012d306
c010107e:	b8 33 03 10 c0       	mov    $0xc0100333,%eax
c0101083:	66 89 0d 0a d3 12 c0 	mov    %cx,0xc012d30a
c010108a:	66 a3 08 d3 12 c0    	mov    %ax,0xc012d308
c0101090:	c1 e8 10             	shr    $0x10,%eax
c0101093:	ba 08 00 00 00       	mov    $0x8,%edx
c0101098:	66 a3 0e d3 12 c0    	mov    %ax,0xc012d30e
c010109e:	b8 3c 03 10 c0       	mov    $0xc010033c,%eax
c01010a3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01010a8:	66 a3 10 d3 12 c0    	mov    %ax,0xc012d310
c01010ae:	c1 e8 10             	shr    $0x10,%eax
c01010b1:	66 89 15 12 d3 12 c0 	mov    %dx,0xc012d312
c01010b8:	66 a3 16 d3 12 c0    	mov    %ax,0xc012d316
c01010be:	b8 43 03 10 c0       	mov    $0xc0100343,%eax
c01010c3:	66 89 0d 1a d3 12 c0 	mov    %cx,0xc012d31a
c01010ca:	66 a3 18 d3 12 c0    	mov    %ax,0xc012d318
c01010d0:	c1 e8 10             	shr    $0x10,%eax
c01010d3:	ba 08 00 00 00       	mov    $0x8,%edx
c01010d8:	66 a3 1e d3 12 c0    	mov    %ax,0xc012d31e
c01010de:	b8 4a 03 10 c0       	mov    $0xc010034a,%eax
c01010e3:	b9 08 00 00 00       	mov    $0x8,%ecx
c01010e8:	66 a3 20 d3 12 c0    	mov    %ax,0xc012d320
c01010ee:	c1 e8 10             	shr    $0x10,%eax
c01010f1:	66 89 15 22 d3 12 c0 	mov    %dx,0xc012d322
c01010f8:	66 a3 26 d3 12 c0    	mov    %ax,0xc012d326
c01010fe:	b8 51 03 10 c0       	mov    $0xc0100351,%eax
c0101103:	66 89 0d 2a d3 12 c0 	mov    %cx,0xc012d32a
c010110a:	66 a3 28 d3 12 c0    	mov    %ax,0xc012d328
c0101110:	c1 e8 10             	shr    $0x10,%eax
c0101113:	c6 05 fc d2 12 c0 00 	movb   $0x0,0xc012d2fc
c010111a:	c6 05 fd d2 12 c0 8f 	movb   $0x8f,0xc012d2fd
c0101121:	c6 05 04 d3 12 c0 00 	movb   $0x0,0xc012d304
c0101128:	b9 08 00 00 00       	mov    $0x8,%ecx
c010112d:	c6 05 05 d3 12 c0 8f 	movb   $0x8f,0xc012d305
c0101134:	c6 05 0c d3 12 c0 00 	movb   $0x0,0xc012d30c
c010113b:	ba 08 00 00 00       	mov    $0x8,%edx
c0101140:	c6 05 0d d3 12 c0 8f 	movb   $0x8f,0xc012d30d
c0101147:	c6 05 14 d3 12 c0 00 	movb   $0x0,0xc012d314
c010114e:	c6 05 15 d3 12 c0 8f 	movb   $0x8f,0xc012d315
c0101155:	c6 05 1c d3 12 c0 00 	movb   $0x0,0xc012d31c
c010115c:	c6 05 1d d3 12 c0 8f 	movb   $0x8f,0xc012d31d
c0101163:	c6 05 24 d3 12 c0 00 	movb   $0x0,0xc012d324
c010116a:	c6 05 25 d3 12 c0 8f 	movb   $0x8f,0xc012d325
c0101171:	c6 05 2c d3 12 c0 00 	movb   $0x0,0xc012d32c
c0101178:	66 a3 2e d3 12 c0    	mov    %ax,0xc012d32e
c010117e:	b8 58 03 10 c0       	mov    $0xc0100358,%eax
c0101183:	66 89 0d c2 d6 12 c0 	mov    %cx,0xc012d6c2
c010118a:	66 a3 30 d3 12 c0    	mov    %ax,0xc012d330
c0101190:	c1 e8 10             	shr    $0x10,%eax
c0101193:	b9 08 00 00 00       	mov    $0x8,%ecx
c0101198:	66 a3 36 d3 12 c0    	mov    %ax,0xc012d336
c010119e:	b8 5f 03 10 c0       	mov    $0xc010035f,%eax
c01011a3:	66 89 15 32 d3 12 c0 	mov    %dx,0xc012d332
c01011aa:	66 a3 c0 d6 12 c0    	mov    %ax,0xc012d6c0
c01011b0:	c1 e8 10             	shr    $0x10,%eax
c01011b3:	ba 08 00 00 00       	mov    $0x8,%edx
c01011b8:	66 a3 c6 d6 12 c0    	mov    %ax,0xc012d6c6
c01011be:	b8 6b 03 10 c0       	mov    $0xc010036b,%eax
c01011c3:	66 89 0d ca d3 12 c0 	mov    %cx,0xc012d3ca
c01011ca:	66 a3 c0 d3 12 c0    	mov    %ax,0xc012d3c0
c01011d0:	c1 e8 10             	shr    $0x10,%eax
c01011d3:	b9 ff 07 00 00       	mov    $0x7ff,%ecx
c01011d8:	66 a3 c6 d3 12 c0    	mov    %ax,0xc012d3c6
c01011de:	b8 77 03 10 c0       	mov    $0xc0100377,%eax
c01011e3:	66 89 0d 80 d2 12 c0 	mov    %cx,0xc012d280
c01011ea:	66 a3 c8 d3 12 c0    	mov    %ax,0xc012d3c8
c01011f0:	c1 e8 10             	shr    $0x10,%eax
c01011f3:	66 89 15 c2 d3 12 c0 	mov    %dx,0xc012d3c2
c01011fa:	66 a3 ce d3 12 c0    	mov    %ax,0xc012d3ce
c0101200:	b8 83 03 10 c0       	mov    $0xc0100383,%eax
c0101205:	ba 08 00 00 00       	mov    $0x8,%edx
c010120a:	66 a3 30 d4 12 c0    	mov    %ax,0xc012d430
c0101210:	c1 e8 10             	shr    $0x10,%eax
c0101213:	c6 05 2d d3 12 c0 8f 	movb   $0x8f,0xc012d32d
c010121a:	66 a3 36 d4 12 c0    	mov    %ax,0xc012d436
c0101220:	b8 c0 d2 12 c0       	mov    $0xc012d2c0,%eax
c0101225:	c6 05 34 d3 12 c0 00 	movb   $0x0,0xc012d334
c010122c:	66 a3 82 d2 12 c0    	mov    %ax,0xc012d282
c0101232:	c1 e8 10             	shr    $0x10,%eax
c0101235:	c6 05 35 d3 12 c0 8f 	movb   $0x8f,0xc012d335
c010123c:	66 a3 84 d2 12 c0    	mov    %ax,0xc012d284
c0101242:	c6 05 c4 d6 12 c0 00 	movb   $0x0,0xc012d6c4
c0101249:	b8 80 d2 12 c0       	mov    $0xc012d280,%eax
c010124e:	c6 05 c5 d6 12 c0 ef 	movb   $0xef,0xc012d6c5
c0101255:	c6 05 c4 d3 12 c0 00 	movb   $0x0,0xc012d3c4
c010125c:	c6 05 c5 d3 12 c0 8e 	movb   $0x8e,0xc012d3c5
c0101263:	c6 05 cc d3 12 c0 00 	movb   $0x0,0xc012d3cc
c010126a:	c6 05 cd d3 12 c0 8e 	movb   $0x8e,0xc012d3cd
c0101271:	66 89 15 32 d4 12 c0 	mov    %dx,0xc012d432
c0101278:	c6 05 34 d4 12 c0 00 	movb   $0x0,0xc012d434
c010127f:	c6 05 35 d4 12 c0 8e 	movb   $0x8e,0xc012d435
c0101286:	0f 01 18             	lidtl  (%eax)
c0101289:	5d                   	pop    %ebp
c010128a:	c3                   	ret    
c010128b:	66 90                	xchg   %ax,%ax
c010128d:	66 90                	xchg   %ax,%ax
c010128f:	90                   	nop

c0101290 <create_video_mapping>:
c0101290:	55                   	push   %ebp
c0101291:	89 e5                	mov    %esp,%ebp
c0101293:	53                   	push   %ebx
c0101294:	83 ec 04             	sub    $0x4,%esp
c0101297:	e8 14 01 00 00       	call   c01013b0 <get_updir>
c010129c:	89 c3                	mov    %eax,%ebx
c010129e:	e8 0d 01 00 00       	call   c01013b0 <get_updir>
c01012a3:	39 c3                	cmp    %eax,%ebx
c01012a5:	74 27                	je     c01012ce <create_video_mapping+0x3e>
c01012a7:	83 ec 0c             	sub    $0xc,%esp
c01012aa:	68 ec 8c 10 c0       	push   $0xc0108cec
c01012af:	68 4f 8d 10 c0       	push   $0xc0108d4f
c01012b4:	6a 19                	push   $0x19
c01012b6:	68 12 8d 10 c0       	push   $0xc0108d12
c01012bb:	68 f4 84 10 c0       	push   $0xc01084f4
c01012c0:	e8 1b 04 00 00       	call   c01016e0 <printk>
c01012c5:	b8 01 00 00 00       	mov    $0x1,%eax
c01012ca:	d6                   	(bad)  
c01012cb:	83 c4 20             	add    $0x20,%esp
c01012ce:	ba 00 e0 12 00       	mov    $0x12e000,%edx
c01012d3:	b9 00 00 0a 00       	mov    $0xa0000,%ecx
c01012d8:	b8 80 e2 12 c0       	mov    $0xc012e280,%eax
c01012dd:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c01012e3:	83 ca 07             	or     $0x7,%edx
c01012e6:	89 13                	mov    %edx,(%ebx)
c01012e8:	90                   	nop
c01012e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01012f0:	89 ca                	mov    %ecx,%edx
c01012f2:	83 c0 04             	add    $0x4,%eax
c01012f5:	81 c1 00 10 00 00    	add    $0x1000,%ecx
c01012fb:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
c0101301:	83 ca 07             	or     $0x7,%edx
c0101304:	89 50 fc             	mov    %edx,-0x4(%eax)
c0101307:	3d c0 e2 12 c0       	cmp    $0xc012e2c0,%eax
c010130c:	75 e2                	jne    c01012f0 <create_video_mapping+0x60>
c010130e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101311:	c9                   	leave  
c0101312:	c3                   	ret    
c0101313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101320 <video_mapping_write_test>:
c0101320:	55                   	push   %ebp
c0101321:	31 c0                	xor    %eax,%eax
c0101323:	89 e5                	mov    %esp,%ebp
c0101325:	8d 76 00             	lea    0x0(%esi),%esi
c0101328:	89 04 85 00 00 0a 00 	mov    %eax,0xa0000(,%eax,4)
c010132f:	83 c0 01             	add    $0x1,%eax
c0101332:	3d 80 3e 00 00       	cmp    $0x3e80,%eax
c0101337:	75 ef                	jne    c0101328 <video_mapping_write_test+0x8>
c0101339:	5d                   	pop    %ebp
c010133a:	c3                   	ret    
c010133b:	90                   	nop
c010133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c0101340 <video_mapping_read_test>:
c0101340:	55                   	push   %ebp
c0101341:	89 e5                	mov    %esp,%ebp
c0101343:	56                   	push   %esi
c0101344:	be 01 00 00 00       	mov    $0x1,%esi
c0101349:	53                   	push   %ebx
c010134a:	31 db                	xor    %ebx,%ebx
c010134c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101350:	3b 1c 9d 00 00 0a 00 	cmp    0xa0000(,%ebx,4),%ebx
c0101357:	74 24                	je     c010137d <video_mapping_read_test+0x3d>
c0101359:	83 ec 0c             	sub    $0xc,%esp
c010135c:	68 2b 8d 10 c0       	push   $0xc0108d2b
c0101361:	68 37 8d 10 c0       	push   $0xc0108d37
c0101366:	6a 30                	push   $0x30
c0101368:	68 12 8d 10 c0       	push   $0xc0108d12
c010136d:	68 f4 84 10 c0       	push   $0xc01084f4
c0101372:	e8 69 03 00 00       	call   c01016e0 <printk>
c0101377:	89 f0                	mov    %esi,%eax
c0101379:	d6                   	(bad)  
c010137a:	83 c4 20             	add    $0x20,%esp
c010137d:	83 c3 01             	add    $0x1,%ebx
c0101380:	81 fb 80 3e 00 00    	cmp    $0x3e80,%ebx
c0101386:	75 c8                	jne    c0101350 <video_mapping_read_test+0x10>
c0101388:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010138b:	5b                   	pop    %ebx
c010138c:	5e                   	pop    %esi
c010138d:	5d                   	pop    %ebp
c010138e:	c3                   	ret    
c010138f:	90                   	nop

c0101390 <video_mapping_clear>:
c0101390:	55                   	push   %ebp
c0101391:	89 e5                	mov    %esp,%ebp
c0101393:	83 ec 0c             	sub    $0xc,%esp
c0101396:	68 00 fa 00 00       	push   $0xfa00
c010139b:	6a 00                	push   $0x0
c010139d:	68 00 00 0a 00       	push   $0xa0000
c01013a2:	e8 81 08 00 00       	call   c0101c28 <memset>
c01013a7:	83 c4 10             	add    $0x10,%esp
c01013aa:	c9                   	leave  
c01013ab:	c3                   	ret    
c01013ac:	66 90                	xchg   %ax,%ax
c01013ae:	66 90                	xchg   %ax,%ax

c01013b0 <get_updir>:
c01013b0:	55                   	push   %ebp
c01013b1:	b8 00 00 13 c0       	mov    $0xc0130000,%eax
c01013b6:	89 e5                	mov    %esp,%ebp
c01013b8:	5d                   	pop    %ebp
c01013b9:	c3                   	ret    
c01013ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01013c0 <get_ucr3>:
c01013c0:	55                   	push   %ebp
c01013c1:	a1 04 f0 12 c0       	mov    0xc012f004,%eax
c01013c6:	89 e5                	mov    %esp,%ebp
c01013c8:	5d                   	pop    %ebp
c01013c9:	c3                   	ret    
c01013ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01013d0 <mm_brk>:
c01013d0:	55                   	push   %ebp
c01013d1:	89 e5                	mov    %esp,%ebp
c01013d3:	53                   	push   %ebx
c01013d4:	83 ec 04             	sub    $0x4,%esp
c01013d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01013da:	a1 00 f0 12 c0       	mov    0xc012f000,%eax
c01013df:	39 d8                	cmp    %ebx,%eax
c01013e1:	73 11                	jae    c01013f4 <mm_brk+0x24>
c01013e3:	89 da                	mov    %ebx,%edx
c01013e5:	83 ec 08             	sub    $0x8,%esp
c01013e8:	29 c2                	sub    %eax,%edx
c01013ea:	52                   	push   %edx
c01013eb:	50                   	push   %eax
c01013ec:	e8 5f ec ff ff       	call   c0100050 <mm_malloc>
c01013f1:	83 c4 10             	add    $0x10,%esp
c01013f4:	89 1d 00 f0 12 c0    	mov    %ebx,0xc012f000
c01013fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01013fd:	c9                   	leave  
c01013fe:	c3                   	ret    
c01013ff:	90                   	nop

c0101400 <init_mm>:
c0101400:	55                   	push   %ebp
c0101401:	89 e5                	mov    %esp,%ebp
c0101403:	53                   	push   %ebx
c0101404:	83 ec 04             	sub    $0x4,%esp
c0101407:	e8 54 00 00 00       	call   c0101460 <get_kpdir>
c010140c:	83 ec 04             	sub    $0x4,%esp
c010140f:	89 c3                	mov    %eax,%ebx
c0101411:	68 00 10 00 00       	push   $0x1000
c0101416:	6a 00                	push   $0x0
c0101418:	81 c3 00 0c 00 00    	add    $0xc00,%ebx
c010141e:	68 00 00 13 c0       	push   $0xc0130000
c0101423:	e8 00 08 00 00       	call   c0101c28 <memset>
c0101428:	83 c4 0c             	add    $0xc,%esp
c010142b:	68 80 00 00 00       	push   $0x80
c0101430:	53                   	push   %ebx
c0101431:	68 00 0c 13 c0       	push   $0xc0130c00
c0101436:	e8 a5 07 00 00       	call   c0101be0 <memcpy>
c010143b:	b8 00 00 13 00       	mov    $0x130000,%eax
c0101440:	83 c4 10             	add    $0x10,%esp
c0101443:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101446:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010144b:	a3 04 f0 12 c0       	mov    %eax,0xc012f004
c0101450:	c9                   	leave  
c0101451:	c3                   	ret    
c0101452:	66 90                	xchg   %ax,%ax
c0101454:	66 90                	xchg   %ax,%ax
c0101456:	66 90                	xchg   %ax,%ax
c0101458:	66 90                	xchg   %ax,%ax
c010145a:	66 90                	xchg   %ax,%ax
c010145c:	66 90                	xchg   %ax,%ax
c010145e:	66 90                	xchg   %ax,%ax

c0101460 <get_kpdir>:
c0101460:	55                   	push   %ebp
c0101461:	b8 00 20 15 c0       	mov    $0xc0152000,%eax
c0101466:	89 e5                	mov    %esp,%ebp
c0101468:	5d                   	pop    %ebp
c0101469:	c3                   	ret    
c010146a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101470 <init_page>:
c0101470:	55                   	push   %ebp
c0101471:	89 e5                	mov    %esp,%ebp
c0101473:	57                   	push   %edi
c0101474:	83 ec 08             	sub    $0x8,%esp
c0101477:	68 00 10 00 00       	push   $0x1000
c010147c:	6a 00                	push   $0x0
c010147e:	68 00 20 15 00       	push   $0x152000
c0101483:	e8 a0 07 00 00       	call   c0101c28 <memset>
c0101488:	b9 00 20 15 00       	mov    $0x152000,%ecx
c010148d:	83 c4 10             	add    $0x10,%esp
c0101490:	ba 00 20 13 00       	mov    $0x132000,%edx
c0101495:	8d 76 00             	lea    0x0(%esi),%esi
c0101498:	89 d0                	mov    %edx,%eax
c010149a:	81 c2 00 10 00 00    	add    $0x1000,%edx
c01014a0:	83 c1 04             	add    $0x4,%ecx
c01014a3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01014a8:	83 c8 07             	or     $0x7,%eax
c01014ab:	89 41 fc             	mov    %eax,-0x4(%ecx)
c01014ae:	89 81 fc 0b 00 00    	mov    %eax,0xbfc(%ecx)
c01014b4:	81 fa 00 20 15 00    	cmp    $0x152000,%edx
c01014ba:	75 dc                	jne    c0101498 <init_page+0x28>
c01014bc:	bf fc 1f 15 00       	mov    $0x151ffc,%edi
c01014c1:	b8 07 f0 ff 07       	mov    $0x7fff007,%eax
c01014c6:	fd                   	std    
c01014c7:	ab                   	stos   %eax,%es:(%edi)
c01014c8:	2d 00 10 00 00       	sub    $0x1000,%eax
c01014cd:	7d f8                	jge    c01014c7 <init_page+0x57>
c01014cf:	b8 00 20 15 00       	mov    $0x152000,%eax
c01014d4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01014d9:	0f 22 d8             	mov    %eax,%cr3
c01014dc:	0f 20 c0             	mov    %cr0,%eax
c01014df:	0d 00 00 00 80       	or     $0x80000000,%eax
c01014e4:	0f 22 c0             	mov    %eax,%cr0
c01014e7:	8b 7d fc             	mov    -0x4(%ebp),%edi
c01014ea:	c9                   	leave  
c01014eb:	c3                   	ret    
c01014ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01014f0 <init_segment>:
c01014f0:	55                   	push   %ebp
c01014f1:	89 e5                	mov    %esp,%ebp
c01014f3:	83 ec 0c             	sub    $0xc,%esp
c01014f6:	6a 18                	push   $0x18
c01014f8:	6a 00                	push   $0x0
c01014fa:	68 08 10 13 c0       	push   $0xc0131008
c01014ff:	e8 24 07 00 00       	call   c0101c28 <memset>
c0101504:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c0101509:	31 c9                	xor    %ecx,%ecx
c010150b:	b8 08 10 13 c0       	mov    $0xc0131008,%eax
c0101510:	66 89 15 10 10 13 c0 	mov    %dx,0xc0131010
c0101517:	ba ff ff ff ff       	mov    $0xffffffff,%edx
c010151c:	66 89 0d 12 10 13 c0 	mov    %cx,0xc0131012
c0101523:	66 89 15 18 10 13 c0 	mov    %dx,0xc0131018
c010152a:	ba 17 00 00 00       	mov    $0x17,%edx
c010152f:	31 c9                	xor    %ecx,%ecx
c0101531:	66 89 15 00 10 13 c0 	mov    %dx,0xc0131000
c0101538:	66 a3 02 10 13 c0    	mov    %ax,0xc0131002
c010153e:	c1 e8 10             	shr    $0x10,%eax
c0101541:	66 a3 04 10 13 c0    	mov    %ax,0xc0131004
c0101547:	c6 05 14 10 13 c0 00 	movb   $0x0,0xc0131014
c010154e:	b8 00 10 13 c0       	mov    $0xc0131000,%eax
c0101553:	c6 05 15 10 13 c0 9a 	movb   $0x9a,0xc0131015
c010155a:	c6 05 16 10 13 c0 cf 	movb   $0xcf,0xc0131016
c0101561:	c6 05 17 10 13 c0 00 	movb   $0x0,0xc0131017
c0101568:	66 89 0d 1a 10 13 c0 	mov    %cx,0xc013101a
c010156f:	c6 05 1c 10 13 c0 00 	movb   $0x0,0xc013101c
c0101576:	c6 05 1d 10 13 c0 92 	movb   $0x92,0xc013101d
c010157d:	c6 05 1e 10 13 c0 cf 	movb   $0xcf,0xc013101e
c0101584:	c6 05 1f 10 13 c0 00 	movb   $0x0,0xc013101f
c010158b:	0f 01 10             	lgdtl  (%eax)
c010158e:	83 c4 10             	add    $0x10,%esp
c0101591:	c9                   	leave  
c0101592:	c3                   	ret    
c0101593:	66 90                	xchg   %ax,%ax
c0101595:	66 90                	xchg   %ax,%ax
c0101597:	66 90                	xchg   %ax,%ax
c0101599:	66 90                	xchg   %ax,%ax
c010159b:	66 90                	xchg   %ax,%ax
c010159d:	66 90                	xchg   %ax,%ax
c010159f:	90                   	nop

c01015a0 <loader>:
c01015a0:	55                   	push   %ebp
c01015a1:	89 e5                	mov    %esp,%ebp
c01015a3:	57                   	push   %edi
c01015a4:	56                   	push   %esi
c01015a5:	53                   	push   %ebx
c01015a6:	8d 9d e8 ef ff ff    	lea    -0x1018(%ebp),%ebx
c01015ac:	81 ec 20 10 00 00    	sub    $0x1020,%esp
c01015b2:	68 00 10 00 00       	push   $0x1000
c01015b7:	6a 00                	push   $0x0
c01015b9:	53                   	push   %ebx
c01015ba:	e8 81 02 00 00       	call   c0101840 <ide_read>
c01015bf:	83 c4 10             	add    $0x10,%esp
c01015c2:	81 bd e8 ef ff ff 7f 	cmpl   $0x464c457f,-0x1018(%ebp)
c01015c9:	45 4c 46 
c01015cc:	74 06                	je     c01015d4 <loader+0x34>
c01015ce:	b8 01 00 00 00       	mov    $0x1,%eax
c01015d3:	d6                   	(bad)  
c01015d4:	8b 95 04 f0 ff ff    	mov    -0xffc(%ebp),%edx
c01015da:	83 fa 34             	cmp    $0x34,%edx
c01015dd:	74 06                	je     c01015e5 <loader+0x45>
c01015df:	b8 01 00 00 00       	mov    $0x1,%eax
c01015e4:	d6                   	(bad)  
c01015e5:	31 f6                	xor    %esi,%esi
c01015e7:	66 83 bd 14 f0 ff ff 	cmpw   $0x0,-0xfec(%ebp)
c01015ee:	00 
c01015ef:	8d 5c 13 14          	lea    0x14(%ebx,%edx,1),%ebx
c01015f3:	75 1c                	jne    c0101611 <loader+0x71>
c01015f5:	eb 71                	jmp    c0101668 <loader+0xc8>
c01015f7:	89 f6                	mov    %esi,%esi
c01015f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101600:	0f b7 85 14 f0 ff ff 	movzwl -0xfec(%ebp),%eax
c0101607:	83 c6 01             	add    $0x1,%esi
c010160a:	83 c3 20             	add    $0x20,%ebx
c010160d:	39 f0                	cmp    %esi,%eax
c010160f:	7e 57                	jle    c0101668 <loader+0xc8>
c0101611:	83 7b ec 01          	cmpl   $0x1,-0x14(%ebx)
c0101615:	75 e9                	jne    c0101600 <loader+0x60>
c0101617:	83 ec 08             	sub    $0x8,%esp
c010161a:	ff 33                	pushl  (%ebx)
c010161c:	ff 73 f4             	pushl  -0xc(%ebx)
c010161f:	e8 2c ea ff ff       	call   c0100050 <mm_malloc>
c0101624:	83 c4 0c             	add    $0xc,%esp
c0101627:	ff 73 fc             	pushl  -0x4(%ebx)
c010162a:	ff 73 f0             	pushl  -0x10(%ebx)
c010162d:	50                   	push   %eax
c010162e:	89 c7                	mov    %eax,%edi
c0101630:	e8 0b 02 00 00       	call   c0101840 <ide_read>
c0101635:	8b 53 fc             	mov    -0x4(%ebx),%edx
c0101638:	8b 0b                	mov    (%ebx),%ecx
c010163a:	83 c4 0c             	add    $0xc,%esp
c010163d:	29 d1                	sub    %edx,%ecx
c010163f:	01 fa                	add    %edi,%edx
c0101641:	51                   	push   %ecx
c0101642:	6a 00                	push   $0x0
c0101644:	52                   	push   %edx
c0101645:	e8 de 05 00 00       	call   c0101c28 <memset>
c010164a:	8b 03                	mov    (%ebx),%eax
c010164c:	03 43 f4             	add    -0xc(%ebx),%eax
c010164f:	83 c4 10             	add    $0x10,%esp
c0101652:	83 e8 01             	sub    $0x1,%eax
c0101655:	3b 05 00 f0 12 c0    	cmp    0xc012f000,%eax
c010165b:	76 a3                	jbe    c0101600 <loader+0x60>
c010165d:	a3 00 f0 12 c0       	mov    %eax,0xc012f000
c0101662:	eb 9c                	jmp    c0101600 <loader+0x60>
c0101664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101668:	83 ec 08             	sub    $0x8,%esp
c010166b:	8b 85 00 f0 ff ff    	mov    -0x1000(%ebp),%eax
c0101671:	68 00 00 10 00       	push   $0x100000
c0101676:	68 00 00 f0 bf       	push   $0xbff00000
c010167b:	89 85 e4 ef ff ff    	mov    %eax,-0x101c(%ebp)
c0101681:	e8 ca e9 ff ff       	call   c0100050 <mm_malloc>
c0101686:	e8 05 fc ff ff       	call   c0101290 <create_video_mapping>
c010168b:	e8 30 fd ff ff       	call   c01013c0 <get_ucr3>
c0101690:	0f 22 d8             	mov    %eax,%cr3
c0101693:	8b 85 e4 ef ff ff    	mov    -0x101c(%ebp),%eax
c0101699:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010169c:	5b                   	pop    %ebx
c010169d:	5e                   	pop    %esi
c010169e:	5f                   	pop    %edi
c010169f:	5d                   	pop    %ebp
c01016a0:	c3                   	ret    
c01016a1:	66 90                	xchg   %ax,%ax
c01016a3:	66 90                	xchg   %ax,%ax
c01016a5:	66 90                	xchg   %ax,%ax
c01016a7:	66 90                	xchg   %ax,%ax
c01016a9:	66 90                	xchg   %ax,%ax
c01016ab:	66 90                	xchg   %ax,%ax
c01016ad:	66 90                	xchg   %ax,%ax
c01016af:	90                   	nop

c01016b0 <sbrk>:
c01016b0:	55                   	push   %ebp
c01016b1:	89 e5                	mov    %esp,%ebp
c01016b3:	83 ec 08             	sub    $0x8,%esp
c01016b6:	68 7a 8d 10 c0       	push   $0xc0108d7a
c01016bb:	6a 08                	push   $0x8
c01016bd:	68 64 8d 10 c0       	push   $0xc0108d64
c01016c2:	68 34 8a 10 c0       	push   $0xc0108a34
c01016c7:	e8 14 00 00 00       	call   c01016e0 <printk>
c01016cc:	b8 01 00 00 00       	mov    $0x1,%eax
c01016d1:	d6                   	(bad)  
c01016d2:	30 c0                	xor    %al,%al
c01016d4:	c9                   	leave  
c01016d5:	c3                   	ret    
c01016d6:	66 90                	xchg   %ax,%ax
c01016d8:	66 90                	xchg   %ax,%ax
c01016da:	66 90                	xchg   %ax,%ax
c01016dc:	66 90                	xchg   %ax,%ax
c01016de:	66 90                	xchg   %ax,%ax

c01016e0 <printk>:
c01016e0:	55                   	push   %ebp
c01016e1:	89 e5                	mov    %esp,%ebp
c01016e3:	56                   	push   %esi
c01016e4:	53                   	push   %ebx
c01016e5:	8d 45 0c             	lea    0xc(%ebp),%eax
c01016e8:	50                   	push   %eax
c01016e9:	ff 75 08             	pushl  0x8(%ebp)
c01016ec:	68 00 01 00 00       	push   $0x100
c01016f1:	68 00 30 15 c0       	push   $0xc0153000
c01016f6:	e8 b5 06 00 00       	call   c0101db0 <vsnprintf>
c01016fb:	83 c4 10             	add    $0x10,%esp
c01016fe:	85 c0                	test   %eax,%eax
c0101700:	89 c6                	mov    %eax,%esi
c0101702:	7e 26                	jle    c010172a <printk+0x4a>
c0101704:	31 db                	xor    %ebx,%ebx
c0101706:	8d 76 00             	lea    0x0(%esi),%esi
c0101709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c0101710:	0f be 93 00 30 15 c0 	movsbl -0x3fead000(%ebx),%edx
c0101717:	83 ec 0c             	sub    $0xc,%esp
c010171a:	83 c3 01             	add    $0x1,%ebx
c010171d:	52                   	push   %edx
c010171e:	e8 5d 00 00 00       	call   c0101780 <serial_printc>
c0101723:	83 c4 10             	add    $0x10,%esp
c0101726:	39 f3                	cmp    %esi,%ebx
c0101728:	75 e6                	jne    c0101710 <printk+0x30>
c010172a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010172d:	5b                   	pop    %ebx
c010172e:	5e                   	pop    %esi
c010172f:	5d                   	pop    %ebp
c0101730:	c3                   	ret    
c0101731:	66 90                	xchg   %ax,%ax
c0101733:	66 90                	xchg   %ax,%ax
c0101735:	66 90                	xchg   %ax,%ax
c0101737:	66 90                	xchg   %ax,%ax
c0101739:	66 90                	xchg   %ax,%ax
c010173b:	66 90                	xchg   %ax,%ax
c010173d:	66 90                	xchg   %ax,%ax
c010173f:	90                   	nop

c0101740 <init_serial>:
c0101740:	55                   	push   %ebp
c0101741:	ba f9 03 00 00       	mov    $0x3f9,%edx
c0101746:	31 c0                	xor    %eax,%eax
c0101748:	89 e5                	mov    %esp,%ebp
c010174a:	ee                   	out    %al,(%dx)
c010174b:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
c0101750:	b2 fb                	mov    $0xfb,%dl
c0101752:	ee                   	out    %al,(%dx)
c0101753:	b8 01 00 00 00       	mov    $0x1,%eax
c0101758:	b2 f8                	mov    $0xf8,%dl
c010175a:	ee                   	out    %al,(%dx)
c010175b:	31 c0                	xor    %eax,%eax
c010175d:	b2 f9                	mov    $0xf9,%dl
c010175f:	ee                   	out    %al,(%dx)
c0101760:	b8 03 00 00 00       	mov    $0x3,%eax
c0101765:	b2 fb                	mov    $0xfb,%dl
c0101767:	ee                   	out    %al,(%dx)
c0101768:	b8 c7 ff ff ff       	mov    $0xffffffc7,%eax
c010176d:	b2 fa                	mov    $0xfa,%dl
c010176f:	ee                   	out    %al,(%dx)
c0101770:	b8 0b 00 00 00       	mov    $0xb,%eax
c0101775:	b2 fc                	mov    $0xfc,%dl
c0101777:	ee                   	out    %al,(%dx)
c0101778:	5d                   	pop    %ebp
c0101779:	c3                   	ret    
c010177a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101780 <serial_printc>:
c0101780:	55                   	push   %ebp
c0101781:	ba fd 03 00 00       	mov    $0x3fd,%edx
c0101786:	89 e5                	mov    %esp,%ebp
c0101788:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010178b:	90                   	nop
c010178c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101790:	ec                   	in     (%dx),%al
c0101791:	a8 20                	test   $0x20,%al
c0101793:	74 fb                	je     c0101790 <serial_printc+0x10>
c0101795:	ba f8 03 00 00       	mov    $0x3f8,%edx
c010179a:	89 c8                	mov    %ecx,%eax
c010179c:	ee                   	out    %al,(%dx)
c010179d:	5d                   	pop    %ebp
c010179e:	c3                   	ret    
c010179f:	90                   	nop

c01017a0 <ramdisk_read>:
c01017a0:	55                   	push   %ebp
c01017a1:	89 e5                	mov    %esp,%ebp
c01017a3:	53                   	push   %ebx
c01017a4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01017a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01017aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01017ad:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c01017b0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c01017b5:	76 06                	jbe    c01017bd <ramdisk_read+0x1d>
c01017b7:	b8 01 00 00 00       	mov    $0x1,%eax
c01017bc:	d6                   	(bad)  
c01017bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
c01017c0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01017c3:	89 55 0c             	mov    %edx,0xc(%ebp)
c01017c6:	5b                   	pop    %ebx
c01017c7:	5d                   	pop    %ebp
c01017c8:	e9 13 04 00 00       	jmp    c0101be0 <memcpy>
c01017cd:	8d 76 00             	lea    0x0(%esi),%esi

c01017d0 <ramdisk_write>:
c01017d0:	55                   	push   %ebp
c01017d1:	89 e5                	mov    %esp,%ebp
c01017d3:	53                   	push   %ebx
c01017d4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01017d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
c01017da:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01017dd:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
c01017e0:	3d ff ff 09 00       	cmp    $0x9ffff,%eax
c01017e5:	76 06                	jbe    c01017ed <ramdisk_write+0x1d>
c01017e7:	b8 01 00 00 00       	mov    $0x1,%eax
c01017ec:	d6                   	(bad)  
c01017ed:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c01017f0:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01017f3:	89 55 08             	mov    %edx,0x8(%ebp)
c01017f6:	5b                   	pop    %ebx
c01017f7:	5d                   	pop    %ebp
c01017f8:	e9 e3 03 00 00       	jmp    c0101be0 <memcpy>
c01017fd:	66 90                	xchg   %ax,%ax
c01017ff:	90                   	nop

c0101800 <ide_intr>:
c0101800:	55                   	push   %ebp
c0101801:	c7 05 04 31 15 c0 01 	movl   $0x1,0xc0153104
c0101808:	00 00 00 
c010180b:	89 e5                	mov    %esp,%ebp
c010180d:	5d                   	pop    %ebp
c010180e:	c3                   	ret    
c010180f:	90                   	nop

c0101810 <ide_writeback>:
c0101810:	a1 00 31 15 c0       	mov    0xc0153100,%eax
c0101815:	83 c0 01             	add    $0x1,%eax
c0101818:	83 f8 64             	cmp    $0x64,%eax
c010181b:	a3 00 31 15 c0       	mov    %eax,0xc0153100
c0101820:	74 06                	je     c0101828 <ide_writeback+0x18>
c0101822:	c3                   	ret    
c0101823:	90                   	nop
c0101824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101828:	55                   	push   %ebp
c0101829:	89 e5                	mov    %esp,%ebp
c010182b:	83 ec 08             	sub    $0x8,%esp
c010182e:	e8 dd 01 00 00       	call   c0101a10 <buf_writeback>
c0101833:	c7 05 00 31 15 c0 00 	movl   $0x0,0xc0153100
c010183a:	00 00 00 
c010183d:	c9                   	leave  
c010183e:	c3                   	ret    
c010183f:	90                   	nop

c0101840 <ide_read>:
c0101840:	55                   	push   %ebp
c0101841:	89 e5                	mov    %esp,%ebp
c0101843:	57                   	push   %edi
c0101844:	56                   	push   %esi
c0101845:	53                   	push   %ebx
c0101846:	83 ec 0c             	sub    $0xc,%esp
c0101849:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010184c:	8b 45 10             	mov    0x10(%ebp),%eax
c010184f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101852:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101855:	29 df                	sub    %ebx,%edi
c0101857:	85 c0                	test   %eax,%eax
c0101859:	74 1b                	je     c0101876 <ide_read+0x36>
c010185b:	90                   	nop
c010185c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101860:	83 ec 0c             	sub    $0xc,%esp
c0101863:	53                   	push   %ebx
c0101864:	e8 07 02 00 00       	call   c0101a70 <read_byte>
c0101869:	88 04 1f             	mov    %al,(%edi,%ebx,1)
c010186c:	83 c3 01             	add    $0x1,%ebx
c010186f:	83 c4 10             	add    $0x10,%esp
c0101872:	39 f3                	cmp    %esi,%ebx
c0101874:	75 ea                	jne    c0101860 <ide_read+0x20>
c0101876:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101879:	5b                   	pop    %ebx
c010187a:	5e                   	pop    %esi
c010187b:	5f                   	pop    %edi
c010187c:	5d                   	pop    %ebp
c010187d:	c3                   	ret    
c010187e:	66 90                	xchg   %ax,%ax

c0101880 <ide_write>:
c0101880:	55                   	push   %ebp
c0101881:	89 e5                	mov    %esp,%ebp
c0101883:	57                   	push   %edi
c0101884:	56                   	push   %esi
c0101885:	53                   	push   %ebx
c0101886:	83 ec 0c             	sub    $0xc,%esp
c0101889:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010188c:	8b 45 10             	mov    0x10(%ebp),%eax
c010188f:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101892:	8d 34 18             	lea    (%eax,%ebx,1),%esi
c0101895:	29 df                	sub    %ebx,%edi
c0101897:	85 c0                	test   %eax,%eax
c0101899:	74 1d                	je     c01018b8 <ide_write+0x38>
c010189b:	90                   	nop
c010189c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01018a0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
c01018a4:	83 ec 08             	sub    $0x8,%esp
c01018a7:	50                   	push   %eax
c01018a8:	53                   	push   %ebx
c01018a9:	83 c3 01             	add    $0x1,%ebx
c01018ac:	e8 ef 01 00 00       	call   c0101aa0 <write_byte>
c01018b1:	83 c4 10             	add    $0x10,%esp
c01018b4:	39 f3                	cmp    %esi,%ebx
c01018b6:	75 e8                	jne    c01018a0 <ide_write+0x20>
c01018b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01018bb:	5b                   	pop    %ebx
c01018bc:	5e                   	pop    %esi
c01018bd:	5f                   	pop    %edi
c01018be:	5d                   	pop    %ebp
c01018bf:	c3                   	ret    

c01018c0 <clear_ide_intr>:
c01018c0:	55                   	push   %ebp
c01018c1:	c7 05 04 31 15 c0 00 	movl   $0x0,0xc0153104
c01018c8:	00 00 00 
c01018cb:	89 e5                	mov    %esp,%ebp
c01018cd:	5d                   	pop    %ebp
c01018ce:	c3                   	ret    
c01018cf:	90                   	nop

c01018d0 <wait_ide_intr>:
c01018d0:	a1 04 31 15 c0       	mov    0xc0153104,%eax
c01018d5:	55                   	push   %ebp
c01018d6:	89 e5                	mov    %esp,%ebp
c01018d8:	85 c0                	test   %eax,%eax
c01018da:	75 0e                	jne    c01018ea <wait_ide_intr+0x1a>
c01018dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01018e0:	f4                   	hlt    
c01018e1:	a1 04 31 15 c0       	mov    0xc0153104,%eax
c01018e6:	85 c0                	test   %eax,%eax
c01018e8:	74 f6                	je     c01018e0 <wait_ide_intr+0x10>
c01018ea:	c7 05 04 31 15 c0 00 	movl   $0x0,0xc0153104
c01018f1:	00 00 00 
c01018f4:	5d                   	pop    %ebp
c01018f5:	c3                   	ret    
c01018f6:	8d 76 00             	lea    0x0(%esi),%esi
c01018f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101900 <init_ide>:
c0101900:	55                   	push   %ebp
c0101901:	89 e5                	mov    %esp,%ebp
c0101903:	83 ec 08             	sub    $0x8,%esp
c0101906:	e8 d5 00 00 00       	call   c01019e0 <buf_init>
c010190b:	83 ec 08             	sub    $0x8,%esp
c010190e:	68 10 18 10 c0       	push   $0xc0101810
c0101913:	6a 00                	push   $0x0
c0101915:	e8 96 f3 ff ff       	call   c0100cb0 <add_irq_handle>
c010191a:	58                   	pop    %eax
c010191b:	5a                   	pop    %edx
c010191c:	68 00 18 10 c0       	push   $0xc0101800
c0101921:	6a 0e                	push   $0xe
c0101923:	e8 88 f3 ff ff       	call   c0100cb0 <add_irq_handle>
c0101928:	83 c4 10             	add    $0x10,%esp
c010192b:	c9                   	leave  
c010192c:	c3                   	ret    
c010192d:	66 90                	xchg   %ax,%ax
c010192f:	90                   	nop

c0101930 <buf_fetch>:
c0101930:	55                   	push   %ebp
c0101931:	89 c2                	mov    %eax,%edx
c0101933:	89 e5                	mov    %esp,%ebp
c0101935:	57                   	push   %edi
c0101936:	56                   	push   %esi
c0101937:	53                   	push   %ebx
c0101938:	89 c3                	mov    %eax,%ebx
c010193a:	83 e3 7f             	and    $0x7f,%ebx
c010193d:	89 d8                	mov    %ebx,%eax
c010193f:	83 ec 1c             	sub    $0x1c,%esp
c0101942:	c1 e0 09             	shl    $0x9,%eax
c0101945:	8d 0c d8             	lea    (%eax,%ebx,8),%ecx
c0101948:	8d 81 40 31 15 c0    	lea    -0x3feacec0(%ecx),%eax
c010194e:	80 78 04 01          	cmpb   $0x1,0x4(%eax)
c0101952:	74 5c                	je     c01019b0 <buf_fetch+0x80>
c0101954:	89 d7                	mov    %edx,%edi
c0101956:	89 da                	mov    %ebx,%edx
c0101958:	c1 e2 09             	shl    $0x9,%edx
c010195b:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010195e:	8d 91 40 31 15 c0    	lea    -0x3feacec0(%ecx),%edx
c0101964:	66 81 7a 04 01 01    	cmpw   $0x101,0x4(%edx)
c010196a:	74 54                	je     c01019c0 <buf_fetch+0x90>
c010196c:	8d 72 06             	lea    0x6(%edx),%esi
c010196f:	83 ec 08             	sub    $0x8,%esp
c0101972:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101975:	57                   	push   %edi
c0101976:	56                   	push   %esi
c0101977:	e8 a4 01 00 00       	call   c0101b20 <disk_do_read>
c010197c:	89 da                	mov    %ebx,%edx
c010197e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101981:	83 c4 10             	add    $0x10,%esp
c0101984:	c1 e2 09             	shl    $0x9,%edx
c0101987:	8d 0c da             	lea    (%edx,%ebx,8),%ecx
c010198a:	c6 81 44 31 15 c0 01 	movb   $0x1,-0x3feacebc(%ecx)
c0101991:	89 b9 40 31 15 c0    	mov    %edi,-0x3feacec0(%ecx)
c0101997:	c6 81 45 31 15 c0 00 	movb   $0x0,-0x3feacebb(%ecx)
c010199e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01019a1:	5b                   	pop    %ebx
c01019a2:	5e                   	pop    %esi
c01019a3:	5f                   	pop    %edi
c01019a4:	5d                   	pop    %ebp
c01019a5:	c3                   	ret    
c01019a6:	8d 76 00             	lea    0x0(%esi),%esi
c01019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
c01019b0:	39 91 40 31 15 c0    	cmp    %edx,-0x3feacec0(%ecx)
c01019b6:	75 9c                	jne    c0101954 <buf_fetch+0x24>
c01019b8:	eb e4                	jmp    c010199e <buf_fetch+0x6e>
c01019ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01019c0:	8d 72 06             	lea    0x6(%edx),%esi
c01019c3:	83 ec 08             	sub    $0x8,%esp
c01019c6:	ff b1 40 31 15 c0    	pushl  -0x3feacec0(%ecx)
c01019cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01019cf:	56                   	push   %esi
c01019d0:	e8 8b 01 00 00       	call   c0101b60 <disk_do_write>
c01019d5:	83 c4 10             	add    $0x10,%esp
c01019d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01019db:	eb 92                	jmp    c010196f <buf_fetch+0x3f>
c01019dd:	8d 76 00             	lea    0x0(%esi),%esi

c01019e0 <buf_init>:
c01019e0:	55                   	push   %ebp
c01019e1:	b8 44 31 15 c0       	mov    $0xc0153144,%eax
c01019e6:	89 e5                	mov    %esp,%ebp
c01019e8:	90                   	nop
c01019e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01019f0:	c6 00 00             	movb   $0x0,(%eax)
c01019f3:	05 08 02 00 00       	add    $0x208,%eax
c01019f8:	3d 44 35 16 c0       	cmp    $0xc0163544,%eax
c01019fd:	75 f1                	jne    c01019f0 <buf_init+0x10>
c01019ff:	5d                   	pop    %ebp
c0101a00:	c3                   	ret    
c0101a01:	eb 0d                	jmp    c0101a10 <buf_writeback>
c0101a03:	90                   	nop
c0101a04:	90                   	nop
c0101a05:	90                   	nop
c0101a06:	90                   	nop
c0101a07:	90                   	nop
c0101a08:	90                   	nop
c0101a09:	90                   	nop
c0101a0a:	90                   	nop
c0101a0b:	90                   	nop
c0101a0c:	90                   	nop
c0101a0d:	90                   	nop
c0101a0e:	90                   	nop
c0101a0f:	90                   	nop

c0101a10 <buf_writeback>:
c0101a10:	55                   	push   %ebp
c0101a11:	89 e5                	mov    %esp,%ebp
c0101a13:	53                   	push   %ebx
c0101a14:	bb 46 31 15 c0       	mov    $0xc0153146,%ebx
c0101a19:	83 ec 04             	sub    $0x4,%esp
c0101a1c:	eb 10                	jmp    c0101a2e <buf_writeback+0x1e>
c0101a1e:	66 90                	xchg   %ax,%ax
c0101a20:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101a26:	81 fb 46 35 16 c0    	cmp    $0xc0163546,%ebx
c0101a2c:	74 32                	je     c0101a60 <buf_writeback+0x50>
c0101a2e:	80 7b ff 01          	cmpb   $0x1,-0x1(%ebx)
c0101a32:	75 ec                	jne    c0101a20 <buf_writeback+0x10>
c0101a34:	83 ec 08             	sub    $0x8,%esp
c0101a37:	ff 73 fa             	pushl  -0x6(%ebx)
c0101a3a:	53                   	push   %ebx
c0101a3b:	81 c3 08 02 00 00    	add    $0x208,%ebx
c0101a41:	e8 1a 01 00 00       	call   c0101b60 <disk_do_write>
c0101a46:	c6 83 f7 fd ff ff 00 	movb   $0x0,-0x209(%ebx)
c0101a4d:	83 c4 10             	add    $0x10,%esp
c0101a50:	81 fb 46 35 16 c0    	cmp    $0xc0163546,%ebx
c0101a56:	75 d6                	jne    c0101a2e <buf_writeback+0x1e>
c0101a58:	90                   	nop
c0101a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0101a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0101a63:	c9                   	leave  
c0101a64:	c3                   	ret    
c0101a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101a70 <read_byte>:
c0101a70:	55                   	push   %ebp
c0101a71:	89 e5                	mov    %esp,%ebp
c0101a73:	53                   	push   %ebx
c0101a74:	83 ec 04             	sub    $0x4,%esp
c0101a77:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101a7a:	89 d8                	mov    %ebx,%eax
c0101a7c:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101a82:	c1 e8 09             	shr    $0x9,%eax
c0101a85:	e8 a6 fe ff ff       	call   c0101930 <buf_fetch>
c0101a8a:	0f b6 44 18 06       	movzbl 0x6(%eax,%ebx,1),%eax
c0101a8f:	83 c4 04             	add    $0x4,%esp
c0101a92:	5b                   	pop    %ebx
c0101a93:	5d                   	pop    %ebp
c0101a94:	c3                   	ret    
c0101a95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101aa0 <write_byte>:
c0101aa0:	55                   	push   %ebp
c0101aa1:	89 e5                	mov    %esp,%ebp
c0101aa3:	56                   	push   %esi
c0101aa4:	53                   	push   %ebx
c0101aa5:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0101aa8:	8b 75 0c             	mov    0xc(%ebp),%esi
c0101aab:	89 d8                	mov    %ebx,%eax
c0101aad:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
c0101ab3:	c1 e8 09             	shr    $0x9,%eax
c0101ab6:	e8 75 fe ff ff       	call   c0101930 <buf_fetch>
c0101abb:	89 f2                	mov    %esi,%edx
c0101abd:	88 54 18 06          	mov    %dl,0x6(%eax,%ebx,1)
c0101ac1:	c6 40 05 01          	movb   $0x1,0x5(%eax)
c0101ac5:	5b                   	pop    %ebx
c0101ac6:	5e                   	pop    %esi
c0101ac7:	5d                   	pop    %ebp
c0101ac8:	c3                   	ret    
c0101ac9:	66 90                	xchg   %ax,%ax
c0101acb:	66 90                	xchg   %ax,%ax
c0101acd:	66 90                	xchg   %ax,%ax
c0101acf:	90                   	nop

c0101ad0 <ide_prepare>:
c0101ad0:	55                   	push   %ebp
c0101ad1:	89 c1                	mov    %eax,%ecx
c0101ad3:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101ad8:	89 e5                	mov    %esp,%ebp
c0101ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101ae0:	ec                   	in     (%dx),%al
c0101ae1:	83 e0 c0             	and    $0xffffffc0,%eax
c0101ae4:	3c 40                	cmp    $0x40,%al
c0101ae6:	75 f8                	jne    c0101ae0 <ide_prepare+0x10>
c0101ae8:	ba f1 01 00 00       	mov    $0x1f1,%edx
c0101aed:	31 c0                	xor    %eax,%eax
c0101aef:	ee                   	out    %al,(%dx)
c0101af0:	b8 01 00 00 00       	mov    $0x1,%eax
c0101af5:	b2 f2                	mov    $0xf2,%dl
c0101af7:	ee                   	out    %al,(%dx)
c0101af8:	b2 f3                	mov    $0xf3,%dl
c0101afa:	89 c8                	mov    %ecx,%eax
c0101afc:	ee                   	out    %al,(%dx)
c0101afd:	89 c8                	mov    %ecx,%eax
c0101aff:	b2 f4                	mov    $0xf4,%dl
c0101b01:	c1 e8 08             	shr    $0x8,%eax
c0101b04:	ee                   	out    %al,(%dx)
c0101b05:	89 c8                	mov    %ecx,%eax
c0101b07:	b2 f5                	mov    $0xf5,%dl
c0101b09:	c1 e8 10             	shr    $0x10,%eax
c0101b0c:	ee                   	out    %al,(%dx)
c0101b0d:	89 c8                	mov    %ecx,%eax
c0101b0f:	b2 f6                	mov    $0xf6,%dl
c0101b11:	c1 e8 18             	shr    $0x18,%eax
c0101b14:	83 c8 e0             	or     $0xffffffe0,%eax
c0101b17:	ee                   	out    %al,(%dx)
c0101b18:	5d                   	pop    %ebp
c0101b19:	c3                   	ret    
c0101b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0101b20 <disk_do_read>:
c0101b20:	55                   	push   %ebp
c0101b21:	89 e5                	mov    %esp,%ebp
c0101b23:	53                   	push   %ebx
c0101b24:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b27:	e8 a4 ff ff ff       	call   c0101ad0 <ide_prepare>
c0101b2c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101b31:	b8 20 00 00 00       	mov    $0x20,%eax
c0101b36:	ee                   	out    %al,(%dx)
c0101b37:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101b3a:	b2 f0                	mov    $0xf0,%dl
c0101b3c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101b48:	ed                   	in     (%dx),%eax
c0101b49:	89 01                	mov    %eax,(%ecx)
c0101b4b:	83 c1 04             	add    $0x4,%ecx
c0101b4e:	39 d9                	cmp    %ebx,%ecx
c0101b50:	75 f6                	jne    c0101b48 <disk_do_read+0x28>
c0101b52:	5b                   	pop    %ebx
c0101b53:	5d                   	pop    %ebp
c0101b54:	c3                   	ret    
c0101b55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101b60 <disk_do_write>:
c0101b60:	55                   	push   %ebp
c0101b61:	89 e5                	mov    %esp,%ebp
c0101b63:	53                   	push   %ebx
c0101b64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101b67:	e8 64 ff ff ff       	call   c0101ad0 <ide_prepare>
c0101b6c:	ba f7 01 00 00       	mov    $0x1f7,%edx
c0101b71:	b8 30 00 00 00       	mov    $0x30,%eax
c0101b76:	ee                   	out    %al,(%dx)
c0101b77:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101b7a:	b2 f0                	mov    $0xf0,%dl
c0101b7c:	8d 99 00 02 00 00    	lea    0x200(%ecx),%ebx
c0101b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0101b88:	8b 01                	mov    (%ecx),%eax
c0101b8a:	ef                   	out    %eax,(%dx)
c0101b8b:	83 c1 04             	add    $0x4,%ecx
c0101b8e:	39 d9                	cmp    %ebx,%ecx
c0101b90:	75 f6                	jne    c0101b88 <disk_do_write+0x28>
c0101b92:	5b                   	pop    %ebx
c0101b93:	5d                   	pop    %ebp
c0101b94:	c3                   	ret    
c0101b95:	66 90                	xchg   %ax,%ax
c0101b97:	66 90                	xchg   %ax,%ax
c0101b99:	66 90                	xchg   %ax,%ax
c0101b9b:	66 90                	xchg   %ax,%ax
c0101b9d:	66 90                	xchg   %ax,%ax
c0101b9f:	90                   	nop

c0101ba0 <dma_prepare>:
c0101ba0:	55                   	push   %ebp
c0101ba1:	89 e5                	mov    %esp,%ebp
c0101ba3:	83 ec 08             	sub    $0x8,%esp
c0101ba6:	68 e8 8d 10 c0       	push   $0xc0108de8
c0101bab:	6a 1d                	push   $0x1d
c0101bad:	68 7f 8d 10 c0       	push   $0xc0108d7f
c0101bb2:	68 9c 8d 10 c0       	push   $0xc0108d9c
c0101bb7:	e8 24 fb ff ff       	call   c01016e0 <printk>
c0101bbc:	b8 01 00 00 00       	mov    $0x1,%eax
c0101bc1:	d6                   	(bad)  
c0101bc2:	83 c4 10             	add    $0x10,%esp
c0101bc5:	c9                   	leave  
c0101bc6:	c3                   	ret    
c0101bc7:	89 f6                	mov    %esi,%esi
c0101bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101bd0 <dma_issue_read>:
c0101bd0:	55                   	push   %ebp
c0101bd1:	ba 40 c0 ff ff       	mov    $0xffffc040,%edx
c0101bd6:	89 e5                	mov    %esp,%ebp
c0101bd8:	ec                   	in     (%dx),%al
c0101bd9:	83 c8 09             	or     $0x9,%eax
c0101bdc:	ee                   	out    %al,(%dx)
c0101bdd:	5d                   	pop    %ebp
c0101bde:	c3                   	ret    
c0101bdf:	90                   	nop

c0101be0 <memcpy>:
c0101be0:	55                   	push   %ebp
c0101be1:	89 e5                	mov    %esp,%ebp
c0101be3:	56                   	push   %esi
c0101be4:	57                   	push   %edi
c0101be5:	53                   	push   %ebx
c0101be6:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101be9:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101bec:	8b 75 0c             	mov    0xc(%ebp),%esi
c0101bef:	fc                   	cld    
c0101bf0:	83 f9 08             	cmp    $0x8,%ecx
c0101bf3:	76 26                	jbe    c0101c1b <memcpy+0x3b>
c0101bf5:	89 fa                	mov    %edi,%edx
c0101bf7:	89 cb                	mov    %ecx,%ebx
c0101bf9:	83 e2 03             	and    $0x3,%edx
c0101bfc:	74 10                	je     c0101c0e <memcpy+0x2e>
c0101bfe:	b9 04 00 00 00       	mov    $0x4,%ecx
c0101c03:	29 d1                	sub    %edx,%ecx
c0101c05:	83 e1 03             	and    $0x3,%ecx
c0101c08:	29 cb                	sub    %ecx,%ebx
c0101c0a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0101c0c:	89 d9                	mov    %ebx,%ecx
c0101c0e:	c1 e9 02             	shr    $0x2,%ecx
c0101c11:	8d 76 00             	lea    0x0(%esi),%esi
c0101c14:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0101c16:	89 d9                	mov    %ebx,%ecx
c0101c18:	83 e1 03             	and    $0x3,%ecx
c0101c1b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0101c1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0101c23:	5b                   	pop    %ebx
c0101c24:	5f                   	pop    %edi
c0101c25:	5e                   	pop    %esi
c0101c26:	c9                   	leave  
c0101c27:	c3                   	ret    

c0101c28 <memset>:
c0101c28:	55                   	push   %ebp
c0101c29:	89 e5                	mov    %esp,%ebp
c0101c2b:	57                   	push   %edi
c0101c2c:	8b 7d 08             	mov    0x8(%ebp),%edi
c0101c2f:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0101c33:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0101c36:	fc                   	cld    
c0101c37:	83 f9 10             	cmp    $0x10,%ecx
c0101c3a:	76 69                	jbe    c0101ca5 <memset+0x7d>
c0101c3c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c42:	74 4c                	je     c0101c90 <memset+0x68>
c0101c44:	88 07                	mov    %al,(%edi)
c0101c46:	47                   	inc    %edi
c0101c47:	49                   	dec    %ecx
c0101c48:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c4e:	74 40                	je     c0101c90 <memset+0x68>
c0101c50:	88 07                	mov    %al,(%edi)
c0101c52:	47                   	inc    %edi
c0101c53:	49                   	dec    %ecx
c0101c54:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c5a:	74 34                	je     c0101c90 <memset+0x68>
c0101c5c:	88 07                	mov    %al,(%edi)
c0101c5e:	47                   	inc    %edi
c0101c5f:	49                   	dec    %ecx
c0101c60:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c66:	74 28                	je     c0101c90 <memset+0x68>
c0101c68:	88 07                	mov    %al,(%edi)
c0101c6a:	47                   	inc    %edi
c0101c6b:	49                   	dec    %ecx
c0101c6c:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c72:	74 1c                	je     c0101c90 <memset+0x68>
c0101c74:	88 07                	mov    %al,(%edi)
c0101c76:	47                   	inc    %edi
c0101c77:	49                   	dec    %ecx
c0101c78:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c7e:	74 10                	je     c0101c90 <memset+0x68>
c0101c80:	88 07                	mov    %al,(%edi)
c0101c82:	47                   	inc    %edi
c0101c83:	49                   	dec    %ecx
c0101c84:	f7 c7 07 00 00 00    	test   $0x7,%edi
c0101c8a:	74 04                	je     c0101c90 <memset+0x68>
c0101c8c:	88 07                	mov    %al,(%edi)
c0101c8e:	47                   	inc    %edi
c0101c8f:	49                   	dec    %ecx
c0101c90:	88 c4                	mov    %al,%ah
c0101c92:	89 c2                	mov    %eax,%edx
c0101c94:	c1 e2 10             	shl    $0x10,%edx
c0101c97:	09 d0                	or     %edx,%eax
c0101c99:	89 ca                	mov    %ecx,%edx
c0101c9b:	c1 e9 02             	shr    $0x2,%ecx
c0101c9e:	83 e2 03             	and    $0x3,%edx
c0101ca1:	f3 ab                	rep stos %eax,%es:(%edi)
c0101ca3:	89 d1                	mov    %edx,%ecx
c0101ca5:	f3 aa                	rep stos %al,%es:(%edi)
c0101ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101caa:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0101cad:	5f                   	pop    %edi
c0101cae:	c9                   	leave  
c0101caf:	c3                   	ret    

c0101cb0 <strcmp>:
c0101cb0:	55                   	push   %ebp
c0101cb1:	89 e5                	mov    %esp,%ebp
c0101cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101cb6:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101cb9:	53                   	push   %ebx
c0101cba:	89 c1                	mov    %eax,%ecx
c0101cbc:	09 d1                	or     %edx,%ecx
c0101cbe:	83 e1 03             	and    $0x3,%ecx
c0101cc1:	75 17                	jne    c0101cda <strcmp+0x2a>
c0101cc3:	8b 08                	mov    (%eax),%ecx
c0101cc5:	3b 0a                	cmp    (%edx),%ecx
c0101cc7:	74 33                	je     c0101cfc <strcmp+0x4c>
c0101cc9:	eb 0f                	jmp    c0101cda <strcmp+0x2a>
c0101ccb:	90                   	nop
c0101ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101cd0:	3a 0a                	cmp    (%edx),%cl
c0101cd2:	75 0d                	jne    c0101ce1 <strcmp+0x31>
c0101cd4:	83 c0 01             	add    $0x1,%eax
c0101cd7:	83 c2 01             	add    $0x1,%edx
c0101cda:	0f b6 08             	movzbl (%eax),%ecx
c0101cdd:	84 c9                	test   %cl,%cl
c0101cdf:	75 ef                	jne    c0101cd0 <strcmp+0x20>
c0101ce1:	0f b6 00             	movzbl (%eax),%eax
c0101ce4:	0f b6 12             	movzbl (%edx),%edx
c0101ce7:	5b                   	pop    %ebx
c0101ce8:	5d                   	pop    %ebp
c0101ce9:	29 d0                	sub    %edx,%eax
c0101ceb:	c3                   	ret    
c0101cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101cf0:	83 c0 04             	add    $0x4,%eax
c0101cf3:	83 c2 04             	add    $0x4,%edx
c0101cf6:	8b 08                	mov    (%eax),%ecx
c0101cf8:	3b 0a                	cmp    (%edx),%ecx
c0101cfa:	75 de                	jne    c0101cda <strcmp+0x2a>
c0101cfc:	8d 99 ff fe fe fe    	lea    -0x1010101(%ecx),%ebx
c0101d02:	f7 d1                	not    %ecx
c0101d04:	21 cb                	and    %ecx,%ebx
c0101d06:	81 e3 80 80 80 80    	and    $0x80808080,%ebx
c0101d0c:	74 e2                	je     c0101cf0 <strcmp+0x40>
c0101d0e:	31 c0                	xor    %eax,%eax
c0101d10:	5b                   	pop    %ebx
c0101d11:	5d                   	pop    %ebp
c0101d12:	c3                   	ret    
c0101d13:	66 90                	xchg   %ax,%ax
c0101d15:	66 90                	xchg   %ax,%ax
c0101d17:	66 90                	xchg   %ax,%ax
c0101d19:	66 90                	xchg   %ax,%ax
c0101d1b:	66 90                	xchg   %ax,%ax
c0101d1d:	66 90                	xchg   %ax,%ax
c0101d1f:	90                   	nop

c0101d20 <_vsnprintf_r>:
c0101d20:	55                   	push   %ebp
c0101d21:	89 e5                	mov    %esp,%ebp
c0101d23:	56                   	push   %esi
c0101d24:	53                   	push   %ebx
c0101d25:	83 c4 80             	add    $0xffffff80,%esp
c0101d28:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0101d2b:	8b 75 08             	mov    0x8(%ebp),%esi
c0101d2e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101d31:	85 db                	test   %ebx,%ebx
c0101d33:	78 63                	js     c0101d98 <_vsnprintf_r+0x78>
c0101d35:	ba 08 02 00 00       	mov    $0x208,%edx
c0101d3a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0101d3f:	66 89 55 9c          	mov    %dx,-0x64(%ebp)
c0101d43:	8d 53 ff             	lea    -0x1(%ebx),%edx
c0101d46:	89 45 90             	mov    %eax,-0x70(%ebp)
c0101d49:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0101d4c:	31 c0                	xor    %eax,%eax
c0101d4e:	85 db                	test   %ebx,%ebx
c0101d50:	0f 45 c2             	cmovne %edx,%eax
c0101d53:	89 45 98             	mov    %eax,-0x68(%ebp)
c0101d56:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0101d59:	8b 45 18             	mov    0x18(%ebp),%eax
c0101d5c:	89 34 24             	mov    %esi,(%esp)
c0101d5f:	66 89 4d 9e          	mov    %cx,-0x62(%ebp)
c0101d63:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0101d67:	8b 45 14             	mov    0x14(%ebp),%eax
c0101d6a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101d6e:	8d 45 90             	lea    -0x70(%ebp),%eax
c0101d71:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101d75:	e8 86 00 00 00       	call   c0101e00 <_svfprintf_r>
c0101d7a:	83 f8 ff             	cmp    $0xffffffff,%eax
c0101d7d:	7c 11                	jl     c0101d90 <_vsnprintf_r+0x70>
c0101d7f:	85 db                	test   %ebx,%ebx
c0101d81:	74 06                	je     c0101d89 <_vsnprintf_r+0x69>
c0101d83:	8b 55 90             	mov    -0x70(%ebp),%edx
c0101d86:	c6 02 00             	movb   $0x0,(%edx)
c0101d89:	83 ec 80             	sub    $0xffffff80,%esp
c0101d8c:	5b                   	pop    %ebx
c0101d8d:	5e                   	pop    %esi
c0101d8e:	5d                   	pop    %ebp
c0101d8f:	c3                   	ret    
c0101d90:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c0101d96:	eb e7                	jmp    c0101d7f <_vsnprintf_r+0x5f>
c0101d98:	c7 06 8b 00 00 00    	movl   $0x8b,(%esi)
c0101d9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101da3:	eb e4                	jmp    c0101d89 <_vsnprintf_r+0x69>
c0101da5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0101db0 <vsnprintf>:
c0101db0:	55                   	push   %ebp
c0101db1:	89 e5                	mov    %esp,%ebp
c0101db3:	83 ec 28             	sub    $0x28,%esp
c0101db6:	e8 35 00 00 00       	call   c0101df0 <__getreent>
c0101dbb:	8b 55 14             	mov    0x14(%ebp),%edx
c0101dbe:	89 54 24 10          	mov    %edx,0x10(%esp)
c0101dc2:	8b 55 10             	mov    0x10(%ebp),%edx
c0101dc5:	89 04 24             	mov    %eax,(%esp)
c0101dc8:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0101dcc:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101dcf:	89 54 24 08          	mov    %edx,0x8(%esp)
c0101dd3:	8b 55 08             	mov    0x8(%ebp),%edx
c0101dd6:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101dda:	e8 41 ff ff ff       	call   c0101d20 <_vsnprintf_r>
c0101ddf:	c9                   	leave  
c0101de0:	c3                   	ret    
c0101de1:	66 90                	xchg   %ax,%ax
c0101de3:	66 90                	xchg   %ax,%ax
c0101de5:	66 90                	xchg   %ax,%ax
c0101de7:	66 90                	xchg   %ax,%ax
c0101de9:	66 90                	xchg   %ax,%ax
c0101deb:	66 90                	xchg   %ax,%ax
c0101ded:	66 90                	xchg   %ax,%ax
c0101def:	90                   	nop

c0101df0 <__getreent>:
c0101df0:	55                   	push   %ebp
c0101df1:	a1 80 b3 10 c0       	mov    0xc010b380,%eax
c0101df6:	89 e5                	mov    %esp,%ebp
c0101df8:	5d                   	pop    %ebp
c0101df9:	c3                   	ret    
c0101dfa:	66 90                	xchg   %ax,%ax
c0101dfc:	66 90                	xchg   %ax,%ax
c0101dfe:	66 90                	xchg   %ax,%ax

c0101e00 <_svfprintf_r>:
c0101e00:	55                   	push   %ebp
c0101e01:	89 e5                	mov    %esp,%ebp
c0101e03:	57                   	push   %edi
c0101e04:	56                   	push   %esi
c0101e05:	53                   	push   %ebx
c0101e06:	81 ec 1c 01 00 00    	sub    $0x11c,%esp
c0101e0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e0f:	89 04 24             	mov    %eax,(%esp)
c0101e12:	e8 89 33 00 00       	call   c01051a0 <_localeconv_r>
c0101e17:	8b 00                	mov    (%eax),%eax
c0101e19:	89 04 24             	mov    %eax,(%esp)
c0101e1c:	89 85 0c ff ff ff    	mov    %eax,-0xf4(%ebp)
c0101e22:	e8 69 4a 00 00       	call   c0106890 <strlen>
c0101e27:	89 85 08 ff ff ff    	mov    %eax,-0xf8(%ebp)
c0101e2d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101e30:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0101e34:	74 0b                	je     c0101e41 <_svfprintf_r+0x41>
c0101e36:	8b 40 10             	mov    0x10(%eax),%eax
c0101e39:	85 c0                	test   %eax,%eax
c0101e3b:	0f 84 62 18 00 00    	je     c01036a3 <_svfprintf_r+0x18a3>
c0101e41:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0101e44:	8d 55 a7             	lea    -0x59(%ebp),%edx
c0101e47:	89 c7                	mov    %eax,%edi
c0101e49:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0101e4f:	90                   	nop
c0101e50:	90                   	nop
c0101e51:	29 d0                	sub    %edx,%eax
c0101e53:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c0101e5a:	00 00 00 
c0101e5d:	90                   	nop
c0101e5e:	90                   	nop
c0101e5f:	90                   	nop
c0101e60:	90                   	nop
c0101e61:	90                   	nop
c0101e62:	90                   	nop
c0101e63:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0101e6a:	00 00 00 
c0101e6d:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%ebp)
c0101e74:	00 00 00 
c0101e77:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%ebp)
c0101e7e:	00 00 00 
c0101e81:	c7 85 04 ff ff ff 00 	movl   $0x0,-0xfc(%ebp)
c0101e88:	00 00 00 
c0101e8b:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c0101e92:	00 00 00 
c0101e95:	89 85 00 ff ff ff    	mov    %eax,-0x100(%ebp)
c0101e9b:	8b 45 10             	mov    0x10(%ebp),%eax
c0101e9e:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0101ea1:	0f b6 00             	movzbl (%eax),%eax
c0101ea4:	3c 25                	cmp    $0x25,%al
c0101ea6:	74 4d                	je     c0101ef5 <_svfprintf_r+0xf5>
c0101ea8:	84 c0                	test   %al,%al
c0101eaa:	75 08                	jne    c0101eb4 <_svfprintf_r+0xb4>
c0101eac:	eb 47                	jmp    c0101ef5 <_svfprintf_r+0xf5>
c0101eae:	66 90                	xchg   %ax,%ax
c0101eb0:	84 c0                	test   %al,%al
c0101eb2:	74 0a                	je     c0101ebe <_svfprintf_r+0xbe>
c0101eb4:	83 c3 01             	add    $0x1,%ebx
c0101eb7:	0f b6 03             	movzbl (%ebx),%eax
c0101eba:	3c 25                	cmp    $0x25,%al
c0101ebc:	75 f2                	jne    c0101eb0 <_svfprintf_r+0xb0>
c0101ebe:	89 de                	mov    %ebx,%esi
c0101ec0:	2b 75 10             	sub    0x10(%ebp),%esi
c0101ec3:	74 30                	je     c0101ef5 <_svfprintf_r+0xf5>
c0101ec5:	8b 45 10             	mov    0x10(%ebp),%eax
c0101ec8:	83 c7 08             	add    $0x8,%edi
c0101ecb:	89 77 fc             	mov    %esi,-0x4(%edi)
c0101ece:	01 b5 7c ff ff ff    	add    %esi,-0x84(%ebp)
c0101ed4:	89 47 f8             	mov    %eax,-0x8(%edi)
c0101ed7:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0101edd:	83 c0 01             	add    $0x1,%eax
c0101ee0:	83 f8 07             	cmp    $0x7,%eax
c0101ee3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0101ee9:	0f 8f 91 00 00 00    	jg     c0101f80 <_svfprintf_r+0x180>
c0101eef:	01 b5 34 ff ff ff    	add    %esi,-0xcc(%ebp)
c0101ef5:	80 3b 00             	cmpb   $0x0,(%ebx)
c0101ef8:	0f 84 aa 00 00 00    	je     c0101fa8 <_svfprintf_r+0x1a8>
c0101efe:	8d 43 01             	lea    0x1(%ebx),%eax
c0101f01:	be 20 00 00 00       	mov    $0x20,%esi
c0101f06:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0101f0d:	31 db                	xor    %ebx,%ebx
c0101f0f:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0101f16:	ff ff ff 
c0101f19:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c0101f20:	00 00 00 
c0101f23:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%ebp)
c0101f2a:	00 00 00 
c0101f2d:	8d 48 01             	lea    0x1(%eax),%ecx
c0101f30:	0f be 00             	movsbl (%eax),%eax
c0101f33:	8d 50 e0             	lea    -0x20(%eax),%edx
c0101f36:	83 fa 58             	cmp    $0x58,%edx
c0101f39:	0f 87 8f 07 00 00    	ja     c01026ce <_svfprintf_r+0x8ce>
c0101f3f:	ff 24 95 34 8e 10 c0 	jmp    *-0x3fef71cc(,%edx,4)
c0101f46:	66 90                	xchg   %ax,%ax
c0101f48:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0101f4f:	89 c8                	mov    %ecx,%eax
c0101f51:	eb da                	jmp    c0101f2d <_svfprintf_r+0x12d>
c0101f53:	8b 45 14             	mov    0x14(%ebp),%eax
c0101f56:	8b 55 14             	mov    0x14(%ebp),%edx
c0101f59:	8b 00                	mov    (%eax),%eax
c0101f5b:	83 c2 04             	add    $0x4,%edx
c0101f5e:	89 55 14             	mov    %edx,0x14(%ebp)
c0101f61:	85 c0                	test   %eax,%eax
c0101f63:	89 85 40 ff ff ff    	mov    %eax,-0xc0(%ebp)
c0101f69:	79 e4                	jns    c0101f4f <_svfprintf_r+0x14f>
c0101f6b:	f7 9d 40 ff ff ff    	negl   -0xc0(%ebp)
c0101f71:	83 8d 4c ff ff ff 04 	orl    $0x4,-0xb4(%ebp)
c0101f78:	89 c8                	mov    %ecx,%eax
c0101f7a:	eb b1                	jmp    c0101f2d <_svfprintf_r+0x12d>
c0101f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0101f80:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101f86:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101f8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101f8d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101f91:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f94:	89 04 24             	mov    %eax,(%esp)
c0101f97:	e8 74 49 00 00       	call   c0106910 <__ssprint_r>
c0101f9c:	85 c0                	test   %eax,%eax
c0101f9e:	75 30                	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0101fa0:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0101fa3:	e9 47 ff ff ff       	jmp    c0101eef <_svfprintf_r+0xef>
c0101fa8:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0101fae:	85 c0                	test   %eax,%eax
c0101fb0:	74 1e                	je     c0101fd0 <_svfprintf_r+0x1d0>
c0101fb2:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0101fb8:	89 44 24 08          	mov    %eax,0x8(%esp)
c0101fbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0101fbf:	89 44 24 04          	mov    %eax,0x4(%esp)
c0101fc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fc6:	89 04 24             	mov    %eax,(%esp)
c0101fc9:	e8 42 49 00 00       	call   c0106910 <__ssprint_r>
c0101fce:	66 90                	xchg   %ax,%ax
c0101fd0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101fd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101fd8:	f6 42 0c 40          	testb  $0x40,0xc(%edx)
c0101fdc:	0f 44 85 34 ff ff ff 	cmove  -0xcc(%ebp),%eax
c0101fe3:	81 c4 1c 01 00 00    	add    $0x11c,%esp
c0101fe9:	5b                   	pop    %ebx
c0101fea:	5e                   	pop    %esi
c0101feb:	5f                   	pop    %edi
c0101fec:	5d                   	pop    %ebp
c0101fed:	c3                   	ret    
c0101fee:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c0101ff3:	89 c8                	mov    %ecx,%eax
c0101ff5:	e9 33 ff ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c0101ffa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102000:	8b 45 14             	mov    0x14(%ebp),%eax
c0102003:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102006:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c010200d:	8d 70 04             	lea    0x4(%eax),%esi
c0102010:	8b 00                	mov    (%eax),%eax
c0102012:	85 c0                	test   %eax,%eax
c0102014:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010201a:	0f 84 7f 18 00 00    	je     c010389f <_svfprintf_r+0x1a9f>
c0102020:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0102026:	85 c0                	test   %eax,%eax
c0102028:	0f 88 b6 17 00 00    	js     c01037e4 <_svfprintf_r+0x19e4>
c010202e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102032:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0102038:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010203f:	00 
c0102040:	89 04 24             	mov    %eax,(%esp)
c0102043:	e8 f8 38 00 00       	call   c0105940 <memchr>
c0102048:	85 c0                	test   %eax,%eax
c010204a:	0f 84 a0 19 00 00    	je     c01039f0 <_svfprintf_r+0x1bf0>
c0102050:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0102056:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c010205c:	39 d0                	cmp    %edx,%eax
c010205e:	0f 4f c2             	cmovg  %edx,%eax
c0102061:	89 c2                	mov    %eax,%edx
c0102063:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010206a:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102070:	31 c0                	xor    %eax,%eax
c0102072:	85 d2                	test   %edx,%edx
c0102074:	0f 49 c2             	cmovns %edx,%eax
c0102077:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c010207d:	89 75 14             	mov    %esi,0x14(%ebp)
c0102080:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102087:	00 00 00 
c010208a:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0102091:	00 00 00 
c0102094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102098:	84 db                	test   %bl,%bl
c010209a:	74 07                	je     c01020a3 <_svfprintf_r+0x2a3>
c010209c:	83 85 48 ff ff ff 01 	addl   $0x1,-0xb8(%ebp)
c01020a3:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c01020a9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01020af:	89 c8                	mov    %ecx,%eax
c01020b1:	89 f2                	mov    %esi,%edx
c01020b3:	83 c0 02             	add    $0x2,%eax
c01020b6:	83 e2 02             	and    $0x2,%edx
c01020b9:	89 95 30 ff ff ff    	mov    %edx,-0xd0(%ebp)
c01020bf:	89 f2                	mov    %esi,%edx
c01020c1:	0f 44 c1             	cmove  %ecx,%eax
c01020c4:	81 e2 84 00 00 00    	and    $0x84,%edx
c01020ca:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01020d0:	89 95 2c ff ff ff    	mov    %edx,-0xd4(%ebp)
c01020d6:	0f 85 1c 06 00 00    	jne    c01026f8 <_svfprintf_r+0x8f8>
c01020dc:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c01020e2:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01020e8:	85 f6                	test   %esi,%esi
c01020ea:	0f 8e 08 06 00 00    	jle    c01026f8 <_svfprintf_r+0x8f8>
c01020f0:	83 fe 10             	cmp    $0x10,%esi
c01020f3:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01020f9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01020ff:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102105:	7f 11                	jg     c0102118 <_svfprintf_r+0x318>
c0102107:	eb 6b                	jmp    c0102174 <_svfprintf_r+0x374>
c0102109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102110:	83 ee 10             	sub    $0x10,%esi
c0102113:	83 fe 10             	cmp    $0x10,%esi
c0102116:	7e 5c                	jle    c0102174 <_svfprintf_r+0x374>
c0102118:	83 c0 01             	add    $0x1,%eax
c010211b:	83 c1 10             	add    $0x10,%ecx
c010211e:	c7 07 a8 8f 10 c0    	movl   $0xc0108fa8,(%edi)
c0102124:	83 c7 08             	add    $0x8,%edi
c0102127:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010212e:	83 f8 07             	cmp    $0x7,%eax
c0102131:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102137:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010213d:	7e d1                	jle    c0102110 <_svfprintf_r+0x310>
c010213f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102142:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102146:	89 44 24 04          	mov    %eax,0x4(%esp)
c010214a:	8b 45 08             	mov    0x8(%ebp),%eax
c010214d:	89 04 24             	mov    %eax,(%esp)
c0102150:	e8 bb 47 00 00       	call   c0106910 <__ssprint_r>
c0102155:	85 c0                	test   %eax,%eax
c0102157:	0f 85 73 fe ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010215d:	83 ee 10             	sub    $0x10,%esi
c0102160:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102166:	83 fe 10             	cmp    $0x10,%esi
c0102169:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010216f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102172:	7f a4                	jg     c0102118 <_svfprintf_r+0x318>
c0102174:	83 c0 01             	add    $0x1,%eax
c0102177:	01 f1                	add    %esi,%ecx
c0102179:	83 f8 07             	cmp    $0x7,%eax
c010217c:	c7 07 a8 8f 10 c0    	movl   $0xc0108fa8,(%edi)
c0102182:	89 77 04             	mov    %esi,0x4(%edi)
c0102185:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010218b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102191:	0f 8f 16 0e 00 00    	jg     c0102fad <_svfprintf_r+0x11ad>
c0102197:	83 c7 08             	add    $0x8,%edi
c010219a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01021a1:	e9 58 05 00 00       	jmp    c01026fe <_svfprintf_r+0x8fe>
c01021a6:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01021ad:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01021b3:	8b 45 14             	mov    0x14(%ebp),%eax
c01021b6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01021b9:	0f 85 fd 04 00 00    	jne    c01026bc <_svfprintf_r+0x8bc>
c01021bf:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01021c6:	0f 84 f0 04 00 00    	je     c01026bc <_svfprintf_r+0x8bc>
c01021cc:	0f b7 08             	movzwl (%eax),%ecx
c01021cf:	83 c0 04             	add    $0x4,%eax
c01021d2:	89 45 14             	mov    %eax,0x14(%ebp)
c01021d5:	b8 01 00 00 00       	mov    $0x1,%eax
c01021da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01021e0:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01021e7:	31 db                	xor    %ebx,%ebx
c01021e9:	8b b5 4c ff ff ff    	mov    -0xb4(%ebp),%esi
c01021ef:	89 f2                	mov    %esi,%edx
c01021f1:	80 e2 7f             	and    $0x7f,%dl
c01021f4:	83 bd 44 ff ff ff 00 	cmpl   $0x0,-0xbc(%ebp)
c01021fb:	0f 48 d6             	cmovs  %esi,%edx
c01021fe:	89 95 4c ff ff ff    	mov    %edx,-0xb4(%ebp)
c0102204:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c010220a:	85 d2                	test   %edx,%edx
c010220c:	75 08                	jne    c0102216 <_svfprintf_r+0x416>
c010220e:	85 c9                	test   %ecx,%ecx
c0102210:	0f 84 ea 08 00 00    	je     c0102b00 <_svfprintf_r+0xd00>
c0102216:	3c 01                	cmp    $0x1,%al
c0102218:	0f 84 6a 0d 00 00    	je     c0102f88 <_svfprintf_r+0x1188>
c010221e:	3c 02                	cmp    $0x2,%al
c0102220:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102223:	0f 85 bf 0b 00 00    	jne    c0102de8 <_svfprintf_r+0xfe8>
c0102229:	8b b5 18 ff ff ff    	mov    -0xe8(%ebp),%esi
c010222f:	90                   	nop
c0102230:	89 ca                	mov    %ecx,%edx
c0102232:	83 e8 01             	sub    $0x1,%eax
c0102235:	83 e2 0f             	and    $0xf,%edx
c0102238:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
c010223c:	c1 e9 04             	shr    $0x4,%ecx
c010223f:	85 c9                	test   %ecx,%ecx
c0102241:	88 10                	mov    %dl,(%eax)
c0102243:	75 eb                	jne    c0102230 <_svfprintf_r+0x430>
c0102245:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0102248:	29 c2                	sub    %eax,%edx
c010224a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102250:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0102256:	66 90                	xchg   %ax,%ax
c0102258:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c010225e:	8b 95 38 ff ff ff    	mov    -0xc8(%ebp),%edx
c0102264:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010226b:	00 00 00 
c010226e:	39 c2                	cmp    %eax,%edx
c0102270:	0f 4d c2             	cmovge %edx,%eax
c0102273:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0102279:	e9 1a fe ff ff       	jmp    c0102098 <_svfprintf_r+0x298>
c010227e:	84 db                	test   %bl,%bl
c0102280:	89 c8                	mov    %ecx,%eax
c0102282:	0f 44 de             	cmove  %esi,%ebx
c0102285:	e9 a3 fc ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c010228a:	83 8d 4c ff ff ff 01 	orl    $0x1,-0xb4(%ebp)
c0102291:	89 c8                	mov    %ecx,%eax
c0102293:	e9 95 fc ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c0102298:	81 8d 4c ff ff ff 80 	orl    $0x80,-0xb4(%ebp)
c010229f:	00 00 00 
c01022a2:	89 c8                	mov    %ecx,%eax
c01022a4:	e9 84 fc ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c01022a9:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c01022af:	8d 50 d0             	lea    -0x30(%eax),%edx
c01022b2:	31 ff                	xor    %edi,%edi
c01022b4:	c7 85 40 ff ff ff 00 	movl   $0x0,-0xc0(%ebp)
c01022bb:	00 00 00 
c01022be:	66 90                	xchg   %ax,%ax
c01022c0:	8d 04 bf             	lea    (%edi,%edi,4),%eax
c01022c3:	83 c1 01             	add    $0x1,%ecx
c01022c6:	8d 3c 42             	lea    (%edx,%eax,2),%edi
c01022c9:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
c01022cd:	8d 50 d0             	lea    -0x30(%eax),%edx
c01022d0:	83 fa 09             	cmp    $0x9,%edx
c01022d3:	76 eb                	jbe    c01022c0 <_svfprintf_r+0x4c0>
c01022d5:	89 bd 40 ff ff ff    	mov    %edi,-0xc0(%ebp)
c01022db:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c01022e1:	e9 4d fc ff ff       	jmp    c0101f33 <_svfprintf_r+0x133>
c01022e6:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c01022ed:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01022f4:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01022fa:	8b 45 14             	mov    0x14(%ebp),%eax
c01022fd:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102300:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0102306:	0f 85 61 02 00 00    	jne    c010256d <_svfprintf_r+0x76d>
c010230c:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c0102313:	0f 84 54 02 00 00    	je     c010256d <_svfprintf_r+0x76d>
c0102319:	0f bf 08             	movswl (%eax),%ecx
c010231c:	83 c0 04             	add    $0x4,%eax
c010231f:	89 45 14             	mov    %eax,0x14(%ebp)
c0102322:	85 c9                	test   %ecx,%ecx
c0102324:	0f 88 53 02 00 00    	js     c010257d <_svfprintf_r+0x77d>
c010232a:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102331:	b8 01 00 00 00       	mov    $0x1,%eax
c0102336:	e9 ae fe ff ff       	jmp    c01021e9 <_svfprintf_r+0x3e9>
c010233b:	f6 85 4c ff ff ff 08 	testb  $0x8,-0xb4(%ebp)
c0102342:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102348:	8b 45 14             	mov    0x14(%ebp),%eax
c010234b:	89 4d 10             	mov    %ecx,0x10(%ebp)
c010234e:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0102354:	0f 84 15 10 00 00    	je     c010336f <_svfprintf_r+0x156f>
c010235a:	db 28                	fldt   (%eax)
c010235c:	83 c0 0c             	add    $0xc,%eax
c010235f:	89 45 14             	mov    %eax,0x14(%ebp)
c0102362:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c0102368:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c010236e:	dd 1c 24             	fstpl  (%esp)
c0102371:	e8 aa 44 00 00       	call   c0106820 <__fpclassifyd>
c0102376:	83 f8 01             	cmp    $0x1,%eax
c0102379:	0f 85 82 0f 00 00    	jne    c0103301 <_svfprintf_r+0x1501>
c010237f:	d9 ee                	fldz   
c0102381:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102387:	d9 c9                	fxch   %st(1)
c0102389:	df e9                	fucomip %st(1),%st
c010238b:	dd d8                	fstp   %st(0)
c010238d:	0f 87 59 15 00 00    	ja     c01038ec <_svfprintf_r+0x1aec>
c0102393:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010239a:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c01023a1:	ba fa 8d 10 c0       	mov    $0xc0108dfa,%edx
c01023a6:	b8 fe 8d 10 c0       	mov    $0xc0108dfe,%eax
c01023ab:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c01023b2:	00 00 00 
c01023b5:	0f 4e c2             	cmovle %edx,%eax
c01023b8:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c01023be:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c01023c5:	ff ff ff 
c01023c8:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c01023cf:	00 00 00 
c01023d2:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01023d9:	00 00 00 
c01023dc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01023e3:	00 00 00 
c01023e6:	e9 ad fc ff ff       	jmp    c0102098 <_svfprintf_r+0x298>
c01023eb:	8d 41 01             	lea    0x1(%ecx),%eax
c01023ee:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c01023f4:	0f be 01             	movsbl (%ecx),%eax
c01023f7:	83 f8 2a             	cmp    $0x2a,%eax
c01023fa:	0f 84 84 18 00 00    	je     c0103c84 <_svfprintf_r+0x1e84>
c0102400:	8d 50 d0             	lea    -0x30(%eax),%edx
c0102403:	31 c9                	xor    %ecx,%ecx
c0102405:	83 fa 09             	cmp    $0x9,%edx
c0102408:	0f 87 a8 16 00 00    	ja     c0103ab6 <_svfprintf_r+0x1cb6>
c010240e:	89 bd 44 ff ff ff    	mov    %edi,-0xbc(%ebp)
c0102414:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c010241a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102420:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
c0102423:	83 c7 01             	add    $0x1,%edi
c0102426:	8d 0c 42             	lea    (%edx,%eax,2),%ecx
c0102429:	0f be 47 ff          	movsbl -0x1(%edi),%eax
c010242d:	8d 50 d0             	lea    -0x30(%eax),%edx
c0102430:	83 fa 09             	cmp    $0x9,%edx
c0102433:	76 eb                	jbe    c0102420 <_svfprintf_r+0x620>
c0102435:	85 c9                	test   %ecx,%ecx
c0102437:	89 ca                	mov    %ecx,%edx
c0102439:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c010243e:	0f 48 d1             	cmovs  %ecx,%edx
c0102441:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102447:	8b bd 44 ff ff ff    	mov    -0xbc(%ebp),%edi
c010244d:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0102453:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0102459:	e9 d5 fa ff ff       	jmp    c0101f33 <_svfprintf_r+0x133>
c010245e:	8b 45 14             	mov    0x14(%ebp),%eax
c0102461:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102464:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c010246b:	8b 08                	mov    (%eax),%ecx
c010246d:	83 c0 04             	add    $0x4,%eax
c0102470:	89 45 14             	mov    %eax,0x14(%ebp)
c0102473:	b8 02 00 00 00       	mov    $0x2,%eax
c0102478:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c010247f:	c6 85 5b ff ff ff 78 	movb   $0x78,-0xa5(%ebp)
c0102486:	c7 85 18 ff ff ff 1b 	movl   $0xc0108e1b,-0xe8(%ebp)
c010248d:	8e 10 c0 
c0102490:	c7 85 24 ff ff ff 78 	movl   $0x78,-0xdc(%ebp)
c0102497:	00 00 00 
c010249a:	e9 41 fd ff ff       	jmp    c01021e0 <_svfprintf_r+0x3e0>
c010249f:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01024a6:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01024ac:	8b 45 14             	mov    0x14(%ebp),%eax
c01024af:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01024b2:	0f 85 87 00 00 00    	jne    c010253f <_svfprintf_r+0x73f>
c01024b8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01024bf:	74 7e                	je     c010253f <_svfprintf_r+0x73f>
c01024c1:	0f b7 08             	movzwl (%eax),%ecx
c01024c4:	83 c0 04             	add    $0x4,%eax
c01024c7:	89 45 14             	mov    %eax,0x14(%ebp)
c01024ca:	31 c0                	xor    %eax,%eax
c01024cc:	e9 0f fd ff ff       	jmp    c01021e0 <_svfprintf_r+0x3e0>
c01024d1:	83 8d 4c ff ff ff 08 	orl    $0x8,-0xb4(%ebp)
c01024d8:	89 c8                	mov    %ecx,%eax
c01024da:	e9 4e fa ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c01024df:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01024e6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01024e9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c01024ef:	0f 85 97 0b 00 00    	jne    c010308c <_svfprintf_r+0x128c>
c01024f5:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01024fc:	0f 84 8a 0b 00 00    	je     c010308c <_svfprintf_r+0x128c>
c0102502:	8b 45 14             	mov    0x14(%ebp),%eax
c0102505:	0f b7 95 34 ff ff ff 	movzwl -0xcc(%ebp),%edx
c010250c:	8b 00                	mov    (%eax),%eax
c010250e:	66 89 10             	mov    %dx,(%eax)
c0102511:	8b 45 14             	mov    0x14(%ebp),%eax
c0102514:	83 c0 04             	add    $0x4,%eax
c0102517:	89 45 14             	mov    %eax,0x14(%ebp)
c010251a:	e9 7c f9 ff ff       	jmp    c0101e9b <_svfprintf_r+0x9b>
c010251f:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c0102526:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010252d:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102533:	8b 45 14             	mov    0x14(%ebp),%eax
c0102536:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102539:	0f 84 79 ff ff ff    	je     c01024b8 <_svfprintf_r+0x6b8>
c010253f:	8b 08                	mov    (%eax),%ecx
c0102541:	83 c0 04             	add    $0x4,%eax
c0102544:	89 45 14             	mov    %eax,0x14(%ebp)
c0102547:	31 c0                	xor    %eax,%eax
c0102549:	e9 92 fc ff ff       	jmp    c01021e0 <_svfprintf_r+0x3e0>
c010254e:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c0102555:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c010255b:	8b 45 14             	mov    0x14(%ebp),%eax
c010255e:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102561:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c0102567:	0f 84 9f fd ff ff    	je     c010230c <_svfprintf_r+0x50c>
c010256d:	8b 08                	mov    (%eax),%ecx
c010256f:	83 c0 04             	add    $0x4,%eax
c0102572:	89 45 14             	mov    %eax,0x14(%ebp)
c0102575:	85 c9                	test   %ecx,%ecx
c0102577:	0f 89 ad fd ff ff    	jns    c010232a <_svfprintf_r+0x52a>
c010257d:	f7 d9                	neg    %ecx
c010257f:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c0102584:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c010258b:	b8 01 00 00 00       	mov    $0x1,%eax
c0102590:	e9 54 fc ff ff       	jmp    c01021e9 <_svfprintf_r+0x3e9>
c0102595:	83 8d 4c ff ff ff 40 	orl    $0x40,-0xb4(%ebp)
c010259c:	89 c8                	mov    %ecx,%eax
c010259e:	e9 8a f9 ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c01025a3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01025aa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01025b0:	8b 45 14             	mov    0x14(%ebp),%eax
c01025b3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01025b6:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c01025bc:	c7 85 18 ff ff ff 1b 	movl   $0xc0108e1b,-0xe8(%ebp)
c01025c3:	8e 10 c0 
c01025c6:	75 71                	jne    c0102639 <_svfprintf_r+0x839>
c01025c8:	f6 85 4c ff ff ff 40 	testb  $0x40,-0xb4(%ebp)
c01025cf:	74 68                	je     c0102639 <_svfprintf_r+0x839>
c01025d1:	0f b7 08             	movzwl (%eax),%ecx
c01025d4:	83 c0 04             	add    $0x4,%eax
c01025d7:	89 45 14             	mov    %eax,0x14(%ebp)
c01025da:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01025e1:	b8 02 00 00 00       	mov    $0x2,%eax
c01025e6:	0f 84 f4 fb ff ff    	je     c01021e0 <_svfprintf_r+0x3e0>
c01025ec:	85 c9                	test   %ecx,%ecx
c01025ee:	0f 84 ec fb ff ff    	je     c01021e0 <_svfprintf_r+0x3e0>
c01025f4:	0f b6 95 24 ff ff ff 	movzbl -0xdc(%ebp),%edx
c01025fb:	c6 85 5a ff ff ff 30 	movb   $0x30,-0xa6(%ebp)
c0102602:	83 8d 4c ff ff ff 02 	orl    $0x2,-0xb4(%ebp)
c0102609:	88 95 5b ff ff ff    	mov    %dl,-0xa5(%ebp)
c010260f:	e9 cc fb ff ff       	jmp    c01021e0 <_svfprintf_r+0x3e0>
c0102614:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c010261b:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102621:	8b 45 14             	mov    0x14(%ebp),%eax
c0102624:	89 4d 10             	mov    %ecx,0x10(%ebp)
c0102627:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c010262d:	c7 85 18 ff ff ff 0a 	movl   $0xc0108e0a,-0xe8(%ebp)
c0102634:	8e 10 c0 
c0102637:	74 8f                	je     c01025c8 <_svfprintf_r+0x7c8>
c0102639:	8b 08                	mov    (%eax),%ecx
c010263b:	83 c0 04             	add    $0x4,%eax
c010263e:	89 45 14             	mov    %eax,0x14(%ebp)
c0102641:	eb 97                	jmp    c01025da <_svfprintf_r+0x7da>
c0102643:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c0102649:	8b 45 14             	mov    0x14(%ebp),%eax
c010264c:	89 4d 10             	mov    %ecx,0x10(%ebp)
c010264f:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c0102656:	8b 00                	mov    (%eax),%eax
c0102658:	88 45 80             	mov    %al,-0x80(%ebp)
c010265b:	8b 45 14             	mov    0x14(%ebp),%eax
c010265e:	83 c0 04             	add    $0x4,%eax
c0102661:	89 45 14             	mov    %eax,0x14(%ebp)
c0102664:	8d 45 80             	lea    -0x80(%ebp),%eax
c0102667:	31 db                	xor    %ebx,%ebx
c0102669:	c7 85 48 ff ff ff 01 	movl   $0x1,-0xb8(%ebp)
c0102670:	00 00 00 
c0102673:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c010267a:	00 00 00 
c010267d:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0102684:	00 00 00 
c0102687:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c010268e:	00 00 00 
c0102691:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102697:	e9 07 fa ff ff       	jmp    c01020a3 <_svfprintf_r+0x2a3>
c010269c:	83 8d 4c ff ff ff 10 	orl    $0x10,-0xb4(%ebp)
c01026a3:	f6 85 4c ff ff ff 10 	testb  $0x10,-0xb4(%ebp)
c01026aa:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01026b0:	8b 45 14             	mov    0x14(%ebp),%eax
c01026b3:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01026b6:	0f 84 03 fb ff ff    	je     c01021bf <_svfprintf_r+0x3bf>
c01026bc:	8b 08                	mov    (%eax),%ecx
c01026be:	83 c0 04             	add    $0x4,%eax
c01026c1:	89 45 14             	mov    %eax,0x14(%ebp)
c01026c4:	b8 01 00 00 00       	mov    $0x1,%eax
c01026c9:	e9 12 fb ff ff       	jmp    c01021e0 <_svfprintf_r+0x3e0>
c01026ce:	85 c0                	test   %eax,%eax
c01026d0:	89 85 24 ff ff ff    	mov    %eax,-0xdc(%ebp)
c01026d6:	89 4d 10             	mov    %ecx,0x10(%ebp)
c01026d9:	88 9d 59 ff ff ff    	mov    %bl,-0xa7(%ebp)
c01026df:	0f 84 c3 f8 ff ff    	je     c0101fa8 <_svfprintf_r+0x1a8>
c01026e5:	88 45 80             	mov    %al,-0x80(%ebp)
c01026e8:	c6 85 59 ff ff ff 00 	movb   $0x0,-0xa7(%ebp)
c01026ef:	e9 70 ff ff ff       	jmp    c0102664 <_svfprintf_r+0x864>
c01026f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01026f8:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01026fe:	84 db                	test   %bl,%bl
c0102700:	74 33                	je     c0102735 <_svfprintf_r+0x935>
c0102702:	8d 85 59 ff ff ff    	lea    -0xa7(%ebp),%eax
c0102708:	83 c1 01             	add    $0x1,%ecx
c010270b:	89 07                	mov    %eax,(%edi)
c010270d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102713:	83 c7 08             	add    $0x8,%edi
c0102716:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c010271d:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102723:	83 c0 01             	add    $0x1,%eax
c0102726:	83 f8 07             	cmp    $0x7,%eax
c0102729:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010272f:	0f 8f 7b 06 00 00    	jg     c0102db0 <_svfprintf_r+0xfb0>
c0102735:	8b 9d 30 ff ff ff    	mov    -0xd0(%ebp),%ebx
c010273b:	85 db                	test   %ebx,%ebx
c010273d:	74 33                	je     c0102772 <_svfprintf_r+0x972>
c010273f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0102745:	83 c1 02             	add    $0x2,%ecx
c0102748:	89 07                	mov    %eax,(%edi)
c010274a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102750:	83 c7 08             	add    $0x8,%edi
c0102753:	c7 47 fc 02 00 00 00 	movl   $0x2,-0x4(%edi)
c010275a:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102760:	83 c0 01             	add    $0x1,%eax
c0102763:	83 f8 07             	cmp    $0x7,%eax
c0102766:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010276c:	0f 8f 06 06 00 00    	jg     c0102d78 <_svfprintf_r+0xf78>
c0102772:	81 bd 2c ff ff ff 80 	cmpl   $0x80,-0xd4(%ebp)
c0102779:	00 00 00 
c010277c:	0f 84 c6 03 00 00    	je     c0102b48 <_svfprintf_r+0xd48>
c0102782:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0102788:	2b b5 38 ff ff ff    	sub    -0xc8(%ebp),%esi
c010278e:	85 f6                	test   %esi,%esi
c0102790:	0f 8e d2 00 00 00    	jle    c0102868 <_svfprintf_r+0xa68>
c0102796:	83 fe 10             	cmp    $0x10,%esi
c0102799:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010279f:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01027a5:	7f 11                	jg     c01027b8 <_svfprintf_r+0x9b8>
c01027a7:	eb 6b                	jmp    c0102814 <_svfprintf_r+0xa14>
c01027a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01027b0:	83 ee 10             	sub    $0x10,%esi
c01027b3:	83 fe 10             	cmp    $0x10,%esi
c01027b6:	7e 5c                	jle    c0102814 <_svfprintf_r+0xa14>
c01027b8:	83 c0 01             	add    $0x1,%eax
c01027bb:	83 c1 10             	add    $0x10,%ecx
c01027be:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c01027c4:	83 c7 08             	add    $0x8,%edi
c01027c7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01027ce:	83 f8 07             	cmp    $0x7,%eax
c01027d1:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01027d7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01027dd:	7e d1                	jle    c01027b0 <_svfprintf_r+0x9b0>
c01027df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027e2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01027e6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01027ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01027ed:	89 04 24             	mov    %eax,(%esp)
c01027f0:	e8 1b 41 00 00       	call   c0106910 <__ssprint_r>
c01027f5:	85 c0                	test   %eax,%eax
c01027f7:	0f 85 d3 f7 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01027fd:	83 ee 10             	sub    $0x10,%esi
c0102800:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102806:	83 fe 10             	cmp    $0x10,%esi
c0102809:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010280f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102812:	7f a4                	jg     c01027b8 <_svfprintf_r+0x9b8>
c0102814:	83 c0 01             	add    $0x1,%eax
c0102817:	01 f1                	add    %esi,%ecx
c0102819:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c010281f:	83 c7 08             	add    $0x8,%edi
c0102822:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102825:	83 f8 07             	cmp    $0x7,%eax
c0102828:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010282e:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102834:	7e 32                	jle    c0102868 <_svfprintf_r+0xa68>
c0102836:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010283c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102840:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102843:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102847:	8b 45 08             	mov    0x8(%ebp),%eax
c010284a:	89 04 24             	mov    %eax,(%esp)
c010284d:	e8 be 40 00 00       	call   c0106910 <__ssprint_r>
c0102852:	85 c0                	test   %eax,%eax
c0102854:	0f 85 76 f7 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010285a:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102860:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102863:	90                   	nop
c0102864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102868:	f7 85 4c ff ff ff 00 	testl  $0x100,-0xb4(%ebp)
c010286f:	01 00 00 
c0102872:	0f 85 50 01 00 00    	jne    c01029c8 <_svfprintf_r+0xbc8>
c0102878:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c010287e:	89 07                	mov    %eax,(%edi)
c0102880:	8b 85 38 ff ff ff    	mov    -0xc8(%ebp),%eax
c0102886:	01 c1                	add    %eax,%ecx
c0102888:	89 47 04             	mov    %eax,0x4(%edi)
c010288b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102891:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102897:	83 c0 01             	add    $0x1,%eax
c010289a:	83 f8 07             	cmp    $0x7,%eax
c010289d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01028a3:	0f 8f 6a 04 00 00    	jg     c0102d13 <_svfprintf_r+0xf13>
c01028a9:	83 c7 08             	add    $0x8,%edi
c01028ac:	f6 85 4c ff ff ff 04 	testb  $0x4,-0xb4(%ebp)
c01028b3:	0f 84 d7 00 00 00    	je     c0102990 <_svfprintf_r+0xb90>
c01028b9:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c01028bf:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c01028c5:	85 f6                	test   %esi,%esi
c01028c7:	0f 8e c3 00 00 00    	jle    c0102990 <_svfprintf_r+0xb90>
c01028cd:	83 fe 10             	cmp    $0x10,%esi
c01028d0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01028d6:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01028dc:	7f 0a                	jg     c01028e8 <_svfprintf_r+0xae8>
c01028de:	eb 64                	jmp    c0102944 <_svfprintf_r+0xb44>
c01028e0:	83 ee 10             	sub    $0x10,%esi
c01028e3:	83 fe 10             	cmp    $0x10,%esi
c01028e6:	7e 5c                	jle    c0102944 <_svfprintf_r+0xb44>
c01028e8:	83 c0 01             	add    $0x1,%eax
c01028eb:	83 c1 10             	add    $0x10,%ecx
c01028ee:	c7 07 a8 8f 10 c0    	movl   $0xc0108fa8,(%edi)
c01028f4:	83 c7 08             	add    $0x8,%edi
c01028f7:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01028fe:	83 f8 07             	cmp    $0x7,%eax
c0102901:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102907:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010290d:	7e d1                	jle    c01028e0 <_svfprintf_r+0xae0>
c010290f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102912:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102916:	89 44 24 04          	mov    %eax,0x4(%esp)
c010291a:	8b 45 08             	mov    0x8(%ebp),%eax
c010291d:	89 04 24             	mov    %eax,(%esp)
c0102920:	e8 eb 3f 00 00       	call   c0106910 <__ssprint_r>
c0102925:	85 c0                	test   %eax,%eax
c0102927:	0f 85 a3 f6 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010292d:	83 ee 10             	sub    $0x10,%esi
c0102930:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102936:	83 fe 10             	cmp    $0x10,%esi
c0102939:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010293f:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102942:	7f a4                	jg     c01028e8 <_svfprintf_r+0xae8>
c0102944:	83 c0 01             	add    $0x1,%eax
c0102947:	01 f1                	add    %esi,%ecx
c0102949:	83 f8 07             	cmp    $0x7,%eax
c010294c:	c7 07 a8 8f 10 c0    	movl   $0xc0108fa8,(%edi)
c0102952:	89 77 04             	mov    %esi,0x4(%edi)
c0102955:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010295b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102961:	7e 2d                	jle    c0102990 <_svfprintf_r+0xb90>
c0102963:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102969:	89 44 24 08          	mov    %eax,0x8(%esp)
c010296d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102970:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102974:	8b 45 08             	mov    0x8(%ebp),%eax
c0102977:	89 04 24             	mov    %eax,(%esp)
c010297a:	e8 91 3f 00 00       	call   c0106910 <__ssprint_r>
c010297f:	85 c0                	test   %eax,%eax
c0102981:	0f 85 49 f6 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102987:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010298d:	8d 76 00             	lea    0x0(%esi),%esi
c0102990:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
c0102996:	8b 95 48 ff ff ff    	mov    -0xb8(%ebp),%edx
c010299c:	39 c2                	cmp    %eax,%edx
c010299e:	0f 4d c2             	cmovge %edx,%eax
c01029a1:	01 85 34 ff ff ff    	add    %eax,-0xcc(%ebp)
c01029a7:	85 c9                	test   %ecx,%ecx
c01029a9:	0f 85 99 03 00 00    	jne    c0102d48 <_svfprintf_r+0xf48>
c01029af:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01029b6:	00 00 00 
c01029b9:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01029bc:	e9 da f4 ff ff       	jmp    c0101e9b <_svfprintf_r+0x9b>
c01029c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01029c8:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c01029cf:	0f 8e 5b 02 00 00    	jle    c0102c30 <_svfprintf_r+0xe30>
c01029d5:	d9 ee                	fldz   
c01029d7:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01029dd:	df e9                	fucomip %st(1),%st
c01029df:	dd d8                	fstp   %st(0)
c01029e1:	0f 8a 59 04 00 00    	jp     c0102e40 <_svfprintf_r+0x1040>
c01029e7:	0f 85 53 04 00 00    	jne    c0102e40 <_svfprintf_r+0x1040>
c01029ed:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01029f3:	83 c1 01             	add    $0x1,%ecx
c01029f6:	83 c7 08             	add    $0x8,%edi
c01029f9:	c7 47 f8 c9 85 10 c0 	movl   $0xc01085c9,-0x8(%edi)
c0102a00:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c0102a07:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102a0d:	83 c0 01             	add    $0x1,%eax
c0102a10:	83 f8 07             	cmp    $0x7,%eax
c0102a13:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a19:	0f 8f 63 09 00 00    	jg     c0103382 <_svfprintf_r+0x1582>
c0102a1f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102a25:	39 85 5c ff ff ff    	cmp    %eax,-0xa4(%ebp)
c0102a2b:	7c 0d                	jl     c0102a3a <_svfprintf_r+0xc3a>
c0102a2d:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102a34:	0f 84 72 fe ff ff    	je     c01028ac <_svfprintf_r+0xaac>
c0102a3a:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0102a40:	83 c7 08             	add    $0x8,%edi
c0102a43:	89 47 f8             	mov    %eax,-0x8(%edi)
c0102a46:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0102a4c:	89 47 fc             	mov    %eax,-0x4(%edi)
c0102a4f:	01 c1                	add    %eax,%ecx
c0102a51:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a57:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102a5d:	83 c0 01             	add    $0x1,%eax
c0102a60:	83 f8 07             	cmp    $0x7,%eax
c0102a63:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102a69:	0f 8f dc 0b 00 00    	jg     c010364b <_svfprintf_r+0x184b>
c0102a6f:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102a75:	8d 70 ff             	lea    -0x1(%eax),%esi
c0102a78:	85 f6                	test   %esi,%esi
c0102a7a:	0f 8e 2c fe ff ff    	jle    c01028ac <_svfprintf_r+0xaac>
c0102a80:	83 fe 10             	cmp    $0x10,%esi
c0102a83:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102a89:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102a8f:	7f 13                	jg     c0102aa4 <_svfprintf_r+0xca4>
c0102a91:	e9 e6 05 00 00       	jmp    c010307c <_svfprintf_r+0x127c>
c0102a96:	66 90                	xchg   %ax,%ax
c0102a98:	83 ee 10             	sub    $0x10,%esi
c0102a9b:	83 fe 10             	cmp    $0x10,%esi
c0102a9e:	0f 8e d8 05 00 00    	jle    c010307c <_svfprintf_r+0x127c>
c0102aa4:	83 c0 01             	add    $0x1,%eax
c0102aa7:	83 c1 10             	add    $0x10,%ecx
c0102aaa:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0102ab0:	83 c7 08             	add    $0x8,%edi
c0102ab3:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102aba:	83 f8 07             	cmp    $0x7,%eax
c0102abd:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102ac3:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102ac9:	7e cd                	jle    c0102a98 <_svfprintf_r+0xc98>
c0102acb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ace:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102ad2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ad9:	89 04 24             	mov    %eax,(%esp)
c0102adc:	e8 2f 3e 00 00       	call   c0106910 <__ssprint_r>
c0102ae1:	85 c0                	test   %eax,%eax
c0102ae3:	0f 85 e7 f4 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102ae9:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102aef:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102af2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102af8:	eb 9e                	jmp    c0102a98 <_svfprintf_r+0xc98>
c0102afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102b00:	84 c0                	test   %al,%al
c0102b02:	75 2c                	jne    c0102b30 <_svfprintf_r+0xd30>
c0102b04:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102b0b:	74 23                	je     c0102b30 <_svfprintf_r+0xd30>
c0102b0d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102b13:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c0102b17:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102b1d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102b20:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102b26:	e9 2d f7 ff ff       	jmp    c0102258 <_svfprintf_r+0x458>
c0102b2b:	90                   	nop
c0102b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102b30:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102b33:	c7 85 38 ff ff ff 00 	movl   $0x0,-0xc8(%ebp)
c0102b3a:	00 00 00 
c0102b3d:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102b43:	e9 10 f7 ff ff       	jmp    c0102258 <_svfprintf_r+0x458>
c0102b48:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
c0102b4e:	2b b5 48 ff ff ff    	sub    -0xb8(%ebp),%esi
c0102b54:	85 f6                	test   %esi,%esi
c0102b56:	0f 8e 26 fc ff ff    	jle    c0102782 <_svfprintf_r+0x982>
c0102b5c:	83 fe 10             	cmp    $0x10,%esi
c0102b5f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102b65:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102b6b:	7f 0b                	jg     c0102b78 <_svfprintf_r+0xd78>
c0102b6d:	eb 65                	jmp    c0102bd4 <_svfprintf_r+0xdd4>
c0102b6f:	90                   	nop
c0102b70:	83 ee 10             	sub    $0x10,%esi
c0102b73:	83 fe 10             	cmp    $0x10,%esi
c0102b76:	7e 5c                	jle    c0102bd4 <_svfprintf_r+0xdd4>
c0102b78:	83 c0 01             	add    $0x1,%eax
c0102b7b:	83 c1 10             	add    $0x10,%ecx
c0102b7e:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0102b84:	83 c7 08             	add    $0x8,%edi
c0102b87:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102b8e:	83 f8 07             	cmp    $0x7,%eax
c0102b91:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102b97:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102b9d:	7e d1                	jle    c0102b70 <_svfprintf_r+0xd70>
c0102b9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ba2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102ba6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102baa:	8b 45 08             	mov    0x8(%ebp),%eax
c0102bad:	89 04 24             	mov    %eax,(%esp)
c0102bb0:	e8 5b 3d 00 00       	call   c0106910 <__ssprint_r>
c0102bb5:	85 c0                	test   %eax,%eax
c0102bb7:	0f 85 13 f4 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102bbd:	83 ee 10             	sub    $0x10,%esi
c0102bc0:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102bc6:	83 fe 10             	cmp    $0x10,%esi
c0102bc9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102bcf:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102bd2:	7f a4                	jg     c0102b78 <_svfprintf_r+0xd78>
c0102bd4:	83 c0 01             	add    $0x1,%eax
c0102bd7:	01 f1                	add    %esi,%ecx
c0102bd9:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0102bdf:	83 c7 08             	add    $0x8,%edi
c0102be2:	89 77 fc             	mov    %esi,-0x4(%edi)
c0102be5:	83 f8 07             	cmp    $0x7,%eax
c0102be8:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102bee:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102bf4:	0f 8e 88 fb ff ff    	jle    c0102782 <_svfprintf_r+0x982>
c0102bfa:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102c00:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102c04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102c07:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102c0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0102c0e:	89 04 24             	mov    %eax,(%esp)
c0102c11:	e8 fa 3c 00 00       	call   c0106910 <__ssprint_r>
c0102c16:	85 c0                	test   %eax,%eax
c0102c18:	0f 85 b2 f3 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102c1e:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102c24:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102c27:	e9 56 fb ff ff       	jmp    c0102782 <_svfprintf_r+0x982>
c0102c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102c30:	83 bd 1c ff ff ff 01 	cmpl   $0x1,-0xe4(%ebp)
c0102c37:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c0102c3d:	0f 8e df 05 00 00    	jle    c0103222 <_svfprintf_r+0x1422>
c0102c43:	89 07                	mov    %eax,(%edi)
c0102c45:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102c4b:	8d 51 01             	lea    0x1(%ecx),%edx
c0102c4e:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0102c55:	83 c7 08             	add    $0x8,%edi
c0102c58:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102c5e:	83 c0 01             	add    $0x1,%eax
c0102c61:	83 f8 07             	cmp    $0x7,%eax
c0102c64:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c6a:	0f 8f 59 06 00 00    	jg     c01032c9 <_svfprintf_r+0x14c9>
c0102c70:	8b 9d 0c ff ff ff    	mov    -0xf4(%ebp),%ebx
c0102c76:	83 c0 01             	add    $0x1,%eax
c0102c79:	83 c7 08             	add    $0x8,%edi
c0102c7c:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102c82:	89 5f f8             	mov    %ebx,-0x8(%edi)
c0102c85:	8b 9d 08 ff ff ff    	mov    -0xf8(%ebp),%ebx
c0102c8b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0102c8e:	01 da                	add    %ebx,%edx
c0102c90:	83 f8 07             	cmp    $0x7,%eax
c0102c93:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102c99:	0f 8f f2 05 00 00    	jg     c0103291 <_svfprintf_r+0x1491>
c0102c9f:	d9 ee                	fldz   
c0102ca1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0102ca7:	df e9                	fucomip %st(1),%st
c0102ca9:	dd d8                	fstp   %st(0)
c0102cab:	7a 06                	jp     c0102cb3 <_svfprintf_r+0xeb3>
c0102cad:	0f 84 33 03 00 00    	je     c0102fe6 <_svfprintf_r+0x11e6>
c0102cb3:	8b 8d 28 ff ff ff    	mov    -0xd8(%ebp),%ecx
c0102cb9:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102cbf:	83 c1 01             	add    $0x1,%ecx
c0102cc2:	89 0f                	mov    %ecx,(%edi)
c0102cc4:	8d 4b ff             	lea    -0x1(%ebx),%ecx
c0102cc7:	89 4f 04             	mov    %ecx,0x4(%edi)
c0102cca:	01 ca                	add    %ecx,%edx
c0102ccc:	83 c0 01             	add    $0x1,%eax
c0102ccf:	83 f8 07             	cmp    $0x7,%eax
c0102cd2:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0102cd8:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102cde:	0f 8f 75 05 00 00    	jg     c0103259 <_svfprintf_r+0x1459>
c0102ce4:	83 c7 08             	add    $0x8,%edi
c0102ce7:	8b 9d 04 ff ff ff    	mov    -0xfc(%ebp),%ebx
c0102ced:	8d 8d 65 ff ff ff    	lea    -0x9b(%ebp),%ecx
c0102cf3:	89 0f                	mov    %ecx,(%edi)
c0102cf5:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102cf8:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
c0102cfb:	83 c0 01             	add    $0x1,%eax
c0102cfe:	83 f8 07             	cmp    $0x7,%eax
c0102d01:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102d07:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102d0d:	0f 8e 96 fb ff ff    	jle    c01028a9 <_svfprintf_r+0xaa9>
c0102d13:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102d19:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d1d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d20:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d24:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d27:	89 04 24             	mov    %eax,(%esp)
c0102d2a:	e8 e1 3b 00 00       	call   c0106910 <__ssprint_r>
c0102d2f:	85 c0                	test   %eax,%eax
c0102d31:	0f 85 99 f2 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102d37:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102d3d:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102d40:	e9 67 fb ff ff       	jmp    c01028ac <_svfprintf_r+0xaac>
c0102d45:	8d 76 00             	lea    0x0(%esi),%esi
c0102d48:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102d4e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d55:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d59:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d5c:	89 04 24             	mov    %eax,(%esp)
c0102d5f:	e8 ac 3b 00 00       	call   c0106910 <__ssprint_r>
c0102d64:	85 c0                	test   %eax,%eax
c0102d66:	0f 84 43 fc ff ff    	je     c01029af <_svfprintf_r+0xbaf>
c0102d6c:	e9 5f f2 ff ff       	jmp    c0101fd0 <_svfprintf_r+0x1d0>
c0102d71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0102d78:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102d7e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102d82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102d85:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102d89:	8b 45 08             	mov    0x8(%ebp),%eax
c0102d8c:	89 04 24             	mov    %eax,(%esp)
c0102d8f:	e8 7c 3b 00 00       	call   c0106910 <__ssprint_r>
c0102d94:	85 c0                	test   %eax,%eax
c0102d96:	0f 85 34 f2 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102d9c:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102da2:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102da5:	e9 c8 f9 ff ff       	jmp    c0102772 <_svfprintf_r+0x972>
c0102daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102db0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102db6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102dba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102dbd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102dc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0102dc4:	89 04 24             	mov    %eax,(%esp)
c0102dc7:	e8 44 3b 00 00       	call   c0106910 <__ssprint_r>
c0102dcc:	85 c0                	test   %eax,%eax
c0102dce:	0f 85 fc f1 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102dd4:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102dda:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102ddd:	e9 53 f9 ff ff       	jmp    c0102735 <_svfprintf_r+0x935>
c0102de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102de8:	89 c2                	mov    %eax,%edx
c0102dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102df0:	89 c8                	mov    %ecx,%eax
c0102df2:	83 ea 01             	sub    $0x1,%edx
c0102df5:	83 e0 07             	and    $0x7,%eax
c0102df8:	c1 e9 03             	shr    $0x3,%ecx
c0102dfb:	83 c0 30             	add    $0x30,%eax
c0102dfe:	85 c9                	test   %ecx,%ecx
c0102e00:	88 02                	mov    %al,(%edx)
c0102e02:	75 ec                	jne    c0102df0 <_svfprintf_r+0xff0>
c0102e04:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0102e0b:	89 95 28 ff ff ff    	mov    %edx,-0xd8(%ebp)
c0102e11:	0f 84 5b 01 00 00    	je     c0102f72 <_svfprintf_r+0x1172>
c0102e17:	3c 30                	cmp    $0x30,%al
c0102e19:	74 0b                	je     c0102e26 <_svfprintf_r+0x1026>
c0102e1b:	83 ad 28 ff ff ff 01 	subl   $0x1,-0xd8(%ebp)
c0102e22:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0102e26:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102e29:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c0102e2f:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102e35:	e9 1e f4 ff ff       	jmp    c0102258 <_svfprintf_r+0x458>
c0102e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102e40:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c0102e46:	85 db                	test   %ebx,%ebx
c0102e48:	0f 8e 66 05 00 00    	jle    c01033b4 <_svfprintf_r+0x15b4>
c0102e4e:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0102e54:	8b 85 1c ff ff ff    	mov    -0xe4(%ebp),%eax
c0102e5a:	01 d0                	add    %edx,%eax
c0102e5c:	89 c3                	mov    %eax,%ebx
c0102e5e:	29 d3                	sub    %edx,%ebx
c0102e60:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c0102e66:	89 d0                	mov    %edx,%eax
c0102e68:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0102e6e:	39 d3                	cmp    %edx,%ebx
c0102e70:	0f 4f da             	cmovg  %edx,%ebx
c0102e73:	85 db                	test   %ebx,%ebx
c0102e75:	7e 28                	jle    c0102e9f <_svfprintf_r+0x109f>
c0102e77:	89 07                	mov    %eax,(%edi)
c0102e79:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102e7f:	01 d9                	add    %ebx,%ecx
c0102e81:	89 5f 04             	mov    %ebx,0x4(%edi)
c0102e84:	83 c7 08             	add    $0x8,%edi
c0102e87:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102e8d:	83 c0 01             	add    $0x1,%eax
c0102e90:	83 f8 07             	cmp    $0x7,%eax
c0102e93:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102e99:	0f 8f 58 09 00 00    	jg     c01037f7 <_svfprintf_r+0x19f7>
c0102e9f:	8b b5 20 ff ff ff    	mov    -0xe0(%ebp),%esi
c0102ea5:	31 c0                	xor    %eax,%eax
c0102ea7:	85 db                	test   %ebx,%ebx
c0102ea9:	0f 49 c3             	cmovns %ebx,%eax
c0102eac:	29 c6                	sub    %eax,%esi
c0102eae:	85 f6                	test   %esi,%esi
c0102eb0:	0f 8e 40 02 00 00    	jle    c01030f6 <_svfprintf_r+0x12f6>
c0102eb6:	83 fe 10             	cmp    $0x10,%esi
c0102eb9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102ebf:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0102ec5:	7f 15                	jg     c0102edc <_svfprintf_r+0x10dc>
c0102ec7:	e9 db 01 00 00       	jmp    c01030a7 <_svfprintf_r+0x12a7>
c0102ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0102ed0:	83 ee 10             	sub    $0x10,%esi
c0102ed3:	83 fe 10             	cmp    $0x10,%esi
c0102ed6:	0f 8e cb 01 00 00    	jle    c01030a7 <_svfprintf_r+0x12a7>
c0102edc:	83 c0 01             	add    $0x1,%eax
c0102edf:	83 c1 10             	add    $0x10,%ecx
c0102ee2:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0102ee8:	83 c7 08             	add    $0x8,%edi
c0102eeb:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0102ef2:	83 f8 07             	cmp    $0x7,%eax
c0102ef5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0102efb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0102f01:	7e cd                	jle    c0102ed0 <_svfprintf_r+0x10d0>
c0102f03:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102f06:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0102f0a:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102f0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f11:	89 04 24             	mov    %eax,(%esp)
c0102f14:	e8 f7 39 00 00       	call   c0106910 <__ssprint_r>
c0102f19:	85 c0                	test   %eax,%eax
c0102f1b:	0f 85 af f0 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102f21:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102f27:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102f2a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0102f30:	eb 9e                	jmp    c0102ed0 <_svfprintf_r+0x10d0>
c0102f32:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102f35:	be cd cc cc cc       	mov    $0xcccccccd,%esi
c0102f3a:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0102f40:	89 c7                	mov    %eax,%edi
c0102f42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102f48:	89 c8                	mov    %ecx,%eax
c0102f4a:	83 ef 01             	sub    $0x1,%edi
c0102f4d:	f7 e6                	mul    %esi
c0102f4f:	c1 ea 03             	shr    $0x3,%edx
c0102f52:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0102f55:	01 c0                	add    %eax,%eax
c0102f57:	29 c1                	sub    %eax,%ecx
c0102f59:	83 c1 30             	add    $0x30,%ecx
c0102f5c:	85 d2                	test   %edx,%edx
c0102f5e:	88 0f                	mov    %cl,(%edi)
c0102f60:	89 d1                	mov    %edx,%ecx
c0102f62:	75 e4                	jne    c0102f48 <_svfprintf_r+0x1148>
c0102f64:	89 fa                	mov    %edi,%edx
c0102f66:	89 bd 28 ff ff ff    	mov    %edi,-0xd8(%ebp)
c0102f6c:	8b bd 48 ff ff ff    	mov    -0xb8(%ebp),%edi
c0102f72:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0102f75:	29 d0                	sub    %edx,%eax
c0102f77:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102f7d:	e9 d6 f2 ff ff       	jmp    c0102258 <_svfprintf_r+0x458>
c0102f82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0102f88:	83 f9 09             	cmp    $0x9,%ecx
c0102f8b:	77 a5                	ja     c0102f32 <_svfprintf_r+0x1132>
c0102f8d:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
c0102f93:	83 c1 30             	add    $0x30,%ecx
c0102f96:	88 4d a7             	mov    %cl,-0x59(%ebp)
c0102f99:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0102f9f:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0102fa2:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0102fa8:	e9 ab f2 ff ff       	jmp    c0102258 <_svfprintf_r+0x458>
c0102fad:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102fb3:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102fb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102fba:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102fbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fc1:	89 04 24             	mov    %eax,(%esp)
c0102fc4:	e8 47 39 00 00       	call   c0106910 <__ssprint_r>
c0102fc9:	85 c0                	test   %eax,%eax
c0102fcb:	0f 85 ff ef ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0102fd1:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0102fd8:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0102fdb:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0102fe1:	e9 18 f7 ff ff       	jmp    c01026fe <_svfprintf_r+0x8fe>
c0102fe6:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0102fec:	8d 73 ff             	lea    -0x1(%ebx),%esi
c0102fef:	85 f6                	test   %esi,%esi
c0102ff1:	0f 8e f0 fc ff ff    	jle    c0102ce7 <_svfprintf_r+0xee7>
c0102ff7:	83 fe 10             	cmp    $0x10,%esi
c0102ffa:	7e 70                	jle    c010306c <_svfprintf_r+0x126c>
c0102ffc:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c0103002:	eb 0c                	jmp    c0103010 <_svfprintf_r+0x1210>
c0103004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103008:	83 ee 10             	sub    $0x10,%esi
c010300b:	83 fe 10             	cmp    $0x10,%esi
c010300e:	7e 5c                	jle    c010306c <_svfprintf_r+0x126c>
c0103010:	83 c0 01             	add    $0x1,%eax
c0103013:	83 c2 10             	add    $0x10,%edx
c0103016:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c010301c:	83 c7 08             	add    $0x8,%edi
c010301f:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c0103026:	83 f8 07             	cmp    $0x7,%eax
c0103029:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010302f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103035:	7e d1                	jle    c0103008 <_svfprintf_r+0x1208>
c0103037:	8b 45 0c             	mov    0xc(%ebp),%eax
c010303a:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010303e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103042:	8b 45 08             	mov    0x8(%ebp),%eax
c0103045:	89 04 24             	mov    %eax,(%esp)
c0103048:	e8 c3 38 00 00       	call   c0106910 <__ssprint_r>
c010304d:	85 c0                	test   %eax,%eax
c010304f:	0f 85 7b ef ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0103055:	83 ee 10             	sub    $0x10,%esi
c0103058:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010305e:	83 fe 10             	cmp    $0x10,%esi
c0103061:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103067:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010306a:	7f a4                	jg     c0103010 <_svfprintf_r+0x1210>
c010306c:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0103072:	01 f2                	add    %esi,%edx
c0103074:	89 77 04             	mov    %esi,0x4(%edi)
c0103077:	e9 50 fc ff ff       	jmp    c0102ccc <_svfprintf_r+0xecc>
c010307c:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0103082:	01 f1                	add    %esi,%ecx
c0103084:	89 77 04             	mov    %esi,0x4(%edi)
c0103087:	e9 6f fc ff ff       	jmp    c0102cfb <_svfprintf_r+0xefb>
c010308c:	8b 45 14             	mov    0x14(%ebp),%eax
c010308f:	8b 95 34 ff ff ff    	mov    -0xcc(%ebp),%edx
c0103095:	8b 00                	mov    (%eax),%eax
c0103097:	89 10                	mov    %edx,(%eax)
c0103099:	8b 45 14             	mov    0x14(%ebp),%eax
c010309c:	83 c0 04             	add    $0x4,%eax
c010309f:	89 45 14             	mov    %eax,0x14(%ebp)
c01030a2:	e9 f4 ed ff ff       	jmp    c0101e9b <_svfprintf_r+0x9b>
c01030a7:	83 c0 01             	add    $0x1,%eax
c01030aa:	01 f1                	add    %esi,%ecx
c01030ac:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c01030b2:	83 c7 08             	add    $0x8,%edi
c01030b5:	89 77 fc             	mov    %esi,-0x4(%edi)
c01030b8:	83 f8 07             	cmp    $0x7,%eax
c01030bb:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01030c1:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01030c7:	7e 2d                	jle    c01030f6 <_svfprintf_r+0x12f6>
c01030c9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01030cf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01030d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01030d6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01030da:	8b 45 08             	mov    0x8(%ebp),%eax
c01030dd:	89 04 24             	mov    %eax,(%esp)
c01030e0:	e8 2b 38 00 00       	call   c0106910 <__ssprint_r>
c01030e5:	85 c0                	test   %eax,%eax
c01030e7:	0f 85 e3 ee ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01030ed:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01030f3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01030f6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01030fc:	8b 95 5c ff ff ff    	mov    -0xa4(%ebp),%edx
c0103102:	03 85 20 ff ff ff    	add    -0xe0(%ebp),%eax
c0103108:	3b 95 1c ff ff ff    	cmp    -0xe4(%ebp),%edx
c010310e:	89 c6                	mov    %eax,%esi
c0103110:	7c 0d                	jl     c010311f <_svfprintf_r+0x131f>
c0103112:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103119:	0f 84 5e 05 00 00    	je     c010367d <_svfprintf_r+0x187d>
c010311f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0103125:	89 07                	mov    %eax,(%edi)
c0103127:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c010312d:	01 c1                	add    %eax,%ecx
c010312f:	89 47 04             	mov    %eax,0x4(%edi)
c0103132:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103138:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c010313e:	83 c0 01             	add    $0x1,%eax
c0103141:	83 f8 07             	cmp    $0x7,%eax
c0103144:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010314a:	0f 8f d9 06 00 00    	jg     c0103829 <_svfprintf_r+0x1a29>
c0103150:	83 c7 08             	add    $0x8,%edi
c0103153:	89 d0                	mov    %edx,%eax
c0103155:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c010315b:	89 f2                	mov    %esi,%edx
c010315d:	29 f3                	sub    %esi,%ebx
c010315f:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c0103165:	29 c6                	sub    %eax,%esi
c0103167:	39 de                	cmp    %ebx,%esi
c0103169:	0f 4e de             	cmovle %esi,%ebx
c010316c:	85 db                	test   %ebx,%ebx
c010316e:	7e 29                	jle    c0103199 <_svfprintf_r+0x1399>
c0103170:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103176:	01 d9                	add    %ebx,%ecx
c0103178:	83 c7 08             	add    $0x8,%edi
c010317b:	89 57 f8             	mov    %edx,-0x8(%edi)
c010317e:	89 5f fc             	mov    %ebx,-0x4(%edi)
c0103181:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c0103187:	83 c0 01             	add    $0x1,%eax
c010318a:	83 f8 07             	cmp    $0x7,%eax
c010318d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103193:	0f 8f c8 06 00 00    	jg     c0103861 <_svfprintf_r+0x1a61>
c0103199:	31 c0                	xor    %eax,%eax
c010319b:	85 db                	test   %ebx,%ebx
c010319d:	0f 49 c3             	cmovns %ebx,%eax
c01031a0:	29 c6                	sub    %eax,%esi
c01031a2:	85 f6                	test   %esi,%esi
c01031a4:	0f 8e 02 f7 ff ff    	jle    c01028ac <_svfprintf_r+0xaac>
c01031aa:	83 fe 10             	cmp    $0x10,%esi
c01031ad:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01031b3:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01031b9:	7f 11                	jg     c01031cc <_svfprintf_r+0x13cc>
c01031bb:	e9 bc fe ff ff       	jmp    c010307c <_svfprintf_r+0x127c>
c01031c0:	83 ee 10             	sub    $0x10,%esi
c01031c3:	83 fe 10             	cmp    $0x10,%esi
c01031c6:	0f 8e b0 fe ff ff    	jle    c010307c <_svfprintf_r+0x127c>
c01031cc:	83 c0 01             	add    $0x1,%eax
c01031cf:	83 c1 10             	add    $0x10,%ecx
c01031d2:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c01031d8:	83 c7 08             	add    $0x8,%edi
c01031db:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c01031e2:	83 f8 07             	cmp    $0x7,%eax
c01031e5:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01031eb:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01031f1:	7e cd                	jle    c01031c0 <_svfprintf_r+0x13c0>
c01031f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01031f6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01031fa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01031fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103201:	89 04 24             	mov    %eax,(%esp)
c0103204:	e8 07 37 00 00       	call   c0106910 <__ssprint_r>
c0103209:	85 c0                	test   %eax,%eax
c010320b:	0f 85 bf ed ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0103211:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103217:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010321a:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103220:	eb 9e                	jmp    c01031c0 <_svfprintf_r+0x13c0>
c0103222:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103229:	0f 85 14 fa ff ff    	jne    c0102c43 <_svfprintf_r+0xe43>
c010322f:	89 07                	mov    %eax,(%edi)
c0103231:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103237:	8d 51 01             	lea    0x1(%ecx),%edx
c010323a:	c7 47 04 01 00 00 00 	movl   $0x1,0x4(%edi)
c0103241:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103247:	83 c0 01             	add    $0x1,%eax
c010324a:	83 f8 07             	cmp    $0x7,%eax
c010324d:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103253:	0f 8e 8b fa ff ff    	jle    c0102ce4 <_svfprintf_r+0xee4>
c0103259:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010325f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103263:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103266:	89 44 24 04          	mov    %eax,0x4(%esp)
c010326a:	8b 45 08             	mov    0x8(%ebp),%eax
c010326d:	89 04 24             	mov    %eax,(%esp)
c0103270:	e8 9b 36 00 00       	call   c0106910 <__ssprint_r>
c0103275:	85 c0                	test   %eax,%eax
c0103277:	0f 85 53 ed ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010327d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0103283:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103286:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010328c:	e9 56 fa ff ff       	jmp    c0102ce7 <_svfprintf_r+0xee7>
c0103291:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103297:	89 44 24 08          	mov    %eax,0x8(%esp)
c010329b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010329e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01032a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01032a5:	89 04 24             	mov    %eax,(%esp)
c01032a8:	e8 63 36 00 00       	call   c0106910 <__ssprint_r>
c01032ad:	85 c0                	test   %eax,%eax
c01032af:	0f 85 1b ed ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01032b5:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01032bb:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01032be:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01032c4:	e9 d6 f9 ff ff       	jmp    c0102c9f <_svfprintf_r+0xe9f>
c01032c9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01032cf:	89 44 24 08          	mov    %eax,0x8(%esp)
c01032d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01032d6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01032da:	8b 45 08             	mov    0x8(%ebp),%eax
c01032dd:	89 04 24             	mov    %eax,(%esp)
c01032e0:	e8 2b 36 00 00       	call   c0106910 <__ssprint_r>
c01032e5:	85 c0                	test   %eax,%eax
c01032e7:	0f 85 e3 ec ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01032ed:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01032f3:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01032f6:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01032fc:	e9 6f f9 ff ff       	jmp    c0102c70 <_svfprintf_r+0xe70>
c0103301:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c0103307:	dd 1c 24             	fstpl  (%esp)
c010330a:	e8 11 35 00 00       	call   c0106820 <__fpclassifyd>
c010330f:	85 c0                	test   %eax,%eax
c0103311:	0f 85 a3 01 00 00    	jne    c01034ba <_svfprintf_r+0x16ba>
c0103317:	83 bd 24 ff ff ff 47 	cmpl   $0x47,-0xdc(%ebp)
c010331e:	ba 02 8e 10 c0       	mov    $0xc0108e02,%edx
c0103323:	b8 06 8e 10 c0       	mov    $0xc0108e06,%eax
c0103328:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c010332f:	c7 85 48 ff ff ff 03 	movl   $0x3,-0xb8(%ebp)
c0103336:	00 00 00 
c0103339:	0f 4e c2             	cmovle %edx,%eax
c010333c:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0103342:	81 a5 4c ff ff ff 7f 	andl   $0xffffff7f,-0xb4(%ebp)
c0103349:	ff ff ff 
c010334c:	c7 85 38 ff ff ff 03 	movl   $0x3,-0xc8(%ebp)
c0103353:	00 00 00 
c0103356:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010335d:	00 00 00 
c0103360:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103367:	00 00 00 
c010336a:	e9 29 ed ff ff       	jmp    c0102098 <_svfprintf_r+0x298>
c010336f:	dd 00                	fldl   (%eax)
c0103371:	83 c0 08             	add    $0x8,%eax
c0103374:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
c010337a:	89 45 14             	mov    %eax,0x14(%ebp)
c010337d:	e9 e6 ef ff ff       	jmp    c0102368 <_svfprintf_r+0x568>
c0103382:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103388:	89 44 24 08          	mov    %eax,0x8(%esp)
c010338c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010338f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103393:	8b 45 08             	mov    0x8(%ebp),%eax
c0103396:	89 04 24             	mov    %eax,(%esp)
c0103399:	e8 72 35 00 00       	call   c0106910 <__ssprint_r>
c010339e:	85 c0                	test   %eax,%eax
c01033a0:	0f 85 2a ec ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01033a6:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c01033ac:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01033af:	e9 6b f6 ff ff       	jmp    c0102a1f <_svfprintf_r+0xc1f>
c01033b4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01033ba:	83 c1 01             	add    $0x1,%ecx
c01033bd:	83 c7 08             	add    $0x8,%edi
c01033c0:	c7 47 f8 c9 85 10 c0 	movl   $0xc01085c9,-0x8(%edi)
c01033c7:	c7 47 fc 01 00 00 00 	movl   $0x1,-0x4(%edi)
c01033ce:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%ebp)
c01033d4:	83 c0 01             	add    $0x1,%eax
c01033d7:	83 f8 07             	cmp    $0x7,%eax
c01033da:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01033e0:	0f 8f ef 02 00 00    	jg     c01036d5 <_svfprintf_r+0x18d5>
c01033e6:	85 db                	test   %ebx,%ebx
c01033e8:	75 17                	jne    c0103401 <_svfprintf_r+0x1601>
c01033ea:	8b 95 1c ff ff ff    	mov    -0xe4(%ebp),%edx
c01033f0:	85 d2                	test   %edx,%edx
c01033f2:	75 0d                	jne    c0103401 <_svfprintf_r+0x1601>
c01033f4:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c01033fb:	0f 84 ab f4 ff ff    	je     c01028ac <_svfprintf_r+0xaac>
c0103401:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
c0103407:	83 c7 08             	add    $0x8,%edi
c010340a:	89 47 f8             	mov    %eax,-0x8(%edi)
c010340d:	8b 85 08 ff ff ff    	mov    -0xf8(%ebp),%eax
c0103413:	89 47 fc             	mov    %eax,-0x4(%edi)
c0103416:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c0103419:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010341f:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103425:	83 c0 01             	add    $0x1,%eax
c0103428:	83 f8 07             	cmp    $0x7,%eax
c010342b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103431:	0f 8f 60 03 00 00    	jg     c0103797 <_svfprintf_r+0x1997>
c0103437:	f7 db                	neg    %ebx
c0103439:	85 db                	test   %ebx,%ebx
c010343b:	0f 8e 21 03 00 00    	jle    c0103762 <_svfprintf_r+0x1962>
c0103441:	83 fb 10             	cmp    $0x10,%ebx
c0103444:	0f 8e c3 02 00 00    	jle    c010370d <_svfprintf_r+0x190d>
c010344a:	8d b5 74 ff ff ff    	lea    -0x8c(%ebp),%esi
c0103450:	eb 12                	jmp    c0103464 <_svfprintf_r+0x1664>
c0103452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103458:	83 eb 10             	sub    $0x10,%ebx
c010345b:	83 fb 10             	cmp    $0x10,%ebx
c010345e:	0f 8e a9 02 00 00    	jle    c010370d <_svfprintf_r+0x190d>
c0103464:	83 c0 01             	add    $0x1,%eax
c0103467:	83 c2 10             	add    $0x10,%edx
c010346a:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0103470:	83 c7 08             	add    $0x8,%edi
c0103473:	c7 47 fc 10 00 00 00 	movl   $0x10,-0x4(%edi)
c010347a:	83 f8 07             	cmp    $0x7,%eax
c010347d:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103483:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103489:	7e cd                	jle    c0103458 <_svfprintf_r+0x1658>
c010348b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010348e:	89 74 24 08          	mov    %esi,0x8(%esp)
c0103492:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103496:	8b 45 08             	mov    0x8(%ebp),%eax
c0103499:	89 04 24             	mov    %eax,(%esp)
c010349c:	e8 6f 34 00 00       	call   c0106910 <__ssprint_r>
c01034a1:	85 c0                	test   %eax,%eax
c01034a3:	0f 85 27 eb ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01034a9:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01034af:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01034b2:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01034b8:	eb 9e                	jmp    c0103458 <_svfprintf_r+0x1658>
c01034ba:	8b 9d 24 ff ff ff    	mov    -0xdc(%ebp),%ebx
c01034c0:	83 e3 df             	and    $0xffffffdf,%ebx
c01034c3:	83 bd 44 ff ff ff ff 	cmpl   $0xffffffff,-0xbc(%ebp)
c01034ca:	0f 84 05 03 00 00    	je     c01037d5 <_svfprintf_r+0x19d5>
c01034d0:	83 fb 47             	cmp    $0x47,%ebx
c01034d3:	75 16                	jne    c01034eb <_svfprintf_r+0x16eb>
c01034d5:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01034db:	b8 01 00 00 00       	mov    $0x1,%eax
c01034e0:	85 d2                	test   %edx,%edx
c01034e2:	0f 45 c2             	cmovne %edx,%eax
c01034e5:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
c01034eb:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c01034f1:	dd 85 10 ff ff ff    	fldl   -0xf0(%ebp)
c01034f7:	dd 95 38 ff ff ff    	fstl   -0xc8(%ebp)
c01034fd:	80 cc 01             	or     $0x1,%ah
c0103500:	89 85 30 ff ff ff    	mov    %eax,-0xd0(%ebp)
c0103506:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c010350c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
c0103513:	85 c0                	test   %eax,%eax
c0103515:	0f 88 ba 05 00 00    	js     c0103ad5 <_svfprintf_r+0x1cd5>
c010351b:	83 fb 46             	cmp    $0x46,%ebx
c010351e:	0f 94 c0             	sete   %al
c0103521:	89 c6                	mov    %eax,%esi
c0103523:	0f 84 d4 03 00 00    	je     c01038fd <_svfprintf_r+0x1afd>
c0103529:	83 fb 45             	cmp    $0x45,%ebx
c010352c:	0f 85 99 05 00 00    	jne    c0103acb <_svfprintf_r+0x1ccb>
c0103532:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103538:	dd 54 24 04          	fstl   0x4(%esp)
c010353c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0103543:	00 
c0103544:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c010354a:	8d 70 01             	lea    0x1(%eax),%esi
c010354d:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0103553:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c0103557:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c010355d:	89 44 24 18          	mov    %eax,0x18(%esp)
c0103561:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c0103567:	89 44 24 14          	mov    %eax,0x14(%esp)
c010356b:	8b 45 08             	mov    0x8(%ebp),%eax
c010356e:	89 74 24 10          	mov    %esi,0x10(%esp)
c0103572:	89 04 24             	mov    %eax,(%esp)
c0103575:	e8 56 09 00 00       	call   c0103ed0 <_dtoa_r>
c010357a:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c0103580:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
c0103583:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103589:	d9 ee                	fldz   
c010358b:	d9 c9                	fxch   %st(1)
c010358d:	df e9                	fucomip %st(1),%st
c010358f:	dd d8                	fstp   %st(0)
c0103591:	0f 8a fd 00 00 00    	jp     c0103694 <_svfprintf_r+0x1894>
c0103597:	89 c8                	mov    %ecx,%eax
c0103599:	0f 85 f5 00 00 00    	jne    c0103694 <_svfprintf_r+0x1894>
c010359f:	2b 85 28 ff ff ff    	sub    -0xd8(%ebp),%eax
c01035a5:	83 fb 47             	cmp    $0x47,%ebx
c01035a8:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c01035ae:	0f 84 1e 04 00 00    	je     c01039d2 <_svfprintf_r+0x1bd2>
c01035b4:	83 bd 24 ff ff ff 65 	cmpl   $0x65,-0xdc(%ebp)
c01035bb:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01035c1:	0f 8e 65 04 00 00    	jle    c0103a2c <_svfprintf_r+0x1c2c>
c01035c7:	83 bd 24 ff ff ff 66 	cmpl   $0x66,-0xdc(%ebp)
c01035ce:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c01035d4:	0f 84 3c 05 00 00    	je     c0103b16 <_svfprintf_r+0x1d16>
c01035da:	8b 85 20 ff ff ff    	mov    -0xe0(%ebp),%eax
c01035e0:	39 85 1c ff ff ff    	cmp    %eax,-0xe4(%ebp)
c01035e6:	0f 8f f7 04 00 00    	jg     c0103ae3 <_svfprintf_r+0x1ce3>
c01035ec:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c01035f2:	83 e0 01             	and    $0x1,%eax
c01035f5:	0f 85 e2 05 00 00    	jne    c0103bdd <_svfprintf_r+0x1ddd>
c01035fb:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103601:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103608:	00 00 00 
c010360b:	85 d2                	test   %edx,%edx
c010360d:	0f 49 c2             	cmovns %edx,%eax
c0103610:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103616:	80 bd 48 ff ff ff 00 	cmpb   $0x0,-0xb8(%ebp)
c010361d:	0f 85 68 03 00 00    	jne    c010398b <_svfprintf_r+0x1b8b>
c0103623:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103629:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c010362f:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c0103636:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c010363d:	00 00 00 
c0103640:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c0103646:	e9 4d ea ff ff       	jmp    c0102098 <_svfprintf_r+0x298>
c010364b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103651:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103655:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103658:	89 44 24 04          	mov    %eax,0x4(%esp)
c010365c:	8b 45 08             	mov    0x8(%ebp),%eax
c010365f:	89 04 24             	mov    %eax,(%esp)
c0103662:	e8 a9 32 00 00       	call   c0106910 <__ssprint_r>
c0103667:	85 c0                	test   %eax,%eax
c0103669:	0f 85 61 e9 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010366f:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103675:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103678:	e9 f2 f3 ff ff       	jmp    c0102a6f <_svfprintf_r+0xc6f>
c010367d:	89 d0                	mov    %edx,%eax
c010367f:	e9 d1 fa ff ff       	jmp    c0103155 <_svfprintf_r+0x1355>
c0103684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103688:	8d 50 01             	lea    0x1(%eax),%edx
c010368b:	89 95 6c ff ff ff    	mov    %edx,-0x94(%ebp)
c0103691:	c6 00 30             	movb   $0x30,(%eax)
c0103694:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c010369a:	39 c1                	cmp    %eax,%ecx
c010369c:	77 ea                	ja     c0103688 <_svfprintf_r+0x1888>
c010369e:	e9 fc fe ff ff       	jmp    c010359f <_svfprintf_r+0x179f>
c01036a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01036a6:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c01036ad:	00 
c01036ae:	89 04 24             	mov    %eax,(%esp)
c01036b1:	e8 4a 1b 00 00       	call   c0105200 <_malloc_r>
c01036b6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01036b9:	85 c0                	test   %eax,%eax
c01036bb:	89 02                	mov    %eax,(%edx)
c01036bd:	89 42 10             	mov    %eax,0x10(%edx)
c01036c0:	0f 84 15 06 00 00    	je     c0103cdb <_svfprintf_r+0x1edb>
c01036c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036c9:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c01036d0:	e9 6c e7 ff ff       	jmp    c0101e41 <_svfprintf_r+0x41>
c01036d5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01036db:	89 44 24 08          	mov    %eax,0x8(%esp)
c01036df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036e2:	89 44 24 04          	mov    %eax,0x4(%esp)
c01036e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01036e9:	89 04 24             	mov    %eax,(%esp)
c01036ec:	e8 1f 32 00 00       	call   c0106910 <__ssprint_r>
c01036f1:	85 c0                	test   %eax,%eax
c01036f3:	0f 85 d7 e8 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01036f9:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c01036ff:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103702:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103708:	e9 d9 fc ff ff       	jmp    c01033e6 <_svfprintf_r+0x15e6>
c010370d:	83 c0 01             	add    $0x1,%eax
c0103710:	01 da                	add    %ebx,%edx
c0103712:	c7 07 98 8f 10 c0    	movl   $0xc0108f98,(%edi)
c0103718:	83 c7 08             	add    $0x8,%edi
c010371b:	89 5f fc             	mov    %ebx,-0x4(%edi)
c010371e:	83 f8 07             	cmp    $0x7,%eax
c0103721:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103727:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010372d:	7e 33                	jle    c0103762 <_svfprintf_r+0x1962>
c010372f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103735:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103739:	8b 45 0c             	mov    0xc(%ebp),%eax
c010373c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103740:	8b 45 08             	mov    0x8(%ebp),%eax
c0103743:	89 04 24             	mov    %eax,(%esp)
c0103746:	e8 c5 31 00 00       	call   c0106910 <__ssprint_r>
c010374b:	85 c0                	test   %eax,%eax
c010374d:	0f 85 7d e8 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0103753:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0103759:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010375c:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0103762:	8b 9d 28 ff ff ff    	mov    -0xd8(%ebp),%ebx
c0103768:	83 c0 01             	add    $0x1,%eax
c010376b:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0103771:	89 1f                	mov    %ebx,(%edi)
c0103773:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103779:	01 da                	add    %ebx,%edx
c010377b:	83 f8 07             	cmp    $0x7,%eax
c010377e:	89 5f 04             	mov    %ebx,0x4(%edi)
c0103781:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0103787:	0f 8f 86 f5 ff ff    	jg     c0102d13 <_svfprintf_r+0xf13>
c010378d:	83 c7 08             	add    $0x8,%edi
c0103790:	89 d1                	mov    %edx,%ecx
c0103792:	e9 15 f1 ff ff       	jmp    c01028ac <_svfprintf_r+0xaac>
c0103797:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010379d:	89 44 24 08          	mov    %eax,0x8(%esp)
c01037a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037a4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01037a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01037ab:	89 04 24             	mov    %eax,(%esp)
c01037ae:	e8 5d 31 00 00       	call   c0106910 <__ssprint_r>
c01037b3:	85 c0                	test   %eax,%eax
c01037b5:	0f 85 15 e8 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c01037bb:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c01037c1:	8d 7d a8             	lea    -0x58(%ebp),%edi
c01037c4:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01037ca:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01037d0:	e9 62 fc ff ff       	jmp    c0103437 <_svfprintf_r+0x1637>
c01037d5:	c7 85 44 ff ff ff 06 	movl   $0x6,-0xbc(%ebp)
c01037dc:	00 00 00 
c01037df:	e9 07 fd ff ff       	jmp    c01034eb <_svfprintf_r+0x16eb>
c01037e4:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01037ea:	89 04 24             	mov    %eax,(%esp)
c01037ed:	e8 9e 30 00 00       	call   c0106890 <strlen>
c01037f2:	e9 6a e8 ff ff       	jmp    c0102061 <_svfprintf_r+0x261>
c01037f7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01037fd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103801:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103804:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103808:	8b 45 08             	mov    0x8(%ebp),%eax
c010380b:	89 04 24             	mov    %eax,(%esp)
c010380e:	e8 fd 30 00 00       	call   c0106910 <__ssprint_r>
c0103813:	85 c0                	test   %eax,%eax
c0103815:	0f 85 b5 e7 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010381b:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c0103821:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103824:	e9 76 f6 ff ff       	jmp    c0102e9f <_svfprintf_r+0x109f>
c0103829:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010382f:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103833:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103836:	89 44 24 04          	mov    %eax,0x4(%esp)
c010383a:	8b 45 08             	mov    0x8(%ebp),%eax
c010383d:	89 04 24             	mov    %eax,(%esp)
c0103840:	e8 cb 30 00 00       	call   c0106910 <__ssprint_r>
c0103845:	85 c0                	test   %eax,%eax
c0103847:	0f 85 83 e7 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c010384d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103853:	8d 7d a8             	lea    -0x58(%ebp),%edi
c0103856:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010385c:	e9 f4 f8 ff ff       	jmp    c0103155 <_svfprintf_r+0x1355>
c0103861:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103867:	89 44 24 08          	mov    %eax,0x8(%esp)
c010386b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010386e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103872:	8b 45 08             	mov    0x8(%ebp),%eax
c0103875:	89 04 24             	mov    %eax,(%esp)
c0103878:	e8 93 30 00 00       	call   c0106910 <__ssprint_r>
c010387d:	85 c0                	test   %eax,%eax
c010387f:	0f 85 4b e7 ff ff    	jne    c0101fd0 <_svfprintf_r+0x1d0>
c0103885:	8b b5 1c ff ff ff    	mov    -0xe4(%ebp),%esi
c010388b:	8d 7d a8             	lea    -0x58(%ebp),%edi
c010388e:	2b b5 5c ff ff ff    	sub    -0xa4(%ebp),%esi
c0103894:	8b 8d 7c ff ff ff    	mov    -0x84(%ebp),%ecx
c010389a:	e9 fa f8 ff ff       	jmp    c0103199 <_svfprintf_r+0x1399>
c010389f:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c01038a5:	b0 06                	mov    $0x6,%al
c01038a7:	89 75 14             	mov    %esi,0x14(%ebp)
c01038aa:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01038b1:	00 00 00 
c01038b4:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c01038bb:	00 00 00 
c01038be:	83 fa 06             	cmp    $0x6,%edx
c01038c1:	0f 46 c2             	cmovbe %edx,%eax
c01038c4:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c01038ca:	85 c0                	test   %eax,%eax
c01038cc:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c01038d2:	c7 85 28 ff ff ff 2c 	movl   $0xc0108e2c,-0xd8(%ebp)
c01038d9:	8e 10 c0 
c01038dc:	0f 49 d0             	cmovns %eax,%edx
c01038df:	31 db                	xor    %ebx,%ebx
c01038e1:	89 95 48 ff ff ff    	mov    %edx,-0xb8(%ebp)
c01038e7:	e9 b7 e7 ff ff       	jmp    c01020a3 <_svfprintf_r+0x2a3>
c01038ec:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01038f3:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c01038f8:	e9 9d ea ff ff       	jmp    c010239a <_svfprintf_r+0x59a>
c01038fd:	ba 03 00 00 00       	mov    $0x3,%edx
c0103902:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
c0103908:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c010390c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
c0103912:	89 44 24 18          	mov    %eax,0x18(%esp)
c0103916:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
c010391c:	89 44 24 14          	mov    %eax,0x14(%esp)
c0103920:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103926:	dd 54 24 04          	fstl   0x4(%esp)
c010392a:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010392e:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
c0103934:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103938:	8b 45 08             	mov    0x8(%ebp),%eax
c010393b:	89 04 24             	mov    %eax,(%esp)
c010393e:	e8 8d 05 00 00       	call   c0103ed0 <_dtoa_r>
c0103943:	83 fb 47             	cmp    $0x47,%ebx
c0103946:	89 85 28 ff ff ff    	mov    %eax,-0xd8(%ebp)
c010394c:	dd 85 38 ff ff ff    	fldl   -0xc8(%ebp)
c0103952:	75 09                	jne    c010395d <_svfprintf_r+0x1b5d>
c0103954:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c010395b:	74 5b                	je     c01039b8 <_svfprintf_r+0x1bb8>
c010395d:	8b 95 28 ff ff ff    	mov    -0xd8(%ebp),%edx
c0103963:	89 f0                	mov    %esi,%eax
c0103965:	8b 8d 44 ff ff ff    	mov    -0xbc(%ebp),%ecx
c010396b:	01 d1                	add    %edx,%ecx
c010396d:	84 c0                	test   %al,%al
c010396f:	0f 84 14 fc ff ff    	je     c0103589 <_svfprintf_r+0x1789>
c0103975:	80 3a 30             	cmpb   $0x30,(%edx)
c0103978:	0f 84 37 02 00 00    	je     c0103bb5 <_svfprintf_r+0x1db5>
c010397e:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0103984:	01 c1                	add    %eax,%ecx
c0103986:	e9 fe fb ff ff       	jmp    c0103589 <_svfprintf_r+0x1789>
c010398b:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103991:	8b 85 30 ff ff ff    	mov    -0xd0(%ebp),%eax
c0103997:	bb 2d 00 00 00       	mov    $0x2d,%ebx
c010399c:	c6 85 59 ff ff ff 2d 	movb   $0x2d,-0xa7(%ebp)
c01039a3:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c01039aa:	00 00 00 
c01039ad:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%ebp)
c01039b3:	e9 e4 e6 ff ff       	jmp    c010209c <_svfprintf_r+0x29c>
c01039b8:	dd d8                	fstp   %st(0)
c01039ba:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01039c0:	89 85 1c ff ff ff    	mov    %eax,-0xe4(%ebp)
c01039c6:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
c01039cc:	29 85 1c ff ff ff    	sub    %eax,-0xe4(%ebp)
c01039d2:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01039d8:	83 f8 fd             	cmp    $0xfffffffd,%eax
c01039db:	7c 48                	jl     c0103a25 <_svfprintf_r+0x1c25>
c01039dd:	39 85 44 ff ff ff    	cmp    %eax,-0xbc(%ebp)
c01039e3:	7c 40                	jl     c0103a25 <_svfprintf_r+0x1c25>
c01039e5:	89 85 20 ff ff ff    	mov    %eax,-0xe0(%ebp)
c01039eb:	e9 ea fb ff ff       	jmp    c01035da <_svfprintf_r+0x17da>
c01039f0:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c01039f6:	0f b6 9d 59 ff ff ff 	movzbl -0xa7(%ebp),%ebx
c01039fd:	89 75 14             	mov    %esi,0x14(%ebp)
c0103a00:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103a07:	00 00 00 
c0103a0a:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)
c0103a10:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103a16:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103a1d:	00 00 00 
c0103a20:	e9 73 e6 ff ff       	jmp    c0102098 <_svfprintf_r+0x298>
c0103a25:	83 ad 24 ff ff ff 02 	subl   $0x2,-0xdc(%ebp)
c0103a2c:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103a2f:	0f b6 85 24 ff ff ff 	movzbl -0xdc(%ebp),%eax
c0103a36:	85 c9                	test   %ecx,%ecx
c0103a38:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c0103a3e:	88 85 65 ff ff ff    	mov    %al,-0x9b(%ebp)
c0103a44:	0f 88 2c 02 00 00    	js     c0103c76 <_svfprintf_r+0x1e76>
c0103a4a:	c6 85 66 ff ff ff 2b 	movb   $0x2b,-0x9a(%ebp)
c0103a51:	83 f9 09             	cmp    $0x9,%ecx
c0103a54:	0f 8f ea 00 00 00    	jg     c0103b44 <_svfprintf_r+0x1d44>
c0103a5a:	83 c1 30             	add    $0x30,%ecx
c0103a5d:	c6 85 67 ff ff ff 30 	movb   $0x30,-0x99(%ebp)
c0103a64:	8d 85 69 ff ff ff    	lea    -0x97(%ebp),%eax
c0103a6a:	88 8d 68 ff ff ff    	mov    %cl,-0x98(%ebp)
c0103a70:	8b 9d 1c ff ff ff    	mov    -0xe4(%ebp),%ebx
c0103a76:	8d 95 65 ff ff ff    	lea    -0x9b(%ebp),%edx
c0103a7c:	29 d0                	sub    %edx,%eax
c0103a7e:	89 85 04 ff ff ff    	mov    %eax,-0xfc(%ebp)
c0103a84:	89 da                	mov    %ebx,%edx
c0103a86:	01 c2                	add    %eax,%edx
c0103a88:	83 fb 01             	cmp    $0x1,%ebx
c0103a8b:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103a91:	0f 8e 21 02 00 00    	jle    c0103cb8 <_svfprintf_r+0x1eb8>
c0103a97:	31 c0                	xor    %eax,%eax
c0103a99:	83 85 38 ff ff ff 01 	addl   $0x1,-0xc8(%ebp)
c0103aa0:	0f 49 85 38 ff ff ff 	cmovns -0xc8(%ebp),%eax
c0103aa7:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103aae:	00 00 00 
c0103ab1:	e9 60 fb ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103ab6:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0103abc:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0103ac3:	00 00 00 
c0103ac6:	e9 68 e4 ff ff       	jmp    c0101f33 <_svfprintf_r+0x133>
c0103acb:	ba 02 00 00 00       	mov    $0x2,%edx
c0103ad0:	e9 2d fe ff ff       	jmp    c0103902 <_svfprintf_r+0x1b02>
c0103ad5:	d9 e0                	fchs   
c0103ad7:	c6 85 48 ff ff ff 2d 	movb   $0x2d,-0xb8(%ebp)
c0103ade:	e9 38 fa ff ff       	jmp    c010351b <_svfprintf_r+0x171b>
c0103ae3:	8b 8d 20 ff ff ff    	mov    -0xe0(%ebp),%ecx
c0103ae9:	ba 01 00 00 00       	mov    $0x1,%edx
c0103aee:	85 c9                	test   %ecx,%ecx
c0103af0:	0f 8e 5a 01 00 00    	jle    c0103c50 <_svfprintf_r+0x1e50>
c0103af6:	31 c0                	xor    %eax,%eax
c0103af8:	03 95 1c ff ff ff    	add    -0xe4(%ebp),%edx
c0103afe:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103b05:	00 00 00 
c0103b08:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103b0e:	0f 49 c2             	cmovns %edx,%eax
c0103b11:	e9 00 fb ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103b16:	85 c0                	test   %eax,%eax
c0103b18:	0f 8e 06 01 00 00    	jle    c0103c24 <_svfprintf_r+0x1e24>
c0103b1e:	8b b5 44 ff ff ff    	mov    -0xbc(%ebp),%esi
c0103b24:	85 f6                	test   %esi,%esi
c0103b26:	0f 85 d4 00 00 00    	jne    c0103c00 <_svfprintf_r+0x1e00>
c0103b2c:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103b33:	0f 85 c7 00 00 00    	jne    c0103c00 <_svfprintf_r+0x1e00>
c0103b39:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103b3f:	e9 d2 fa ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103b44:	8d b5 73 ff ff ff    	lea    -0x8d(%ebp),%esi
c0103b4a:	89 f3                	mov    %esi,%ebx
c0103b4c:	b8 67 66 66 66       	mov    $0x66666667,%eax
c0103b51:	83 eb 01             	sub    $0x1,%ebx
c0103b54:	f7 e9                	imul   %ecx
c0103b56:	89 c8                	mov    %ecx,%eax
c0103b58:	c1 f8 1f             	sar    $0x1f,%eax
c0103b5b:	c1 fa 02             	sar    $0x2,%edx
c0103b5e:	29 c2                	sub    %eax,%edx
c0103b60:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0103b63:	01 c0                	add    %eax,%eax
c0103b65:	29 c1                	sub    %eax,%ecx
c0103b67:	83 fa 09             	cmp    $0x9,%edx
c0103b6a:	8d 41 30             	lea    0x30(%ecx),%eax
c0103b6d:	89 d1                	mov    %edx,%ecx
c0103b6f:	88 03                	mov    %al,(%ebx)
c0103b71:	7f d9                	jg     c0103b4c <_svfprintf_r+0x1d4c>
c0103b73:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0103b76:	83 c1 30             	add    $0x30,%ecx
c0103b79:	39 f0                	cmp    %esi,%eax
c0103b7b:	88 4b ff             	mov    %cl,-0x1(%ebx)
c0103b7e:	0f 83 6a 01 00 00    	jae    c0103cee <_svfprintf_r+0x1eee>
c0103b84:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c0103b8a:	eb 07                	jmp    c0103b93 <_svfprintf_r+0x1d93>
c0103b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103b90:	0f b6 08             	movzbl (%eax),%ecx
c0103b93:	83 c0 01             	add    $0x1,%eax
c0103b96:	83 c2 01             	add    $0x1,%edx
c0103b99:	39 f0                	cmp    %esi,%eax
c0103b9b:	88 4a ff             	mov    %cl,-0x1(%edx)
c0103b9e:	75 f0                	jne    c0103b90 <_svfprintf_r+0x1d90>
c0103ba0:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0103ba6:	29 d8                	sub    %ebx,%eax
c0103ba8:	8d 95 67 ff ff ff    	lea    -0x99(%ebp),%edx
c0103bae:	01 d0                	add    %edx,%eax
c0103bb0:	e9 bb fe ff ff       	jmp    c0103a70 <_svfprintf_r+0x1c70>
c0103bb5:	d9 ee                	fldz   
c0103bb7:	d9 c9                	fxch   %st(1)
c0103bb9:	db e9                	fucomi %st(1),%st
c0103bbb:	dd d9                	fstp   %st(1)
c0103bbd:	7a 06                	jp     c0103bc5 <_svfprintf_r+0x1dc5>
c0103bbf:	0f 84 b9 fd ff ff    	je     c010397e <_svfprintf_r+0x1b7e>
c0103bc5:	b8 01 00 00 00       	mov    $0x1,%eax
c0103bca:	2b 85 44 ff ff ff    	sub    -0xbc(%ebp),%eax
c0103bd0:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c0103bd6:	01 c1                	add    %eax,%ecx
c0103bd8:	e9 ac f9 ff ff       	jmp    c0103589 <_svfprintf_r+0x1789>
c0103bdd:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103be3:	31 c0                	xor    %eax,%eax
c0103be5:	c7 85 24 ff ff ff 67 	movl   $0x67,-0xdc(%ebp)
c0103bec:	00 00 00 
c0103bef:	83 c2 01             	add    $0x1,%edx
c0103bf2:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103bf8:	0f 49 c2             	cmovns %edx,%eax
c0103bfb:	e9 16 fa ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103c00:	8b 95 20 ff ff ff    	mov    -0xe0(%ebp),%edx
c0103c06:	8b 85 44 ff ff ff    	mov    -0xbc(%ebp),%eax
c0103c0c:	8d 44 10 01          	lea    0x1(%eax,%edx,1),%eax
c0103c10:	89 c2                	mov    %eax,%edx
c0103c12:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%ebp)
c0103c18:	31 c0                	xor    %eax,%eax
c0103c1a:	85 d2                	test   %edx,%edx
c0103c1c:	0f 49 c2             	cmovns %edx,%eax
c0103c1f:	e9 f2 f9 ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103c24:	8b 9d 44 ff ff ff    	mov    -0xbc(%ebp),%ebx
c0103c2a:	85 db                	test   %ebx,%ebx
c0103c2c:	75 2f                	jne    c0103c5d <_svfprintf_r+0x1e5d>
c0103c2e:	f6 85 4c ff ff ff 01 	testb  $0x1,-0xb4(%ebp)
c0103c35:	75 26                	jne    c0103c5d <_svfprintf_r+0x1e5d>
c0103c37:	b8 01 00 00 00       	mov    $0x1,%eax
c0103c3c:	c7 85 38 ff ff ff 01 	movl   $0x1,-0xc8(%ebp)
c0103c43:	00 00 00 
c0103c46:	e9 cb f9 ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103c4b:	90                   	nop
c0103c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103c50:	b2 02                	mov    $0x2,%dl
c0103c52:	2b 95 20 ff ff ff    	sub    -0xe0(%ebp),%edx
c0103c58:	e9 99 fe ff ff       	jmp    c0103af6 <_svfprintf_r+0x1cf6>
c0103c5d:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0103c63:	31 c0                	xor    %eax,%eax
c0103c65:	83 c2 02             	add    $0x2,%edx
c0103c68:	89 95 38 ff ff ff    	mov    %edx,-0xc8(%ebp)
c0103c6e:	0f 49 c2             	cmovns %edx,%eax
c0103c71:	e9 a0 f9 ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103c76:	f7 d9                	neg    %ecx
c0103c78:	c6 85 66 ff ff ff 2d 	movb   $0x2d,-0x9a(%ebp)
c0103c7f:	e9 cd fd ff ff       	jmp    c0103a51 <_svfprintf_r+0x1c51>
c0103c84:	8b 55 14             	mov    0x14(%ebp),%edx
c0103c87:	8b 45 14             	mov    0x14(%ebp),%eax
c0103c8a:	8b 8d 48 ff ff ff    	mov    -0xb8(%ebp),%ecx
c0103c90:	8b 12                	mov    (%edx),%edx
c0103c92:	83 c0 04             	add    $0x4,%eax
c0103c95:	89 45 14             	mov    %eax,0x14(%ebp)
c0103c98:	85 d2                	test   %edx,%edx
c0103c9a:	89 95 44 ff ff ff    	mov    %edx,-0xbc(%ebp)
c0103ca0:	0f 89 a9 e2 ff ff    	jns    c0101f4f <_svfprintf_r+0x14f>
c0103ca6:	c7 85 44 ff ff ff ff 	movl   $0xffffffff,-0xbc(%ebp)
c0103cad:	ff ff ff 
c0103cb0:	89 c8                	mov    %ecx,%eax
c0103cb2:	e9 76 e2 ff ff       	jmp    c0101f2d <_svfprintf_r+0x12d>
c0103cb7:	90                   	nop
c0103cb8:	8b 85 4c ff ff ff    	mov    -0xb4(%ebp),%eax
c0103cbe:	83 e0 01             	and    $0x1,%eax
c0103cc1:	0f 85 d0 fd ff ff    	jne    c0103a97 <_svfprintf_r+0x1c97>
c0103cc7:	85 d2                	test   %edx,%edx
c0103cc9:	0f 49 c2             	cmovns %edx,%eax
c0103ccc:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0103cd3:	00 00 00 
c0103cd6:	e9 3b f9 ff ff       	jmp    c0103616 <_svfprintf_r+0x1816>
c0103cdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cde:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0103ce4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103ce9:	e9 f5 e2 ff ff       	jmp    c0101fe3 <_svfprintf_r+0x1e3>
c0103cee:	8d 85 67 ff ff ff    	lea    -0x99(%ebp),%eax
c0103cf4:	e9 77 fd ff ff       	jmp    c0103a70 <_svfprintf_r+0x1c70>
c0103cf9:	66 90                	xchg   %ax,%ax
c0103cfb:	66 90                	xchg   %ax,%ax
c0103cfd:	66 90                	xchg   %ax,%ax
c0103cff:	90                   	nop

c0103d00 <quorem>:
c0103d00:	55                   	push   %ebp
c0103d01:	89 c1                	mov    %eax,%ecx
c0103d03:	89 e5                	mov    %esp,%ebp
c0103d05:	57                   	push   %edi
c0103d06:	89 d7                	mov    %edx,%edi
c0103d08:	56                   	push   %esi
c0103d09:	53                   	push   %ebx
c0103d0a:	83 ec 3c             	sub    $0x3c,%esp
c0103d0d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0103d10:	8b 42 10             	mov    0x10(%edx),%eax
c0103d13:	3b 41 10             	cmp    0x10(%ecx),%eax
c0103d16:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0103d19:	89 ca                	mov    %ecx,%edx
c0103d1b:	0f 8f 9f 01 00 00    	jg     c0103ec0 <quorem+0x1c0>
c0103d21:	83 e8 01             	sub    $0x1,%eax
c0103d24:	83 c7 14             	add    $0x14,%edi
c0103d27:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103d2a:	c1 e0 02             	shl    $0x2,%eax
c0103d2d:	83 c2 14             	add    $0x14,%edx
c0103d30:	8d 1c 07             	lea    (%edi,%eax,1),%ebx
c0103d33:	01 d0                	add    %edx,%eax
c0103d35:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0103d38:	8b 13                	mov    (%ebx),%edx
c0103d3a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103d3d:	8b 00                	mov    (%eax),%eax
c0103d3f:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
c0103d42:	8d 4a 01             	lea    0x1(%edx),%ecx
c0103d45:	31 d2                	xor    %edx,%edx
c0103d47:	f7 f1                	div    %ecx
c0103d49:	85 c0                	test   %eax,%eax
c0103d4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103d4e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103d51:	0f 84 b5 00 00 00    	je     c0103e0c <quorem+0x10c>
c0103d57:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103d5a:	31 f6                	xor    %esi,%esi
c0103d5c:	89 fa                	mov    %edi,%edx
c0103d5e:	89 7d c0             	mov    %edi,-0x40(%ebp)
c0103d61:	89 f7                	mov    %esi,%edi
c0103d63:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0103d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0103d70:	83 c2 04             	add    $0x4,%edx
c0103d73:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103d76:	83 c0 04             	add    $0x4,%eax
c0103d79:	0f b7 ce             	movzwl %si,%ecx
c0103d7c:	0f af 4d e0          	imul   -0x20(%ebp),%ecx
c0103d80:	03 4d dc             	add    -0x24(%ebp),%ecx
c0103d83:	c1 ee 10             	shr    $0x10,%esi
c0103d86:	0f af 75 e0          	imul   -0x20(%ebp),%esi
c0103d8a:	89 cb                	mov    %ecx,%ebx
c0103d8c:	0f b7 c9             	movzwl %cx,%ecx
c0103d8f:	c1 eb 10             	shr    $0x10,%ebx
c0103d92:	29 cf                	sub    %ecx,%edi
c0103d94:	01 f3                	add    %esi,%ebx
c0103d96:	89 de                	mov    %ebx,%esi
c0103d98:	0f b7 db             	movzwl %bx,%ebx
c0103d9b:	c1 ee 10             	shr    $0x10,%esi
c0103d9e:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0103da1:	8b 70 fc             	mov    -0x4(%eax),%esi
c0103da4:	0f b7 ce             	movzwl %si,%ecx
c0103da7:	01 f9                	add    %edi,%ecx
c0103da9:	c1 ee 10             	shr    $0x10,%esi
c0103dac:	29 de                	sub    %ebx,%esi
c0103dae:	89 cb                	mov    %ecx,%ebx
c0103db0:	c1 fb 10             	sar    $0x10,%ebx
c0103db3:	0f b7 c9             	movzwl %cx,%ecx
c0103db6:	01 de                	add    %ebx,%esi
c0103db8:	89 f7                	mov    %esi,%edi
c0103dba:	c1 e6 10             	shl    $0x10,%esi
c0103dbd:	09 ce                	or     %ecx,%esi
c0103dbf:	c1 ff 10             	sar    $0x10,%edi
c0103dc2:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
c0103dc5:	89 70 fc             	mov    %esi,-0x4(%eax)
c0103dc8:	73 a6                	jae    c0103d70 <quorem+0x70>
c0103dca:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103dcd:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0103dd0:	8b 10                	mov    (%eax),%edx
c0103dd2:	85 d2                	test   %edx,%edx
c0103dd4:	75 36                	jne    c0103e0c <quorem+0x10c>
c0103dd6:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103dd9:	89 c2                	mov    %eax,%edx
c0103ddb:	83 e8 04             	sub    $0x4,%eax
c0103dde:	39 c1                	cmp    %eax,%ecx
c0103de0:	73 21                	jae    c0103e03 <quorem+0x103>
c0103de2:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103de5:	85 f6                	test   %esi,%esi
c0103de7:	75 1a                	jne    c0103e03 <quorem+0x103>
c0103de9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103dec:	eb 08                	jmp    c0103df6 <quorem+0xf6>
c0103dee:	66 90                	xchg   %ax,%ax
c0103df0:	8b 18                	mov    (%eax),%ebx
c0103df2:	85 db                	test   %ebx,%ebx
c0103df4:	75 0a                	jne    c0103e00 <quorem+0x100>
c0103df6:	83 e8 04             	sub    $0x4,%eax
c0103df9:	83 ea 01             	sub    $0x1,%edx
c0103dfc:	39 c1                	cmp    %eax,%ecx
c0103dfe:	72 f0                	jb     c0103df0 <quorem+0xf0>
c0103e00:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103e03:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103e06:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0103e09:	89 50 10             	mov    %edx,0x10(%eax)
c0103e0c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0103e0f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103e13:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103e16:	89 04 24             	mov    %eax,(%esp)
c0103e19:	e8 a2 23 00 00       	call   c01061c0 <__mcmp>
c0103e1e:	85 c0                	test   %eax,%eax
c0103e20:	0f 88 8e 00 00 00    	js     c0103eb4 <quorem+0x1b4>
c0103e26:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103e29:	31 f6                	xor    %esi,%esi
c0103e2b:	83 c0 01             	add    $0x1,%eax
c0103e2e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103e31:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103e38:	83 c7 04             	add    $0x4,%edi
c0103e3b:	8b 4f fc             	mov    -0x4(%edi),%ecx
c0103e3e:	83 c0 04             	add    $0x4,%eax
c0103e41:	8b 58 fc             	mov    -0x4(%eax),%ebx
c0103e44:	0f b7 d1             	movzwl %cx,%edx
c0103e47:	29 d6                	sub    %edx,%esi
c0103e49:	0f b7 d3             	movzwl %bx,%edx
c0103e4c:	01 f2                	add    %esi,%edx
c0103e4e:	c1 e9 10             	shr    $0x10,%ecx
c0103e51:	c1 eb 10             	shr    $0x10,%ebx
c0103e54:	29 cb                	sub    %ecx,%ebx
c0103e56:	89 d1                	mov    %edx,%ecx
c0103e58:	c1 f9 10             	sar    $0x10,%ecx
c0103e5b:	0f b7 d2             	movzwl %dx,%edx
c0103e5e:	01 cb                	add    %ecx,%ebx
c0103e60:	89 de                	mov    %ebx,%esi
c0103e62:	c1 e3 10             	shl    $0x10,%ebx
c0103e65:	09 d3                	or     %edx,%ebx
c0103e67:	c1 fe 10             	sar    $0x10,%esi
c0103e6a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
c0103e6d:	89 58 fc             	mov    %ebx,-0x4(%eax)
c0103e70:	73 c6                	jae    c0103e38 <quorem+0x138>
c0103e72:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103e75:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103e78:	8d 14 b8             	lea    (%eax,%edi,4),%edx
c0103e7b:	8b 02                	mov    (%edx),%eax
c0103e7d:	85 c0                	test   %eax,%eax
c0103e7f:	75 33                	jne    c0103eb4 <quorem+0x1b4>
c0103e81:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0103e84:	8d 42 fc             	lea    -0x4(%edx),%eax
c0103e87:	39 c1                	cmp    %eax,%ecx
c0103e89:	73 20                	jae    c0103eab <quorem+0x1ab>
c0103e8b:	8b 72 fc             	mov    -0x4(%edx),%esi
c0103e8e:	85 f6                	test   %esi,%esi
c0103e90:	75 19                	jne    c0103eab <quorem+0x1ab>
c0103e92:	89 fa                	mov    %edi,%edx
c0103e94:	eb 08                	jmp    c0103e9e <quorem+0x19e>
c0103e96:	66 90                	xchg   %ax,%ax
c0103e98:	8b 18                	mov    (%eax),%ebx
c0103e9a:	85 db                	test   %ebx,%ebx
c0103e9c:	75 0a                	jne    c0103ea8 <quorem+0x1a8>
c0103e9e:	83 e8 04             	sub    $0x4,%eax
c0103ea1:	83 ea 01             	sub    $0x1,%edx
c0103ea4:	39 c1                	cmp    %eax,%ecx
c0103ea6:	72 f0                	jb     c0103e98 <quorem+0x198>
c0103ea8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103eab:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103eae:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0103eb1:	89 78 10             	mov    %edi,0x10(%eax)
c0103eb4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103eb7:	83 c4 3c             	add    $0x3c,%esp
c0103eba:	5b                   	pop    %ebx
c0103ebb:	5e                   	pop    %esi
c0103ebc:	5f                   	pop    %edi
c0103ebd:	5d                   	pop    %ebp
c0103ebe:	c3                   	ret    
c0103ebf:	90                   	nop
c0103ec0:	83 c4 3c             	add    $0x3c,%esp
c0103ec3:	31 c0                	xor    %eax,%eax
c0103ec5:	5b                   	pop    %ebx
c0103ec6:	5e                   	pop    %esi
c0103ec7:	5f                   	pop    %edi
c0103ec8:	5d                   	pop    %ebp
c0103ec9:	c3                   	ret    
c0103eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0103ed0 <_dtoa_r>:
c0103ed0:	55                   	push   %ebp
c0103ed1:	89 e5                	mov    %esp,%ebp
c0103ed3:	57                   	push   %edi
c0103ed4:	56                   	push   %esi
c0103ed5:	53                   	push   %ebx
c0103ed6:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
c0103edc:	8b 75 08             	mov    0x8(%ebp),%esi
c0103edf:	dd 45 0c             	fldl   0xc(%ebp)
c0103ee2:	8b 5d 20             	mov    0x20(%ebp),%ebx
c0103ee5:	dd 5d c0             	fstpl  -0x40(%ebp)
c0103ee8:	8b 46 40             	mov    0x40(%esi),%eax
c0103eeb:	85 c0                	test   %eax,%eax
c0103eed:	74 23                	je     c0103f12 <_dtoa_r+0x42>
c0103eef:	8b 4e 44             	mov    0x44(%esi),%ecx
c0103ef2:	ba 01 00 00 00       	mov    $0x1,%edx
c0103ef7:	d3 e2                	shl    %cl,%edx
c0103ef9:	89 48 04             	mov    %ecx,0x4(%eax)
c0103efc:	89 50 08             	mov    %edx,0x8(%eax)
c0103eff:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f03:	89 34 24             	mov    %esi,(%esp)
c0103f06:	e8 95 1b 00 00       	call   c0105aa0 <_Bfree>
c0103f0b:	c7 46 40 00 00 00 00 	movl   $0x0,0x40(%esi)
c0103f12:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0103f15:	85 ff                	test   %edi,%edi
c0103f17:	0f 88 3b 02 00 00    	js     c0104158 <_dtoa_r+0x288>
c0103f1d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0103f23:	89 f8                	mov    %edi,%eax
c0103f25:	25 00 00 f0 7f       	and    $0x7ff00000,%eax
c0103f2a:	3d 00 00 f0 7f       	cmp    $0x7ff00000,%eax
c0103f2f:	0f 84 e3 01 00 00    	je     c0104118 <_dtoa_r+0x248>
c0103f35:	dd 45 c0             	fldl   -0x40(%ebp)
c0103f38:	d9 ee                	fldz   
c0103f3a:	d9 c9                	fxch   %st(1)
c0103f3c:	db e9                	fucomi %st(1),%st
c0103f3e:	dd d9                	fstp   %st(1)
c0103f40:	7a 36                	jp     c0103f78 <_dtoa_r+0xa8>
c0103f42:	75 34                	jne    c0103f78 <_dtoa_r+0xa8>
c0103f44:	dd d8                	fstp   %st(0)
c0103f46:	8b 4d 24             	mov    0x24(%ebp),%ecx
c0103f49:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0103f4c:	85 c9                	test   %ecx,%ecx
c0103f4e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0103f54:	0f 84 4e 02 00 00    	je     c01041a8 <_dtoa_r+0x2d8>
c0103f5a:	8b 45 24             	mov    0x24(%ebp),%eax
c0103f5d:	c7 00 ca 85 10 c0    	movl   $0xc01085ca,(%eax)
c0103f63:	b8 c9 85 10 c0       	mov    $0xc01085c9,%eax
c0103f68:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0103f6e:	5b                   	pop    %ebx
c0103f6f:	5e                   	pop    %esi
c0103f70:	5f                   	pop    %edi
c0103f71:	5d                   	pop    %ebp
c0103f72:	c3                   	ret    
c0103f73:	90                   	nop
c0103f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0103f78:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0103f7b:	89 fb                	mov    %edi,%ebx
c0103f7d:	89 44 24 10          	mov    %eax,0x10(%esp)
c0103f81:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0103f84:	dd 54 24 04          	fstl   0x4(%esp)
c0103f88:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0103f8c:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103f8f:	89 34 24             	mov    %esi,(%esp)
c0103f92:	c1 eb 14             	shr    $0x14,%ebx
c0103f95:	e8 76 25 00 00       	call   c0106510 <__d2b>
c0103f9a:	85 db                	test   %ebx,%ebx
c0103f9c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0103f9f:	0f 85 db 01 00 00    	jne    c0104180 <_dtoa_r+0x2b0>
c0103fa5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103fa8:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c0103fab:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103fae:	01 c3                	add    %eax,%ebx
c0103fb0:	81 fb ef fb ff ff    	cmp    $0xfffffbef,%ebx
c0103fb6:	0f 8c ec 07 00 00    	jl     c01047a8 <_dtoa_r+0x8d8>
c0103fbc:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0103fbf:	b9 0e fc ff ff       	mov    $0xfffffc0e,%ecx
c0103fc4:	89 f8                	mov    %edi,%eax
c0103fc6:	29 d9                	sub    %ebx,%ecx
c0103fc8:	d3 e0                	shl    %cl,%eax
c0103fca:	8d 8b 12 04 00 00    	lea    0x412(%ebx),%ecx
c0103fd0:	d3 ea                	shr    %cl,%edx
c0103fd2:	09 d0                	or     %edx,%eax
c0103fd4:	31 d2                	xor    %edx,%edx
c0103fd6:	83 eb 01             	sub    $0x1,%ebx
c0103fd9:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0103fdc:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0103fdf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103fe2:	df 6d c8             	fildll -0x38(%ebp)
c0103fe5:	dd 5d b8             	fstpl  -0x48(%ebp)
c0103fe8:	81 6d bc 00 00 f0 01 	subl   $0x1f00000,-0x44(%ebp)
c0103fef:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c0103ff6:	dd 45 b8             	fldl   -0x48(%ebp)
c0103ff9:	d8 25 c8 8f 10 c0    	fsubs  0xc0108fc8
c0103fff:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
c0104002:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0104005:	dc 0d e0 8f 10 c0    	fmull  0xc0108fe0
c010400b:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c010400f:	b4 0c                	mov    $0xc,%ah
c0104011:	dc 05 e8 8f 10 c0    	faddl  0xc0108fe8
c0104017:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c010401b:	db 45 d4             	fildl  -0x2c(%ebp)
c010401e:	dc 0d f0 8f 10 c0    	fmull  0xc0108ff0
c0104024:	de c1                	faddp  %st,%st(1)
c0104026:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104029:	db 55 b8             	fistl  -0x48(%ebp)
c010402c:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010402f:	d9 ee                	fldz   
c0104031:	df e9                	fucomip %st(1),%st
c0104033:	0f 87 27 07 00 00    	ja     c0104760 <_dtoa_r+0x890>
c0104039:	dd d8                	fstp   %st(0)
c010403b:	83 7d b8 16          	cmpl   $0x16,-0x48(%ebp)
c010403f:	c7 45 9c 01 00 00 00 	movl   $0x1,-0x64(%ebp)
c0104046:	77 24                	ja     c010406c <_dtoa_r+0x19c>
c0104048:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010404b:	dd 04 c5 a0 90 10 c0 	fldl   -0x3fef6f60(,%eax,8)
c0104052:	dd 45 c0             	fldl   -0x40(%ebp)
c0104055:	d9 c9                	fxch   %st(1)
c0104057:	df e9                	fucomip %st(1),%st
c0104059:	dd d8                	fstp   %st(0)
c010405b:	0f 86 5f 07 00 00    	jbe    c01047c0 <_dtoa_r+0x8f0>
c0104061:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104065:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c010406c:	89 d0                	mov    %edx,%eax
c010406e:	29 d8                	sub    %ebx,%eax
c0104070:	83 e8 01             	sub    $0x1,%eax
c0104073:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%ebp)
c010407a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010407d:	0f 88 0d 07 00 00    	js     c0104790 <_dtoa_r+0x8c0>
c0104083:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104086:	85 c0                	test   %eax,%eax
c0104088:	0f 88 ea 06 00 00    	js     c0104778 <_dtoa_r+0x8a8>
c010408e:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104091:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104094:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010409b:	83 7d 14 09          	cmpl   $0x9,0x14(%ebp)
c010409f:	0f 87 0b 03 00 00    	ja     c01043b0 <_dtoa_r+0x4e0>
c01040a5:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01040a9:	0f 8e 23 10 00 00    	jle    c01050d2 <_dtoa_r+0x1202>
c01040af:	83 6d 14 04          	subl   $0x4,0x14(%ebp)
c01040b3:	31 c0                	xor    %eax,%eax
c01040b5:	83 7d 14 03          	cmpl   $0x3,0x14(%ebp)
c01040b9:	0f 84 43 0d 00 00    	je     c0104e02 <_dtoa_r+0xf32>
c01040bf:	0f 8e f3 00 00 00    	jle    c01041b8 <_dtoa_r+0x2e8>
c01040c5:	83 7d 14 04          	cmpl   $0x4,0x14(%ebp)
c01040c9:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c01040d0:	0f 84 f3 00 00 00    	je     c01041c9 <_dtoa_r+0x2f9>
c01040d6:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
c01040da:	0f 85 d7 02 00 00    	jne    c01043b7 <_dtoa_r+0x4e7>
c01040e0:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c01040e3:	03 5d 18             	add    0x18(%ebp),%ebx
c01040e6:	89 5d 90             	mov    %ebx,-0x70(%ebp)
c01040e9:	83 c3 01             	add    $0x1,%ebx
c01040ec:	83 fb 0e             	cmp    $0xe,%ebx
c01040ef:	0f 96 c2             	setbe  %dl
c01040f2:	85 db                	test   %ebx,%ebx
c01040f4:	89 5d a8             	mov    %ebx,-0x58(%ebp)
c01040f7:	0f 8e a7 08 00 00    	jle    c01049a4 <_dtoa_r+0xad4>
c01040fd:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104100:	83 fb 0e             	cmp    $0xe,%ebx
c0104103:	89 df                	mov    %ebx,%edi
c0104105:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c0104109:	20 45 b4             	and    %al,-0x4c(%ebp)
c010410c:	e9 d6 00 00 00       	jmp    c01041e7 <_dtoa_r+0x317>
c0104111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104118:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010411b:	8b 45 1c             	mov    0x1c(%ebp),%eax
c010411e:	85 d2                	test   %edx,%edx
c0104120:	c7 00 0f 27 00 00    	movl   $0x270f,(%eax)
c0104126:	b8 c1 8f 10 c0       	mov    $0xc0108fc1,%eax
c010412b:	74 43                	je     c0104170 <_dtoa_r+0x2a0>
c010412d:	8b 5d 24             	mov    0x24(%ebp),%ebx
c0104130:	85 db                	test   %ebx,%ebx
c0104132:	0f 84 30 fe ff ff    	je     c0103f68 <_dtoa_r+0x98>
c0104138:	8b 75 24             	mov    0x24(%ebp),%esi
c010413b:	8d 50 08             	lea    0x8(%eax),%edx
c010413e:	80 78 03 00          	cmpb   $0x0,0x3(%eax)
c0104142:	8d 48 03             	lea    0x3(%eax),%ecx
c0104145:	0f 44 d1             	cmove  %ecx,%edx
c0104148:	89 16                	mov    %edx,(%esi)
c010414a:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0104150:	5b                   	pop    %ebx
c0104151:	5e                   	pop    %esi
c0104152:	5f                   	pop    %edi
c0104153:	5d                   	pop    %ebp
c0104154:	c3                   	ret    
c0104155:	8d 76 00             	lea    0x0(%esi),%esi
c0104158:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
c010415e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
c0104164:	89 7d c4             	mov    %edi,-0x3c(%ebp)
c0104167:	e9 b7 fd ff ff       	jmp    c0103f23 <_dtoa_r+0x53>
c010416c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104170:	81 e7 ff ff 0f 00    	and    $0xfffff,%edi
c0104176:	ba b8 8f 10 c0       	mov    $0xc0108fb8,%edx
c010417b:	0f 44 c2             	cmove  %edx,%eax
c010417e:	eb ad                	jmp    c010412d <_dtoa_r+0x25d>
c0104180:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0104183:	81 eb ff 03 00 00    	sub    $0x3ff,%ebx
c0104189:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010418c:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104193:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0104198:	0d 00 00 f0 3f       	or     $0x3ff00000,%eax
c010419d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01041a0:	e9 51 fe ff ff       	jmp    c0103ff6 <_dtoa_r+0x126>
c01041a5:	8d 76 00             	lea    0x0(%esi),%esi
c01041a8:	b8 c9 85 10 c0       	mov    $0xc01085c9,%eax
c01041ad:	e9 b6 fd ff ff       	jmp    c0103f68 <_dtoa_r+0x98>
c01041b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01041b8:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c01041bc:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c01041c3:	0f 85 ee 01 00 00    	jne    c01043b7 <_dtoa_r+0x4e7>
c01041c9:	8b 55 18             	mov    0x18(%ebp),%edx
c01041cc:	85 d2                	test   %edx,%edx
c01041ce:	0f 8e b6 07 00 00    	jle    c010498a <_dtoa_r+0xaba>
c01041d4:	8b 7d 18             	mov    0x18(%ebp),%edi
c01041d7:	83 ff 0e             	cmp    $0xe,%edi
c01041da:	0f 96 45 b4          	setbe  -0x4c(%ebp)
c01041de:	20 45 b4             	and    %al,-0x4c(%ebp)
c01041e1:	89 7d 90             	mov    %edi,-0x70(%ebp)
c01041e4:	89 7d a8             	mov    %edi,-0x58(%ebp)
c01041e7:	83 ff 17             	cmp    $0x17,%edi
c01041ea:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01041f1:	0f 86 e5 0e 00 00    	jbe    c01050dc <_dtoa_r+0x120c>
c01041f7:	b9 01 00 00 00       	mov    $0x1,%ecx
c01041fc:	b8 04 00 00 00       	mov    $0x4,%eax
c0104201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104208:	01 c0                	add    %eax,%eax
c010420a:	89 ca                	mov    %ecx,%edx
c010420c:	8d 58 14             	lea    0x14(%eax),%ebx
c010420f:	39 fb                	cmp    %edi,%ebx
c0104211:	8d 49 01             	lea    0x1(%ecx),%ecx
c0104214:	76 f2                	jbe    c0104208 <_dtoa_r+0x338>
c0104216:	89 56 44             	mov    %edx,0x44(%esi)
c0104219:	89 54 24 04          	mov    %edx,0x4(%esp)
c010421d:	89 34 24             	mov    %esi,(%esp)
c0104220:	e8 db 17 00 00       	call   c0105a00 <_Balloc>
c0104225:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
c0104229:	89 c7                	mov    %eax,%edi
c010422b:	89 46 40             	mov    %eax,0x40(%esi)
c010422e:	0f 84 bb 01 00 00    	je     c01043ef <_dtoa_r+0x51f>
c0104234:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0104237:	dd 45 c0             	fldl   -0x40(%ebp)
c010423a:	85 db                	test   %ebx,%ebx
c010423c:	0f 8e de 07 00 00    	jle    c0104a20 <_dtoa_r+0xb50>
c0104242:	89 d8                	mov    %ebx,%eax
c0104244:	83 e0 0f             	and    $0xf,%eax
c0104247:	dd 04 c5 a0 90 10 c0 	fldl   -0x3fef6f60(,%eax,8)
c010424e:	89 d8                	mov    %ebx,%eax
c0104250:	c1 f8 04             	sar    $0x4,%eax
c0104253:	a8 10                	test   $0x10,%al
c0104255:	0f 84 cd 05 00 00    	je     c0104828 <_dtoa_r+0x958>
c010425b:	dd 05 80 90 10 c0    	fldl   0xc0109080
c0104261:	83 e0 0f             	and    $0xf,%eax
c0104264:	b9 03 00 00 00       	mov    $0x3,%ecx
c0104269:	d8 fa                	fdivr  %st(2),%st
c010426b:	85 c0                	test   %eax,%eax
c010426d:	74 22                	je     c0104291 <_dtoa_r+0x3c1>
c010426f:	31 d2                	xor    %edx,%edx
c0104271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104278:	a8 01                	test   $0x1,%al
c010427a:	74 0e                	je     c010428a <_dtoa_r+0x3ba>
c010427c:	d9 c9                	fxch   %st(1)
c010427e:	dc 0c d5 60 90 10 c0 	fmull  -0x3fef6fa0(,%edx,8)
c0104285:	d9 c9                	fxch   %st(1)
c0104287:	83 c1 01             	add    $0x1,%ecx
c010428a:	83 c2 01             	add    $0x1,%edx
c010428d:	d1 f8                	sar    %eax
c010428f:	75 e7                	jne    c0104278 <_dtoa_r+0x3a8>
c0104291:	de f1                	fdivp  %st,%st(1)
c0104293:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0104296:	85 c0                	test   %eax,%eax
c0104298:	74 0a                	je     c01042a4 <_dtoa_r+0x3d4>
c010429a:	d9 e8                	fld1   
c010429c:	df e9                	fucomip %st(1),%st
c010429e:	0f 87 92 0b 00 00    	ja     c0104e36 <_dtoa_r+0xf66>
c01042a4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c01042a7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01042aa:	db 45 d4             	fildl  -0x2c(%ebp)
c01042ad:	d8 c9                	fmul   %st(1),%st
c01042af:	d8 05 d4 8f 10 c0    	fadds  0xc0108fd4
c01042b5:	dd 5d c0             	fstpl  -0x40(%ebp)
c01042b8:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c01042bf:	85 c0                	test   %eax,%eax
c01042c1:	0f 84 89 05 00 00    	je     c0104850 <_dtoa_r+0x980>
c01042c7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01042ca:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01042cd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01042d0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01042d3:	85 c0                	test   %eax,%eax
c01042d5:	0f 84 b5 07 00 00    	je     c0104a90 <_dtoa_r+0xbc0>
c01042db:	d9 05 dc 8f 10 c0    	flds   0xc0108fdc
c01042e1:	8d 57 01             	lea    0x1(%edi),%edx
c01042e4:	dc 34 cd 98 90 10 c0 	fdivl  -0x3fef6f68(,%ecx,8)
c01042eb:	d9 7d d2             	fnstcw -0x2e(%ebp)
c01042ee:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01042f2:	b4 0c                	mov    $0xc,%ah
c01042f4:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c01042f8:	dc 65 c0             	fsubl  -0x40(%ebp)
c01042fb:	d9 c9                	fxch   %st(1)
c01042fd:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104300:	db 55 d4             	fistl  -0x2c(%ebp)
c0104303:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0104306:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104309:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010430c:	83 c0 30             	add    $0x30,%eax
c010430f:	db 45 d4             	fildl  -0x2c(%ebp)
c0104312:	de e9                	fsubrp %st,%st(1)
c0104314:	d9 c9                	fxch   %st(1)
c0104316:	88 07                	mov    %al,(%edi)
c0104318:	db e9                	fucomi %st(1),%st
c010431a:	77 7f                	ja     c010439b <_dtoa_r+0x4cb>
c010431c:	d9 c1                	fld    %st(1)
c010431e:	d8 2d cc 8f 10 c0    	fsubrs 0xc0108fcc
c0104324:	d9 c9                	fxch   %st(1)
c0104326:	db e9                	fucomi %st(1),%st
c0104328:	dd d9                	fstp   %st(1)
c010432a:	0f 87 33 0c 00 00    	ja     c0104f63 <_dtoa_r+0x1093>
c0104330:	83 f9 01             	cmp    $0x1,%ecx
c0104333:	0f 8e c4 06 00 00    	jle    c01049fd <_dtoa_r+0xb2d>
c0104339:	01 f9                	add    %edi,%ecx
c010433b:	d9 05 d0 8f 10 c0    	flds   0xc0108fd0
c0104341:	eb 25                	jmp    c0104368 <_dtoa_r+0x498>
c0104343:	90                   	nop
c0104344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104348:	d9 c1                	fld    %st(1)
c010434a:	d8 2d cc 8f 10 c0    	fsubrs 0xc0108fcc
c0104350:	d9 c9                	fxch   %st(1)
c0104352:	db e9                	fucomi %st(1),%st
c0104354:	dd d9                	fstp   %st(1)
c0104356:	0f 87 14 0c 00 00    	ja     c0104f70 <_dtoa_r+0x10a0>
c010435c:	39 ca                	cmp    %ecx,%edx
c010435e:	0f 84 a4 06 00 00    	je     c0104a08 <_dtoa_r+0xb38>
c0104364:	d9 c9                	fxch   %st(1)
c0104366:	d9 ca                	fxch   %st(2)
c0104368:	dc c9                	fmul   %st,%st(1)
c010436a:	83 c2 01             	add    $0x1,%edx
c010436d:	dc ca                	fmul   %st,%st(2)
c010436f:	d9 ca                	fxch   %st(2)
c0104371:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104374:	db 55 d4             	fistl  -0x2c(%ebp)
c0104377:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010437a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010437d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104380:	83 c0 30             	add    $0x30,%eax
c0104383:	db 45 d4             	fildl  -0x2c(%ebp)
c0104386:	de e9                	fsubrp %st,%st(1)
c0104388:	d9 c9                	fxch   %st(1)
c010438a:	88 42 ff             	mov    %al,-0x1(%edx)
c010438d:	db e9                	fucomi %st(1),%st
c010438f:	76 b7                	jbe    c0104348 <_dtoa_r+0x478>
c0104391:	dd d8                	fstp   %st(0)
c0104393:	dd d8                	fstp   %st(0)
c0104395:	dd d8                	fstp   %st(0)
c0104397:	dd d8                	fstp   %st(0)
c0104399:	eb 06                	jmp    c01043a1 <_dtoa_r+0x4d1>
c010439b:	dd d8                	fstp   %st(0)
c010439d:	dd d8                	fstp   %st(0)
c010439f:	dd d8                	fstp   %st(0)
c01043a1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01043a4:	89 fb                	mov    %edi,%ebx
c01043a6:	89 d7                	mov    %edx,%edi
c01043a8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01043ab:	e9 70 03 00 00       	jmp    c0104720 <_dtoa_r+0x850>
c01043b0:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
c01043b7:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01043be:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01043c5:	00 
c01043c6:	89 34 24             	mov    %esi,(%esp)
c01043c9:	e8 32 16 00 00       	call   c0105a00 <_Balloc>
c01043ce:	c7 45 98 01 00 00 00 	movl   $0x1,-0x68(%ebp)
c01043d5:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%ebp)
c01043dc:	c7 45 90 ff ff ff ff 	movl   $0xffffffff,-0x70(%ebp)
c01043e3:	c7 45 18 00 00 00 00 	movl   $0x0,0x18(%ebp)
c01043ea:	89 c7                	mov    %eax,%edi
c01043ec:	89 46 40             	mov    %eax,0x40(%esi)
c01043ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01043f2:	85 c0                	test   %eax,%eax
c01043f4:	0f 88 2e 01 00 00    	js     c0104528 <_dtoa_r+0x658>
c01043fa:	83 7d b8 0e          	cmpl   $0xe,-0x48(%ebp)
c01043fe:	0f 8f 24 01 00 00    	jg     c0104528 <_dtoa_r+0x658>
c0104404:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104407:	dd 04 c5 a0 90 10 c0 	fldl   -0x3fef6f60(,%eax,8)
c010440e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104411:	85 c0                	test   %eax,%eax
c0104413:	7f 0e                	jg     c0104423 <_dtoa_r+0x553>
c0104415:	8b 45 18             	mov    0x18(%ebp),%eax
c0104418:	c1 e8 1f             	shr    $0x1f,%eax
c010441b:	84 c0                	test   %al,%al
c010441d:	0f 85 9d 07 00 00    	jne    c0104bc0 <_dtoa_r+0xcf0>
c0104423:	dd 45 c0             	fldl   -0x40(%ebp)
c0104426:	d9 c0                	fld    %st(0)
c0104428:	d8 f2                	fdiv   %st(2),%st
c010442a:	d9 7d d2             	fnstcw -0x2e(%ebp)
c010442d:	83 7d a8 01          	cmpl   $0x1,-0x58(%ebp)
c0104431:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0104435:	b4 0c                	mov    $0xc,%ah
c0104437:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c010443b:	8d 47 01             	lea    0x1(%edi),%eax
c010443e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104441:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104444:	db 5d d4             	fistpl -0x2c(%ebp)
c0104447:	d9 6d d2             	fldcw  -0x2e(%ebp)
c010444a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010444d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0104450:	8d 42 30             	lea    0x30(%edx),%eax
c0104453:	db 45 d4             	fildl  -0x2c(%ebp)
c0104456:	d8 ca                	fmul   %st(2),%st
c0104458:	88 07                	mov    %al,(%edi)
c010445a:	de e9                	fsubrp %st,%st(1)
c010445c:	74 66                	je     c01044c4 <_dtoa_r+0x5f4>
c010445e:	d8 0d d0 8f 10 c0    	fmuls  0xc0108fd0
c0104464:	d9 ee                	fldz   
c0104466:	d9 c9                	fxch   %st(1)
c0104468:	db e9                	fucomi %st(1),%st
c010446a:	dd d9                	fstp   %st(1)
c010446c:	0f 8b 33 0c 00 00    	jnp    c01050a5 <_dtoa_r+0x11d5>
c0104472:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104475:	8d 47 02             	lea    0x2(%edi),%eax
c0104478:	d9 05 d0 8f 10 c0    	flds   0xc0108fd0
c010447e:	01 fb                	add    %edi,%ebx
c0104480:	eb 19                	jmp    c010449b <_dtoa_r+0x5cb>
c0104482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104488:	dc c9                	fmul   %st,%st(1)
c010448a:	83 c0 01             	add    $0x1,%eax
c010448d:	d9 ee                	fldz   
c010448f:	d9 ca                	fxch   %st(2)
c0104491:	db ea                	fucomi %st(2),%st
c0104493:	dd da                	fstp   %st(2)
c0104495:	0f 8b 73 09 00 00    	jnp    c0104e0e <_dtoa_r+0xf3e>
c010449b:	d9 c1                	fld    %st(1)
c010449d:	39 d8                	cmp    %ebx,%eax
c010449f:	d8 f3                	fdiv   %st(3),%st
c01044a1:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01044a4:	d9 6d d0             	fldcw  -0x30(%ebp)
c01044a7:	db 5d d4             	fistpl -0x2c(%ebp)
c01044aa:	d9 6d d2             	fldcw  -0x2e(%ebp)
c01044ad:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01044b0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c01044b3:	8d 4a 30             	lea    0x30(%edx),%ecx
c01044b6:	db 45 d4             	fildl  -0x2c(%ebp)
c01044b9:	d8 cb                	fmul   %st(3),%st
c01044bb:	88 48 ff             	mov    %cl,-0x1(%eax)
c01044be:	de ea                	fsubrp %st,%st(2)
c01044c0:	75 c6                	jne    c0104488 <_dtoa_r+0x5b8>
c01044c2:	dd d8                	fstp   %st(0)
c01044c4:	d8 c0                	fadd   %st(0),%st
c01044c6:	db e9                	fucomi %st(1),%st
c01044c8:	77 1e                	ja     c01044e8 <_dtoa_r+0x618>
c01044ca:	d9 c9                	fxch   %st(1)
c01044cc:	df e9                	fucomip %st(1),%st
c01044ce:	dd d8                	fstp   %st(0)
c01044d0:	0f 8a 44 09 00 00    	jp     c0104e1a <_dtoa_r+0xf4a>
c01044d6:	0f 85 3e 09 00 00    	jne    c0104e1a <_dtoa_r+0xf4a>
c01044dc:	83 e2 01             	and    $0x1,%edx
c01044df:	90                   	nop
c01044e0:	0f 84 34 09 00 00    	je     c0104e1a <_dtoa_r+0xf4a>
c01044e6:	eb 04                	jmp    c01044ec <_dtoa_r+0x61c>
c01044e8:	dd d8                	fstp   %st(0)
c01044ea:	dd d8                	fstp   %st(0)
c01044ec:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c01044ef:	89 fb                	mov    %edi,%ebx
c01044f1:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
c01044f5:	89 cf                	mov    %ecx,%edi
c01044f7:	8b 4d b8             	mov    -0x48(%ebp),%ecx
c01044fa:	89 4d b4             	mov    %ecx,-0x4c(%ebp)
c01044fd:	eb 0f                	jmp    c010450e <_dtoa_r+0x63e>
c01044ff:	90                   	nop
c0104500:	39 d3                	cmp    %edx,%ebx
c0104502:	0f 84 75 09 00 00    	je     c0104e7d <_dtoa_r+0xfad>
c0104508:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c010450c:	89 d7                	mov    %edx,%edi
c010450e:	3c 39                	cmp    $0x39,%al
c0104510:	8d 57 ff             	lea    -0x1(%edi),%edx
c0104513:	74 eb                	je     c0104500 <_dtoa_r+0x630>
c0104515:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104518:	83 c0 01             	add    $0x1,%eax
c010451b:	88 02                	mov    %al,(%edx)
c010451d:	89 4d b8             	mov    %ecx,-0x48(%ebp)
c0104520:	e9 fb 01 00 00       	jmp    c0104720 <_dtoa_r+0x850>
c0104525:	8d 76 00             	lea    0x0(%esi),%esi
c0104528:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010452b:	85 c9                	test   %ecx,%ecx
c010452d:	0f 85 9d 02 00 00    	jne    c01047d0 <_dtoa_r+0x900>
c0104533:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104536:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104539:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104540:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104543:	85 c0                	test   %eax,%eax
c0104545:	7e 14                	jle    c010455b <_dtoa_r+0x68b>
c0104547:	85 db                	test   %ebx,%ebx
c0104549:	7e 10                	jle    c010455b <_dtoa_r+0x68b>
c010454b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010454e:	39 d8                	cmp    %ebx,%eax
c0104550:	0f 4f c3             	cmovg  %ebx,%eax
c0104553:	29 45 a0             	sub    %eax,-0x60(%ebp)
c0104556:	29 c3                	sub    %eax,%ebx
c0104558:	29 45 ac             	sub    %eax,-0x54(%ebp)
c010455b:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010455e:	85 c0                	test   %eax,%eax
c0104560:	7e 61                	jle    c01045c3 <_dtoa_r+0x6f3>
c0104562:	8b 45 98             	mov    -0x68(%ebp),%eax
c0104565:	85 c0                	test   %eax,%eax
c0104567:	0f 84 72 04 00 00    	je     c01049df <_dtoa_r+0xb0f>
c010456d:	85 d2                	test   %edx,%edx
c010456f:	7e 47                	jle    c01045b8 <_dtoa_r+0x6e8>
c0104571:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104574:	89 54 24 08          	mov    %edx,0x8(%esp)
c0104578:	89 34 24             	mov    %esi,(%esp)
c010457b:	89 55 88             	mov    %edx,-0x78(%ebp)
c010457e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104582:	e8 f9 19 00 00       	call   c0105f80 <__pow5mult>
c0104587:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c010458a:	89 34 24             	mov    %esi,(%esp)
c010458d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104591:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104595:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104598:	e8 13 18 00 00       	call   c0105db0 <__multiply>
c010459d:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
c01045a0:	89 34 24             	mov    %esi,(%esp)
c01045a3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01045a7:	89 45 8c             	mov    %eax,-0x74(%ebp)
c01045aa:	e8 f1 14 00 00       	call   c0105aa0 <_Bfree>
c01045af:	8b 45 8c             	mov    -0x74(%ebp),%eax
c01045b2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01045b5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01045b8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01045bb:	29 d0                	sub    %edx,%eax
c01045bd:	0f 85 1f 04 00 00    	jne    c01049e2 <_dtoa_r+0xb12>
c01045c3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01045ca:	00 
c01045cb:	89 34 24             	mov    %esi,(%esp)
c01045ce:	e8 ad 17 00 00       	call   c0105d80 <__i2b>
c01045d3:	8b 4d 94             	mov    -0x6c(%ebp),%ecx
c01045d6:	85 c9                	test   %ecx,%ecx
c01045d8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01045db:	7e 13                	jle    c01045f0 <_dtoa_r+0x720>
c01045dd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01045e1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01045e5:	89 34 24             	mov    %esi,(%esp)
c01045e8:	e8 93 19 00 00       	call   c0105f80 <__pow5mult>
c01045ed:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01045f0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c01045f4:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c01045fb:	0f 8e f7 05 00 00    	jle    c0104bf8 <_dtoa_r+0xd28>
c0104601:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104604:	ba 01 00 00 00       	mov    $0x1,%edx
c0104609:	85 c0                	test   %eax,%eax
c010460b:	0f 85 27 05 00 00    	jne    c0104b38 <_dtoa_r+0xc68>
c0104611:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104614:	01 d0                	add    %edx,%eax
c0104616:	83 e0 1f             	and    $0x1f,%eax
c0104619:	89 c2                	mov    %eax,%edx
c010461b:	0f 84 57 03 00 00    	je     c0104978 <_dtoa_r+0xaa8>
c0104621:	b8 20 00 00 00       	mov    $0x20,%eax
c0104626:	29 d0                	sub    %edx,%eax
c0104628:	83 f8 04             	cmp    $0x4,%eax
c010462b:	0f 8e 8c 0a 00 00    	jle    c01050bd <_dtoa_r+0x11ed>
c0104631:	b8 1c 00 00 00       	mov    $0x1c,%eax
c0104636:	29 d0                	sub    %edx,%eax
c0104638:	01 45 a0             	add    %eax,-0x60(%ebp)
c010463b:	01 c3                	add    %eax,%ebx
c010463d:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104640:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0104643:	85 c0                	test   %eax,%eax
c0104645:	7e 16                	jle    c010465d <_dtoa_r+0x78d>
c0104647:	89 44 24 08          	mov    %eax,0x8(%esp)
c010464b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010464e:	89 34 24             	mov    %esi,(%esp)
c0104651:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104655:	e8 46 1a 00 00       	call   c01060a0 <__lshift>
c010465a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010465d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104660:	85 c0                	test   %eax,%eax
c0104662:	7e 16                	jle    c010467a <_dtoa_r+0x7aa>
c0104664:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104668:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010466b:	89 34 24             	mov    %esi,(%esp)
c010466e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104672:	e8 29 1a 00 00       	call   c01060a0 <__lshift>
c0104677:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010467a:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010467d:	85 c0                	test   %eax,%eax
c010467f:	0f 85 d3 04 00 00    	jne    c0104b58 <_dtoa_r+0xc88>
c0104685:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104689:	0f 8e 11 02 00 00    	jle    c01048a0 <_dtoa_r+0x9d0>
c010468f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104692:	85 c0                	test   %eax,%eax
c0104694:	0f 8f 06 02 00 00    	jg     c01048a0 <_dtoa_r+0x9d0>
c010469a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010469d:	85 c0                	test   %eax,%eax
c010469f:	0f 85 e0 01 00 00    	jne    c0104885 <_dtoa_r+0x9b5>
c01046a5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01046a8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01046af:	00 
c01046b0:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
c01046b7:	00 
c01046b8:	89 34 24             	mov    %esi,(%esp)
c01046bb:	89 44 24 04          	mov    %eax,0x4(%esp)
c01046bf:	e8 fc 13 00 00       	call   c0105ac0 <__multadd>
c01046c4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01046c7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01046cb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01046ce:	89 04 24             	mov    %eax,(%esp)
c01046d1:	e8 ea 1a 00 00       	call   c01061c0 <__mcmp>
c01046d6:	85 c0                	test   %eax,%eax
c01046d8:	0f 8e a7 01 00 00    	jle    c0104885 <_dtoa_r+0x9b5>
c01046de:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c01046e2:	89 fb                	mov    %edi,%ebx
c01046e4:	83 c7 01             	add    $0x1,%edi
c01046e7:	c6 47 ff 31          	movb   $0x31,-0x1(%edi)
c01046eb:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c01046f2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01046f5:	89 34 24             	mov    %esi,(%esp)
c01046f8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01046fc:	e8 9f 13 00 00       	call   c0105aa0 <_Bfree>
c0104701:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104704:	85 c0                	test   %eax,%eax
c0104706:	74 18                	je     c0104720 <_dtoa_r+0x850>
c0104708:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c010470b:	0f 85 a7 02 00 00    	jne    c01049b8 <_dtoa_r+0xae8>
c0104711:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104714:	89 34 24             	mov    %esi,(%esp)
c0104717:	89 44 24 04          	mov    %eax,0x4(%esp)
c010471b:	e8 80 13 00 00       	call   c0105aa0 <_Bfree>
c0104720:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104723:	89 34 24             	mov    %esi,(%esp)
c0104726:	89 44 24 04          	mov    %eax,0x4(%esp)
c010472a:	e8 71 13 00 00       	call   c0105aa0 <_Bfree>
c010472f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104732:	8b 75 1c             	mov    0x1c(%ebp),%esi
c0104735:	c6 07 00             	movb   $0x0,(%edi)
c0104738:	83 c0 01             	add    $0x1,%eax
c010473b:	89 06                	mov    %eax,(%esi)
c010473d:	8b 45 24             	mov    0x24(%ebp),%eax
c0104740:	85 c0                	test   %eax,%eax
c0104742:	0f 84 90 02 00 00    	je     c01049d8 <_dtoa_r+0xb08>
c0104748:	8b 45 24             	mov    0x24(%ebp),%eax
c010474b:	89 38                	mov    %edi,(%eax)
c010474d:	81 c4 8c 00 00 00    	add    $0x8c,%esp
c0104753:	89 d8                	mov    %ebx,%eax
c0104755:	5b                   	pop    %ebx
c0104756:	5e                   	pop    %esi
c0104757:	5f                   	pop    %edi
c0104758:	5d                   	pop    %ebp
c0104759:	c3                   	ret    
c010475a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104760:	db 45 b8             	fildl  -0x48(%ebp)
c0104763:	df e9                	fucomip %st(1),%st
c0104765:	dd d8                	fstp   %st(0)
c0104767:	7a 06                	jp     c010476f <_dtoa_r+0x89f>
c0104769:	0f 84 cc f8 ff ff    	je     c010403b <_dtoa_r+0x16b>
c010476f:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104773:	e9 c3 f8 ff ff       	jmp    c010403b <_dtoa_r+0x16b>
c0104778:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010477b:	29 45 a0             	sub    %eax,-0x60(%ebp)
c010477e:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c0104785:	f7 d8                	neg    %eax
c0104787:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010478a:	e9 0c f9 ff ff       	jmp    c010409b <_dtoa_r+0x1cb>
c010478f:	90                   	nop
c0104790:	f7 d8                	neg    %eax
c0104792:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104795:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
c010479c:	e9 e2 f8 ff ff       	jmp    c0104083 <_dtoa_r+0x1b3>
c01047a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01047a8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01047ab:	b9 ee fb ff ff       	mov    $0xfffffbee,%ecx
c01047b0:	29 d9                	sub    %ebx,%ecx
c01047b2:	d3 e0                	shl    %cl,%eax
c01047b4:	e9 1b f8 ff ff       	jmp    c0103fd4 <_dtoa_r+0x104>
c01047b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01047c0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c01047c7:	e9 a0 f8 ff ff       	jmp    c010406c <_dtoa_r+0x19c>
c01047cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01047d0:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
c01047d4:	0f 8e fe 06 00 00    	jle    c0104ed8 <_dtoa_r+0x1008>
c01047da:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01047dd:	83 e8 01             	sub    $0x1,%eax
c01047e0:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c01047e3:	0f 8c 3b 06 00 00    	jl     c0104e24 <_dtoa_r+0xf54>
c01047e9:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01047ec:	29 c2                	sub    %eax,%edx
c01047ee:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01047f1:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c01047f4:	85 c9                	test   %ecx,%ecx
c01047f6:	89 c8                	mov    %ecx,%eax
c01047f8:	0f 88 83 07 00 00    	js     c0104f81 <_dtoa_r+0x10b1>
c01047fe:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0104805:	00 
c0104806:	89 34 24             	mov    %esi,(%esp)
c0104809:	89 55 8c             	mov    %edx,-0x74(%ebp)
c010480c:	01 45 a0             	add    %eax,-0x60(%ebp)
c010480f:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104812:	e8 69 15 00 00       	call   c0105d80 <__i2b>
c0104817:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010481a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010481d:	e9 1e fd ff ff       	jmp    c0104540 <_dtoa_r+0x670>
c0104822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104828:	d9 c1                	fld    %st(1)
c010482a:	b9 02 00 00 00       	mov    $0x2,%ecx
c010482f:	e9 37 fa ff ff       	jmp    c010426b <_dtoa_r+0x39b>
c0104834:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104837:	db 45 d4             	fildl  -0x2c(%ebp)
c010483a:	d8 c9                	fmul   %st(1),%st
c010483c:	d8 05 d4 8f 10 c0    	fadds  0xc0108fd4
c0104842:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104845:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c010484c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104850:	d8 25 d8 8f 10 c0    	fsubs  0xc0108fd8
c0104856:	dd 45 c0             	fldl   -0x40(%ebp)
c0104859:	d9 c9                	fxch   %st(1)
c010485b:	db e9                	fucomi %st(1),%st
c010485d:	0f 87 0d 02 00 00    	ja     c0104a70 <_dtoa_r+0xba0>
c0104863:	d9 c9                	fxch   %st(1)
c0104865:	d9 e0                	fchs   
c0104867:	df e9                	fucomip %st(1),%st
c0104869:	dd d8                	fstp   %st(0)
c010486b:	0f 86 a7 01 00 00    	jbe    c0104a18 <_dtoa_r+0xb48>
c0104871:	dd d8                	fstp   %st(0)
c0104873:	eb 02                	jmp    c0104877 <_dtoa_r+0x9a7>
c0104875:	dd d8                	fstp   %st(0)
c0104877:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010487e:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104885:	8b 45 18             	mov    0x18(%ebp),%eax
c0104888:	89 fb                	mov    %edi,%ebx
c010488a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c0104891:	f7 d0                	not    %eax
c0104893:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104896:	e9 57 fe ff ff       	jmp    c01046f2 <_dtoa_r+0x822>
c010489b:	90                   	nop
c010489c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01048a0:	8b 45 98             	mov    -0x68(%ebp),%eax
c01048a3:	85 c0                	test   %eax,%eax
c01048a5:	0f 85 c5 03 00 00    	jne    c0104c70 <_dtoa_r+0xda0>
c01048ab:	89 75 08             	mov    %esi,0x8(%ebp)
c01048ae:	bb 01 00 00 00       	mov    $0x1,%ebx
c01048b3:	8b 75 a4             	mov    -0x5c(%ebp),%esi
c01048b6:	eb 24                	jmp    c01048dc <_dtoa_r+0xa0c>
c01048b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01048bb:	83 c3 01             	add    $0x1,%ebx
c01048be:	89 74 24 04          	mov    %esi,0x4(%esp)
c01048c2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01048c9:	00 
c01048ca:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c01048d1:	00 
c01048d2:	89 04 24             	mov    %eax,(%esp)
c01048d5:	e8 e6 11 00 00       	call   c0105ac0 <__multadd>
c01048da:	89 c6                	mov    %eax,%esi
c01048dc:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01048df:	89 f0                	mov    %esi,%eax
c01048e1:	e8 1a f4 ff ff       	call   c0103d00 <quorem>
c01048e6:	83 c0 30             	add    $0x30,%eax
c01048e9:	3b 5d a8             	cmp    -0x58(%ebp),%ebx
c01048ec:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
c01048f0:	7c c6                	jl     c01048b8 <_dtoa_r+0x9e8>
c01048f2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01048f5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01048f8:	ba 01 00 00 00       	mov    $0x1,%edx
c01048fd:	89 75 a4             	mov    %esi,-0x5c(%ebp)
c0104900:	8b 75 08             	mov    0x8(%ebp),%esi
c0104903:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
c010490a:	85 c0                	test   %eax,%eax
c010490c:	0f 4f d0             	cmovg  %eax,%edx
c010490f:	01 fa                	add    %edi,%edx
c0104911:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104914:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c010491b:	00 
c010491c:	89 34 24             	mov    %esi,(%esp)
c010491f:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0104922:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104926:	e8 75 17 00 00       	call   c01060a0 <__lshift>
c010492b:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c010492e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104932:	89 04 24             	mov    %eax,(%esp)
c0104935:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104938:	e8 83 18 00 00       	call   c01061c0 <__mcmp>
c010493d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0104940:	83 f8 00             	cmp    $0x0,%eax
c0104943:	0f 8e 41 06 00 00    	jle    c0104f8a <_dtoa_r+0x10ba>
c0104949:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
c010494d:	eb 0f                	jmp    c010495e <_dtoa_r+0xa8e>
c010494f:	90                   	nop
c0104950:	39 c7                	cmp    %eax,%edi
c0104952:	0f 84 70 05 00 00    	je     c0104ec8 <_dtoa_r+0xff8>
c0104958:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
c010495c:	89 c2                	mov    %eax,%edx
c010495e:	80 f9 39             	cmp    $0x39,%cl
c0104961:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104964:	74 ea                	je     c0104950 <_dtoa_r+0xa80>
c0104966:	83 c1 01             	add    $0x1,%ecx
c0104969:	89 fb                	mov    %edi,%ebx
c010496b:	88 08                	mov    %cl,(%eax)
c010496d:	89 d7                	mov    %edx,%edi
c010496f:	e9 7e fd ff ff       	jmp    c01046f2 <_dtoa_r+0x822>
c0104974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104978:	b8 1c 00 00 00       	mov    $0x1c,%eax
c010497d:	01 45 a0             	add    %eax,-0x60(%ebp)
c0104980:	01 c3                	add    %eax,%ebx
c0104982:	01 45 ac             	add    %eax,-0x54(%ebp)
c0104985:	e9 b6 fc ff ff       	jmp    c0104640 <_dtoa_r+0x770>
c010498a:	ba 01 00 00 00       	mov    $0x1,%edx
c010498f:	c7 45 90 01 00 00 00 	movl   $0x1,-0x70(%ebp)
c0104996:	c7 45 a8 01 00 00 00 	movl   $0x1,-0x58(%ebp)
c010499d:	c7 45 18 01 00 00 00 	movl   $0x1,0x18(%ebp)
c01049a4:	21 c2                	and    %eax,%edx
c01049a6:	88 55 b4             	mov    %dl,-0x4c(%ebp)
c01049a9:	31 d2                	xor    %edx,%edx
c01049ab:	c7 46 44 00 00 00 00 	movl   $0x0,0x44(%esi)
c01049b2:	e9 62 f8 ff ff       	jmp    c0104219 <_dtoa_r+0x349>
c01049b7:	90                   	nop
c01049b8:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01049bb:	85 d2                	test   %edx,%edx
c01049bd:	0f 84 4e fd ff ff    	je     c0104711 <_dtoa_r+0x841>
c01049c3:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01049c6:	89 34 24             	mov    %esi,(%esp)
c01049c9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01049cd:	e8 ce 10 00 00       	call   c0105aa0 <_Bfree>
c01049d2:	e9 3a fd ff ff       	jmp    c0104711 <_dtoa_r+0x841>
c01049d7:	90                   	nop
c01049d8:	89 d8                	mov    %ebx,%eax
c01049da:	e9 89 f5 ff ff       	jmp    c0103f68 <_dtoa_r+0x98>
c01049df:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01049e2:	89 44 24 08          	mov    %eax,0x8(%esp)
c01049e6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01049e9:	89 34 24             	mov    %esi,(%esp)
c01049ec:	89 44 24 04          	mov    %eax,0x4(%esp)
c01049f0:	e8 8b 15 00 00       	call   c0105f80 <__pow5mult>
c01049f5:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01049f8:	e9 c6 fb ff ff       	jmp    c01045c3 <_dtoa_r+0x6f3>
c01049fd:	dd d8                	fstp   %st(0)
c01049ff:	dd d8                	fstp   %st(0)
c0104a01:	eb 15                	jmp    c0104a18 <_dtoa_r+0xb48>
c0104a03:	90                   	nop
c0104a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104a08:	dd d8                	fstp   %st(0)
c0104a0a:	dd d8                	fstp   %st(0)
c0104a0c:	dd d8                	fstp   %st(0)
c0104a0e:	eb 08                	jmp    c0104a18 <_dtoa_r+0xb48>
c0104a10:	dd d8                	fstp   %st(0)
c0104a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104a18:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104a1b:	e9 cf f9 ff ff       	jmp    c01043ef <_dtoa_r+0x51f>
c0104a20:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104a23:	f7 d8                	neg    %eax
c0104a25:	0f 84 6a 04 00 00    	je     c0104e95 <_dtoa_r+0xfc5>
c0104a2b:	89 c2                	mov    %eax,%edx
c0104a2d:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104a32:	83 e2 0f             	and    $0xf,%edx
c0104a35:	c1 f8 04             	sar    $0x4,%eax
c0104a38:	dd 04 d5 a0 90 10 c0 	fldl   -0x3fef6f60(,%edx,8)
c0104a3f:	85 c0                	test   %eax,%eax
c0104a41:	d8 c9                	fmul   %st(1),%st
c0104a43:	0f 84 4a f8 ff ff    	je     c0104293 <_dtoa_r+0x3c3>
c0104a49:	31 d2                	xor    %edx,%edx
c0104a4b:	90                   	nop
c0104a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104a50:	a8 01                	test   $0x1,%al
c0104a52:	74 0a                	je     c0104a5e <_dtoa_r+0xb8e>
c0104a54:	dc 0c d5 60 90 10 c0 	fmull  -0x3fef6fa0(,%edx,8)
c0104a5b:	83 c1 01             	add    $0x1,%ecx
c0104a5e:	83 c2 01             	add    $0x1,%edx
c0104a61:	d1 f8                	sar    %eax
c0104a63:	75 eb                	jne    c0104a50 <_dtoa_r+0xb80>
c0104a65:	e9 29 f8 ff ff       	jmp    c0104293 <_dtoa_r+0x3c3>
c0104a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0104a70:	dd d8                	fstp   %st(0)
c0104a72:	dd d8                	fstp   %st(0)
c0104a74:	dd d8                	fstp   %st(0)
c0104a76:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0104a7d:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104a84:	e9 55 fc ff ff       	jmp    c01046de <_dtoa_r+0x80e>
c0104a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104a90:	d9 7d d2             	fnstcw -0x2e(%ebp)
c0104a93:	8d 41 ff             	lea    -0x1(%ecx),%eax
c0104a96:	dd 45 c0             	fldl   -0x40(%ebp)
c0104a99:	dc 0c c5 a0 90 10 c0 	fmull  -0x3fef6f60(,%eax,8)
c0104aa0:	d9 c9                	fxch   %st(1)
c0104aa2:	89 45 88             	mov    %eax,-0x78(%ebp)
c0104aa5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c0104aa9:	8d 57 01             	lea    0x1(%edi),%edx
c0104aac:	8d 1c 0f             	lea    (%edi,%ecx,1),%ebx
c0104aaf:	b4 0c                	mov    $0xc,%ah
c0104ab1:	66 89 45 d0          	mov    %ax,-0x30(%ebp)
c0104ab5:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104ab8:	db 55 d4             	fistl  -0x2c(%ebp)
c0104abb:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0104abe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104ac1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104ac4:	83 c0 30             	add    $0x30,%eax
c0104ac7:	83 f9 01             	cmp    $0x1,%ecx
c0104aca:	db 45 d4             	fildl  -0x2c(%ebp)
c0104acd:	de e9                	fsubrp %st,%st(1)
c0104acf:	88 07                	mov    %al,(%edi)
c0104ad1:	89 d0                	mov    %edx,%eax
c0104ad3:	74 37                	je     c0104b0c <_dtoa_r+0xc3c>
c0104ad5:	d9 05 d0 8f 10 c0    	flds   0xc0108fd0
c0104adb:	eb 05                	jmp    c0104ae2 <_dtoa_r+0xc12>
c0104add:	8d 76 00             	lea    0x0(%esi),%esi
c0104ae0:	d9 c9                	fxch   %st(1)
c0104ae2:	dc c9                	fmul   %st,%st(1)
c0104ae4:	d9 c9                	fxch   %st(1)
c0104ae6:	83 c0 01             	add    $0x1,%eax
c0104ae9:	d9 6d d0             	fldcw  -0x30(%ebp)
c0104aec:	db 55 d4             	fistl  -0x2c(%ebp)
c0104aef:	d9 6d d2             	fldcw  -0x2e(%ebp)
c0104af2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c0104af5:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104af8:	83 c1 30             	add    $0x30,%ecx
c0104afb:	39 d8                	cmp    %ebx,%eax
c0104afd:	db 45 d4             	fildl  -0x2c(%ebp)
c0104b00:	de e9                	fsubrp %st,%st(1)
c0104b02:	88 48 ff             	mov    %cl,-0x1(%eax)
c0104b05:	75 d9                	jne    c0104ae0 <_dtoa_r+0xc10>
c0104b07:	dd d9                	fstp   %st(1)
c0104b09:	03 55 88             	add    -0x78(%ebp),%edx
c0104b0c:	d9 05 dc 8f 10 c0    	flds   0xc0108fdc
c0104b12:	d9 c2                	fld    %st(2)
c0104b14:	d8 c1                	fadd   %st(1),%st
c0104b16:	d9 ca                	fxch   %st(2)
c0104b18:	db ea                	fucomi %st(2),%st
c0104b1a:	dd da                	fstp   %st(2)
c0104b1c:	0f 86 7f 03 00 00    	jbe    c0104ea1 <_dtoa_r+0xfd1>
c0104b22:	dd d8                	fstp   %st(0)
c0104b24:	dd d8                	fstp   %st(0)
c0104b26:	dd d8                	fstp   %st(0)
c0104b28:	dd d8                	fstp   %st(0)
c0104b2a:	89 fb                	mov    %edi,%ebx
c0104b2c:	0f b6 42 ff          	movzbl -0x1(%edx),%eax
c0104b30:	89 d7                	mov    %edx,%edi
c0104b32:	e9 d7 f9 ff ff       	jmp    c010450e <_dtoa_r+0x63e>
c0104b37:	90                   	nop
c0104b38:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0104b3b:	8b 41 10             	mov    0x10(%ecx),%eax
c0104b3e:	8b 44 81 10          	mov    0x10(%ecx,%eax,4),%eax
c0104b42:	89 04 24             	mov    %eax,(%esp)
c0104b45:	e8 56 11 00 00       	call   c0105ca0 <__hi0bits>
c0104b4a:	ba 20 00 00 00       	mov    $0x20,%edx
c0104b4f:	29 c2                	sub    %eax,%edx
c0104b51:	e9 bb fa ff ff       	jmp    c0104611 <_dtoa_r+0x741>
c0104b56:	66 90                	xchg   %ax,%ax
c0104b58:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104b5b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104b5f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104b62:	89 04 24             	mov    %eax,(%esp)
c0104b65:	e8 56 16 00 00       	call   c01061c0 <__mcmp>
c0104b6a:	85 c0                	test   %eax,%eax
c0104b6c:	0f 89 13 fb ff ff    	jns    c0104685 <_dtoa_r+0x7b5>
c0104b72:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104b75:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104b7c:	00 
c0104b7d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104b84:	00 
c0104b85:	89 34 24             	mov    %esi,(%esp)
c0104b88:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104b8c:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
c0104b90:	e8 2b 0f 00 00       	call   c0105ac0 <__multadd>
c0104b95:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104b98:	85 c9                	test   %ecx,%ecx
c0104b9a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104b9d:	0f 85 8d 00 00 00    	jne    c0104c30 <_dtoa_r+0xd60>
c0104ba3:	83 7d 90 00          	cmpl   $0x0,-0x70(%ebp)
c0104ba7:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104baa:	7f 0a                	jg     c0104bb6 <_dtoa_r+0xce6>
c0104bac:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104bb0:	0f 8f ff 04 00 00    	jg     c01050b5 <_dtoa_r+0x11e5>
c0104bb6:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104bb9:	e9 ed fc ff ff       	jmp    c01048ab <_dtoa_r+0x9db>
c0104bbe:	66 90                	xchg   %ax,%ax
c0104bc0:	8b 5d a8             	mov    -0x58(%ebp),%ebx
c0104bc3:	85 db                	test   %ebx,%ebx
c0104bc5:	0f 85 aa fc ff ff    	jne    c0104875 <_dtoa_r+0x9a5>
c0104bcb:	d8 0d d8 8f 10 c0    	fmuls  0xc0108fd8
c0104bd1:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0104bd8:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0104bdf:	dd 45 c0             	fldl   -0x40(%ebp)
c0104be2:	d9 c9                	fxch   %st(1)
c0104be4:	df e9                	fucomip %st(1),%st
c0104be6:	dd d8                	fstp   %st(0)
c0104be8:	0f 83 97 fc ff ff    	jae    c0104885 <_dtoa_r+0x9b5>
c0104bee:	e9 eb fa ff ff       	jmp    c01046de <_dtoa_r+0x80e>
c0104bf3:	90                   	nop
c0104bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104bf8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104bfb:	85 c0                	test   %eax,%eax
c0104bfd:	0f 85 fe f9 ff ff    	jne    c0104601 <_dtoa_r+0x731>
c0104c03:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0104c06:	a9 ff ff 0f 00       	test   $0xfffff,%eax
c0104c0b:	0f 85 f0 f9 ff ff    	jne    c0104601 <_dtoa_r+0x731>
c0104c11:	a9 00 00 f0 7f       	test   $0x7ff00000,%eax
c0104c16:	0f 84 e5 f9 ff ff    	je     c0104601 <_dtoa_r+0x731>
c0104c1c:	83 45 a0 01          	addl   $0x1,-0x60(%ebp)
c0104c20:	83 45 ac 01          	addl   $0x1,-0x54(%ebp)
c0104c24:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
c0104c2b:	e9 d1 f9 ff ff       	jmp    c0104601 <_dtoa_r+0x731>
c0104c30:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104c33:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104c3a:	00 
c0104c3b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104c42:	00 
c0104c43:	89 34 24             	mov    %esi,(%esp)
c0104c46:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c4a:	e8 71 0e 00 00       	call   c0105ac0 <__multadd>
c0104c4f:	8b 55 90             	mov    -0x70(%ebp),%edx
c0104c52:	85 d2                	test   %edx,%edx
c0104c54:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104c57:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104c5a:	7f 0a                	jg     c0104c66 <_dtoa_r+0xd96>
c0104c5c:	83 7d 14 02          	cmpl   $0x2,0x14(%ebp)
c0104c60:	0f 8f 4f 04 00 00    	jg     c01050b5 <_dtoa_r+0x11e5>
c0104c66:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0104c70:	85 db                	test   %ebx,%ebx
c0104c72:	7e 16                	jle    c0104c8a <_dtoa_r+0xdba>
c0104c74:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104c77:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0104c7b:	89 34 24             	mov    %esi,(%esp)
c0104c7e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c82:	e8 19 14 00 00       	call   c01060a0 <__lshift>
c0104c87:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104c8a:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
c0104c8d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104c90:	85 db                	test   %ebx,%ebx
c0104c92:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104c95:	0f 85 11 03 00 00    	jne    c0104fac <_dtoa_r+0x10dc>
c0104c9b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104c9e:	8d 5f 01             	lea    0x1(%edi),%ebx
c0104ca1:	89 7d 8c             	mov    %edi,-0x74(%ebp)
c0104ca4:	01 f8                	add    %edi,%eax
c0104ca6:	8b 7d a4             	mov    -0x5c(%ebp),%edi
c0104ca9:	89 45 90             	mov    %eax,-0x70(%ebp)
c0104cac:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104caf:	83 e0 01             	and    $0x1,%eax
c0104cb2:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0104cb5:	eb 2e                	jmp    c0104ce5 <_dtoa_r+0xe15>
c0104cb7:	90                   	nop
c0104cb8:	e8 03 0e 00 00       	call   c0105ac0 <__multadd>
c0104cbd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104cc4:	00 
c0104cc5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104ccc:	00 
c0104ccd:	89 34 24             	mov    %esi,(%esp)
c0104cd0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104cd3:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104cd6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104cda:	e8 e1 0d 00 00       	call   c0105ac0 <__multadd>
c0104cdf:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104ce2:	83 c3 01             	add    $0x1,%ebx
c0104ce5:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104ce8:	8d 43 ff             	lea    -0x1(%ebx),%eax
c0104ceb:	89 45 98             	mov    %eax,-0x68(%ebp)
c0104cee:	89 f8                	mov    %edi,%eax
c0104cf0:	e8 0b f0 ff ff       	call   c0103d00 <quorem>
c0104cf5:	89 3c 24             	mov    %edi,(%esp)
c0104cf8:	8d 48 30             	lea    0x30(%eax),%ecx
c0104cfb:	89 4d a0             	mov    %ecx,-0x60(%ebp)
c0104cfe:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104d01:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104d04:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0104d08:	e8 b3 14 00 00       	call   c01061c0 <__mcmp>
c0104d0d:	8b 4d ac             	mov    -0x54(%ebp),%ecx
c0104d10:	89 34 24             	mov    %esi,(%esp)
c0104d13:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0104d17:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104d1a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104d1d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104d21:	e8 ea 14 00 00       	call   c0106210 <__mdiff>
c0104d26:	8b 48 0c             	mov    0xc(%eax),%ecx
c0104d29:	89 c2                	mov    %eax,%edx
c0104d2b:	85 c9                	test   %ecx,%ecx
c0104d2d:	0f 85 c5 00 00 00    	jne    c0104df8 <_dtoa_r+0xf28>
c0104d33:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104d37:	89 3c 24             	mov    %edi,(%esp)
c0104d3a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104d3d:	e8 7e 14 00 00       	call   c01061c0 <__mcmp>
c0104d42:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0104d45:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104d49:	89 34 24             	mov    %esi,(%esp)
c0104d4c:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0104d4f:	e8 4c 0d 00 00       	call   c0105aa0 <_Bfree>
c0104d54:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104d57:	89 c1                	mov    %eax,%ecx
c0104d59:	0b 4d 14             	or     0x14(%ebp),%ecx
c0104d5c:	75 0b                	jne    c0104d69 <_dtoa_r+0xe99>
c0104d5e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0104d61:	85 d2                	test   %edx,%edx
c0104d63:	0f 84 fb 02 00 00    	je     c0105064 <_dtoa_r+0x1194>
c0104d69:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0104d6c:	85 d2                	test   %edx,%edx
c0104d6e:	0f 88 7f 01 00 00    	js     c0104ef3 <_dtoa_r+0x1023>
c0104d74:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0104d77:	0b 4d 14             	or     0x14(%ebp),%ecx
c0104d7a:	75 0b                	jne    c0104d87 <_dtoa_r+0xeb7>
c0104d7c:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
c0104d7f:	85 c9                	test   %ecx,%ecx
c0104d81:	0f 84 6c 01 00 00    	je     c0104ef3 <_dtoa_r+0x1023>
c0104d87:	85 c0                	test   %eax,%eax
c0104d89:	0f 8f 82 02 00 00    	jg     c0105011 <_dtoa_r+0x1141>
c0104d8f:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104d93:	89 da                	mov    %ebx,%edx
c0104d95:	3b 5d 90             	cmp    -0x70(%ebp),%ebx
c0104d98:	88 43 ff             	mov    %al,-0x1(%ebx)
c0104d9b:	0f 84 8d 02 00 00    	je     c010502e <_dtoa_r+0x115e>
c0104da1:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0104da5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104dac:	00 
c0104dad:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104db4:	00 
c0104db5:	89 34 24             	mov    %esi,(%esp)
c0104db8:	e8 03 0d 00 00       	call   c0105ac0 <__multadd>
c0104dbd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0104dc4:	00 
c0104dc5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0104dcc:	00 
c0104dcd:	89 34 24             	mov    %esi,(%esp)
c0104dd0:	89 c7                	mov    %eax,%edi
c0104dd2:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104dd5:	39 45 b4             	cmp    %eax,-0x4c(%ebp)
c0104dd8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104ddb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104ddf:	0f 85 d3 fe ff ff    	jne    c0104cb8 <_dtoa_r+0xde8>
c0104de5:	e8 d6 0c 00 00       	call   c0105ac0 <__multadd>
c0104dea:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104ded:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104df0:	e9 ed fe ff ff       	jmp    c0104ce2 <_dtoa_r+0xe12>
c0104df5:	8d 76 00             	lea    0x0(%esi),%esi
c0104df8:	b8 01 00 00 00       	mov    $0x1,%eax
c0104dfd:	e9 43 ff ff ff       	jmp    c0104d45 <_dtoa_r+0xe75>
c0104e02:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104e09:	e9 d2 f2 ff ff       	jmp    c01040e0 <_dtoa_r+0x210>
c0104e0e:	0f 85 87 f6 ff ff    	jne    c010449b <_dtoa_r+0x5cb>
c0104e14:	dd d8                	fstp   %st(0)
c0104e16:	dd d8                	fstp   %st(0)
c0104e18:	dd d8                	fstp   %st(0)
c0104e1a:	89 fb                	mov    %edi,%ebx
c0104e1c:	8b 7d c0             	mov    -0x40(%ebp),%edi
c0104e1f:	e9 fc f8 ff ff       	jmp    c0104720 <_dtoa_r+0x850>
c0104e24:	89 c2                	mov    %eax,%edx
c0104e26:	2b 55 b0             	sub    -0x50(%ebp),%edx
c0104e29:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0104e2c:	01 55 94             	add    %edx,-0x6c(%ebp)
c0104e2f:	31 d2                	xor    %edx,%edx
c0104e31:	e9 b8 f9 ff ff       	jmp    c01047ee <_dtoa_r+0x91e>
c0104e36:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104e39:	85 c0                	test   %eax,%eax
c0104e3b:	0f 84 f3 f9 ff ff    	je     c0104834 <_dtoa_r+0x964>
c0104e41:	8b 45 90             	mov    -0x70(%ebp),%eax
c0104e44:	85 c0                	test   %eax,%eax
c0104e46:	0f 8e c4 fb ff ff    	jle    c0104a10 <_dtoa_r+0xb40>
c0104e4c:	d8 0d d0 8f 10 c0    	fmuls  0xc0108fd0
c0104e52:	83 c1 01             	add    $0x1,%ecx
c0104e55:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
c0104e58:	8b 5d b8             	mov    -0x48(%ebp),%ebx
c0104e5b:	89 c1                	mov    %eax,%ecx
c0104e5d:	83 eb 01             	sub    $0x1,%ebx
c0104e60:	db 45 d4             	fildl  -0x2c(%ebp)
c0104e63:	d8 c9                	fmul   %st(1),%st
c0104e65:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
c0104e68:	d8 05 d4 8f 10 c0    	fadds  0xc0108fd4
c0104e6e:	dd 5d c0             	fstpl  -0x40(%ebp)
c0104e71:	81 6d c4 00 00 40 03 	subl   $0x3400000,-0x3c(%ebp)
c0104e78:	e9 53 f4 ff ff       	jmp    c01042d0 <_dtoa_r+0x400>
c0104e7d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104e80:	c6 03 30             	movb   $0x30,(%ebx)
c0104e83:	83 c0 01             	add    $0x1,%eax
c0104e86:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104e89:	b8 31 00 00 00       	mov    $0x31,%eax
c0104e8e:	88 02                	mov    %al,(%edx)
c0104e90:	e9 8b f8 ff ff       	jmp    c0104720 <_dtoa_r+0x850>
c0104e95:	d9 c0                	fld    %st(0)
c0104e97:	b9 02 00 00 00       	mov    $0x2,%ecx
c0104e9c:	e9 f2 f3 ff ff       	jmp    c0104293 <_dtoa_r+0x3c3>
c0104ea1:	de e2                	fsubp  %st,%st(2)
c0104ea3:	d9 c9                	fxch   %st(1)
c0104ea5:	df e9                	fucomip %st(1),%st
c0104ea7:	dd d8                	fstp   %st(0)
c0104ea9:	0f 86 69 fb ff ff    	jbe    c0104a18 <_dtoa_r+0xb48>
c0104eaf:	dd d8                	fstp   %st(0)
c0104eb1:	eb 07                	jmp    c0104eba <_dtoa_r+0xfea>
c0104eb3:	90                   	nop
c0104eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104eb8:	89 c2                	mov    %eax,%edx
c0104eba:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c0104ebe:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104ec1:	74 f5                	je     c0104eb8 <_dtoa_r+0xfe8>
c0104ec3:	e9 d9 f4 ff ff       	jmp    c01043a1 <_dtoa_r+0x4d1>
c0104ec8:	c6 07 31             	movb   $0x31,(%edi)
c0104ecb:	89 fb                	mov    %edi,%ebx
c0104ecd:	89 d7                	mov    %edx,%edi
c0104ecf:	83 45 b8 01          	addl   $0x1,-0x48(%ebp)
c0104ed3:	e9 1a f8 ff ff       	jmp    c01046f2 <_dtoa_r+0x822>
c0104ed8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0104edb:	85 d2                	test   %edx,%edx
c0104edd:	0f 84 1b 01 00 00    	je     c0104ffe <_dtoa_r+0x112e>
c0104ee3:	05 33 04 00 00       	add    $0x433,%eax
c0104ee8:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0104eeb:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0104eee:	e9 0b f9 ff ff       	jmp    c01047fe <_dtoa_r+0x92e>
c0104ef3:	85 c0                	test   %eax,%eax
c0104ef5:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0104ef8:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0104efb:	7e 45                	jle    c0104f42 <_dtoa_r+0x1072>
c0104efd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104f00:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104f07:	00 
c0104f08:	89 34 24             	mov    %esi,(%esp)
c0104f0b:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104f0f:	e8 8c 11 00 00       	call   c01060a0 <__lshift>
c0104f14:	8b 5d b0             	mov    -0x50(%ebp),%ebx
c0104f17:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104f1b:	89 04 24             	mov    %eax,(%esp)
c0104f1e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0104f21:	e8 9a 12 00 00       	call   c01061c0 <__mcmp>
c0104f26:	83 f8 00             	cmp    $0x0,%eax
c0104f29:	0f 8e 5b 01 00 00    	jle    c010508a <_dtoa_r+0x11ba>
c0104f2f:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0104f33:	0f 84 0c 01 00 00    	je     c0105045 <_dtoa_r+0x1175>
c0104f39:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0104f3c:	83 c0 31             	add    $0x31,%eax
c0104f3f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0104f42:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0104f45:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0104f49:	89 cb                	mov    %ecx,%ebx
c0104f4b:	88 03                	mov    %al,(%ebx)
c0104f4d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0104f50:	89 fb                	mov    %edi,%ebx
c0104f52:	8d 79 01             	lea    0x1(%ecx),%edi
c0104f55:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104f58:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104f5b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0104f5e:	e9 8f f7 ff ff       	jmp    c01046f2 <_dtoa_r+0x822>
c0104f63:	dd d8                	fstp   %st(0)
c0104f65:	dd d8                	fstp   %st(0)
c0104f67:	dd d8                	fstp   %st(0)
c0104f69:	eb 0d                	jmp    c0104f78 <_dtoa_r+0x10a8>
c0104f6b:	90                   	nop
c0104f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0104f70:	dd d8                	fstp   %st(0)
c0104f72:	dd d8                	fstp   %st(0)
c0104f74:	dd d8                	fstp   %st(0)
c0104f76:	dd d8                	fstp   %st(0)
c0104f78:	89 fb                	mov    %edi,%ebx
c0104f7a:	89 d7                	mov    %edx,%edi
c0104f7c:	e9 8d f5 ff ff       	jmp    c010450e <_dtoa_r+0x63e>
c0104f81:	29 cb                	sub    %ecx,%ebx
c0104f83:	31 c0                	xor    %eax,%eax
c0104f85:	e9 74 f8 ff ff       	jmp    c01047fe <_dtoa_r+0x92e>
c0104f8a:	75 0e                	jne    c0104f9a <_dtoa_r+0x10ca>
c0104f8c:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0104f90:	74 08                	je     c0104f9a <_dtoa_r+0x10ca>
c0104f92:	e9 b2 f9 ff ff       	jmp    c0104949 <_dtoa_r+0xa79>
c0104f97:	90                   	nop
c0104f98:	89 c2                	mov    %eax,%edx
c0104f9a:	80 7a ff 30          	cmpb   $0x30,-0x1(%edx)
c0104f9e:	8d 42 ff             	lea    -0x1(%edx),%eax
c0104fa1:	74 f5                	je     c0104f98 <_dtoa_r+0x10c8>
c0104fa3:	89 fb                	mov    %edi,%ebx
c0104fa5:	89 d7                	mov    %edx,%edi
c0104fa7:	e9 46 f7 ff ff       	jmp    c01046f2 <_dtoa_r+0x822>
c0104fac:	8b 40 04             	mov    0x4(%eax),%eax
c0104faf:	89 34 24             	mov    %esi,(%esp)
c0104fb2:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104fb6:	e8 45 0a 00 00       	call   c0105a00 <_Balloc>
c0104fbb:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0104fbe:	89 c3                	mov    %eax,%ebx
c0104fc0:	8b 41 10             	mov    0x10(%ecx),%eax
c0104fc3:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0104fca:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104fce:	89 c8                	mov    %ecx,%eax
c0104fd0:	83 c0 0c             	add    $0xc,%eax
c0104fd3:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104fd7:	8d 43 0c             	lea    0xc(%ebx),%eax
c0104fda:	89 04 24             	mov    %eax,(%esp)
c0104fdd:	e8 fe cb ff ff       	call   c0101be0 <memcpy>
c0104fe2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104fe9:	00 
c0104fea:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0104fee:	89 34 24             	mov    %esi,(%esp)
c0104ff1:	e8 aa 10 00 00       	call   c01060a0 <__lshift>
c0104ff6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104ff9:	e9 9d fc ff ff       	jmp    c0104c9b <_dtoa_r+0xdcb>
c0104ffe:	b8 36 00 00 00       	mov    $0x36,%eax
c0105003:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0105006:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0105009:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c010500c:	e9 ed f7 ff ff       	jmp    c01047fe <_dtoa_r+0x92e>
c0105011:	83 7d a0 39          	cmpl   $0x39,-0x60(%ebp)
c0105015:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0105018:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010501b:	74 28                	je     c0105045 <_dtoa_r+0x1175>
c010501d:	0f b6 45 a0          	movzbl -0x60(%ebp),%eax
c0105021:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0105024:	83 c0 01             	add    $0x1,%eax
c0105027:	89 cb                	mov    %ecx,%ebx
c0105029:	e9 1d ff ff ff       	jmp    c0104f4b <_dtoa_r+0x107b>
c010502e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105031:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c0105034:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c0105037:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010503a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010503d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105040:	e9 cc f8 ff ff       	jmp    c0104911 <_dtoa_r+0xa41>
c0105045:	8b 45 98             	mov    -0x68(%ebp),%eax
c0105048:	b9 39 00 00 00       	mov    $0x39,%ecx
c010504d:	8d 50 01             	lea    0x1(%eax),%edx
c0105050:	c6 00 39             	movb   $0x39,(%eax)
c0105053:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105056:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105059:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010505c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010505f:	e9 fa f8 ff ff       	jmp    c010495e <_dtoa_r+0xa8e>
c0105064:	8b 5d a0             	mov    -0x60(%ebp),%ebx
c0105067:	89 7d a4             	mov    %edi,-0x5c(%ebp)
c010506a:	8b 7d 8c             	mov    -0x74(%ebp),%edi
c010506d:	83 fb 39             	cmp    $0x39,%ebx
c0105070:	74 d3                	je     c0105045 <_dtoa_r+0x1175>
c0105072:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0105075:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0105078:	83 c0 31             	add    $0x31,%eax
c010507b:	85 c9                	test   %ecx,%ecx
c010507d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0105080:	0f 4e c3             	cmovle %ebx,%eax
c0105083:	89 cb                	mov    %ecx,%ebx
c0105085:	e9 c1 fe ff ff       	jmp    c0104f4b <_dtoa_r+0x107b>
c010508a:	0f 85 b2 fe ff ff    	jne    c0104f42 <_dtoa_r+0x1072>
c0105090:	f6 45 a0 01          	testb  $0x1,-0x60(%ebp)
c0105094:	0f 84 a8 fe ff ff    	je     c0104f42 <_dtoa_r+0x1072>
c010509a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01050a0:	e9 8a fe ff ff       	jmp    c0104f2f <_dtoa_r+0x105f>
c01050a5:	0f 85 c7 f3 ff ff    	jne    c0104472 <_dtoa_r+0x5a2>
c01050ab:	dd d8                	fstp   %st(0)
c01050ad:	dd d8                	fstp   %st(0)
c01050af:	90                   	nop
c01050b0:	e9 65 fd ff ff       	jmp    c0104e1a <_dtoa_r+0xf4a>
c01050b5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01050b8:	e9 dd f5 ff ff       	jmp    c010469a <_dtoa_r+0x7ca>
c01050bd:	8d 76 00             	lea    0x0(%esi),%esi
c01050c0:	0f 84 7a f5 ff ff    	je     c0104640 <_dtoa_r+0x770>
c01050c6:	b8 3c 00 00 00       	mov    $0x3c,%eax
c01050cb:	29 d0                	sub    %edx,%eax
c01050cd:	e9 ab f8 ff ff       	jmp    c010497d <_dtoa_r+0xaad>
c01050d2:	b8 01 00 00 00       	mov    $0x1,%eax
c01050d7:	e9 d9 ef ff ff       	jmp    c01040b5 <_dtoa_r+0x1e5>
c01050dc:	31 d2                	xor    %edx,%edx
c01050de:	e9 36 f1 ff ff       	jmp    c0104219 <_dtoa_r+0x349>
c01050e3:	66 90                	xchg   %ax,%ax
c01050e5:	66 90                	xchg   %ax,%ax
c01050e7:	66 90                	xchg   %ax,%ax
c01050e9:	66 90                	xchg   %ax,%ax
c01050eb:	66 90                	xchg   %ax,%ax
c01050ed:	66 90                	xchg   %ax,%ax
c01050ef:	90                   	nop

c01050f0 <_setlocale_r>:
c01050f0:	55                   	push   %ebp
c01050f1:	89 e5                	mov    %esp,%ebp
c01050f3:	53                   	push   %ebx
c01050f4:	83 ec 14             	sub    $0x14,%esp
c01050f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
c01050fa:	85 db                	test   %ebx,%ebx
c01050fc:	74 14                	je     c0105112 <_setlocale_r+0x22>
c01050fe:	c7 44 24 04 f8 8f 10 	movl   $0xc0108ff8,0x4(%esp)
c0105105:	c0 
c0105106:	89 1c 24             	mov    %ebx,(%esp)
c0105109:	e8 a2 cb ff ff       	call   c0101cb0 <strcmp>
c010510e:	85 c0                	test   %eax,%eax
c0105110:	75 0e                	jne    c0105120 <_setlocale_r+0x30>
c0105112:	83 c4 14             	add    $0x14,%esp
c0105115:	b8 f8 8d 10 c0       	mov    $0xc0108df8,%eax
c010511a:	5b                   	pop    %ebx
c010511b:	5d                   	pop    %ebp
c010511c:	c3                   	ret    
c010511d:	8d 76 00             	lea    0x0(%esi),%esi
c0105120:	c7 44 24 04 f8 8d 10 	movl   $0xc0108df8,0x4(%esp)
c0105127:	c0 
c0105128:	89 1c 24             	mov    %ebx,(%esp)
c010512b:	e8 80 cb ff ff       	call   c0101cb0 <strcmp>
c0105130:	85 c0                	test   %eax,%eax
c0105132:	74 de                	je     c0105112 <_setlocale_r+0x22>
c0105134:	89 1c 24             	mov    %ebx,(%esp)
c0105137:	c7 44 24 04 32 8e 10 	movl   $0xc0108e32,0x4(%esp)
c010513e:	c0 
c010513f:	e8 6c cb ff ff       	call   c0101cb0 <strcmp>
c0105144:	89 c2                	mov    %eax,%edx
c0105146:	31 c0                	xor    %eax,%eax
c0105148:	85 d2                	test   %edx,%edx
c010514a:	ba f8 8d 10 c0       	mov    $0xc0108df8,%edx
c010514f:	0f 44 c2             	cmove  %edx,%eax
c0105152:	83 c4 14             	add    $0x14,%esp
c0105155:	5b                   	pop    %ebx
c0105156:	5d                   	pop    %ebp
c0105157:	c3                   	ret    
c0105158:	90                   	nop
c0105159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105160 <__locale_charset>:
c0105160:	55                   	push   %ebp
c0105161:	b8 00 b8 10 c0       	mov    $0xc010b800,%eax
c0105166:	89 e5                	mov    %esp,%ebp
c0105168:	5d                   	pop    %ebp
c0105169:	c3                   	ret    
c010516a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105170 <__locale_mb_cur_max>:
c0105170:	55                   	push   %ebp
c0105171:	a1 58 b8 10 c0       	mov    0xc010b858,%eax
c0105176:	89 e5                	mov    %esp,%ebp
c0105178:	5d                   	pop    %ebp
c0105179:	c3                   	ret    
c010517a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105180 <__locale_msgcharset>:
c0105180:	55                   	push   %ebp
c0105181:	b8 e0 b7 10 c0       	mov    $0xc010b7e0,%eax
c0105186:	89 e5                	mov    %esp,%ebp
c0105188:	5d                   	pop    %ebp
c0105189:	c3                   	ret    
c010518a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c0105190 <__locale_cjk_lang>:
c0105190:	55                   	push   %ebp
c0105191:	31 c0                	xor    %eax,%eax
c0105193:	89 e5                	mov    %esp,%ebp
c0105195:	5d                   	pop    %ebp
c0105196:	c3                   	ret    
c0105197:	89 f6                	mov    %esi,%esi
c0105199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01051a0 <_localeconv_r>:
c01051a0:	55                   	push   %ebp
c01051a1:	b8 20 b8 10 c0       	mov    $0xc010b820,%eax
c01051a6:	89 e5                	mov    %esp,%ebp
c01051a8:	5d                   	pop    %ebp
c01051a9:	c3                   	ret    
c01051aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01051b0 <setlocale>:
c01051b0:	55                   	push   %ebp
c01051b1:	89 e5                	mov    %esp,%ebp
c01051b3:	83 ec 18             	sub    $0x18,%esp
c01051b6:	e8 35 cc ff ff       	call   c0101df0 <__getreent>
c01051bb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01051be:	89 54 24 08          	mov    %edx,0x8(%esp)
c01051c2:	8b 55 08             	mov    0x8(%ebp),%edx
c01051c5:	89 04 24             	mov    %eax,(%esp)
c01051c8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01051cc:	e8 1f ff ff ff       	call   c01050f0 <_setlocale_r>
c01051d1:	c9                   	leave  
c01051d2:	c3                   	ret    
c01051d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01051d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01051e0 <localeconv>:
c01051e0:	55                   	push   %ebp
c01051e1:	89 e5                	mov    %esp,%ebp
c01051e3:	83 ec 08             	sub    $0x8,%esp
c01051e6:	e8 05 cc ff ff       	call   c0101df0 <__getreent>
c01051eb:	b8 20 b8 10 c0       	mov    $0xc010b820,%eax
c01051f0:	c9                   	leave  
c01051f1:	c3                   	ret    
c01051f2:	66 90                	xchg   %ax,%ax
c01051f4:	66 90                	xchg   %ax,%ax
c01051f6:	66 90                	xchg   %ax,%ax
c01051f8:	66 90                	xchg   %ax,%ax
c01051fa:	66 90                	xchg   %ax,%ax
c01051fc:	66 90                	xchg   %ax,%ax
c01051fe:	66 90                	xchg   %ax,%ax

c0105200 <_malloc_r>:
c0105200:	55                   	push   %ebp
c0105201:	89 e5                	mov    %esp,%ebp
c0105203:	57                   	push   %edi
c0105204:	56                   	push   %esi
c0105205:	53                   	push   %ebx
c0105206:	83 ec 2c             	sub    $0x2c,%esp
c0105209:	8b 45 0c             	mov    0xc(%ebp),%eax
c010520c:	8d 50 0b             	lea    0xb(%eax),%edx
c010520f:	83 fa 16             	cmp    $0x16,%edx
c0105212:	76 6c                	jbe    c0105280 <_malloc_r+0x80>
c0105214:	89 d7                	mov    %edx,%edi
c0105216:	83 e7 f8             	and    $0xfffffff8,%edi
c0105219:	89 fe                	mov    %edi,%esi
c010521b:	c1 ee 1f             	shr    $0x1f,%esi
c010521e:	39 c7                	cmp    %eax,%edi
c0105220:	8b 45 08             	mov    0x8(%ebp),%eax
c0105223:	89 f2                	mov    %esi,%edx
c0105225:	72 67                	jb     c010528e <_malloc_r+0x8e>
c0105227:	84 d2                	test   %dl,%dl
c0105229:	75 63                	jne    c010528e <_malloc_r+0x8e>
c010522b:	89 04 24             	mov    %eax,(%esp)
c010522e:	e8 ad 07 00 00       	call   c01059e0 <__malloc_lock>
c0105233:	81 ff f7 01 00 00    	cmp    $0x1f7,%edi
c0105239:	77 65                	ja     c01052a0 <_malloc_r+0xa0>
c010523b:	89 fa                	mov    %edi,%edx
c010523d:	c1 ea 03             	shr    $0x3,%edx
c0105240:	8d 04 d5 80 b8 10 c0 	lea    -0x3fef4780(,%edx,8),%eax
c0105247:	8b 58 0c             	mov    0xc(%eax),%ebx
c010524a:	39 c3                	cmp    %eax,%ebx
c010524c:	0f 84 3e 05 00 00    	je     c0105790 <_malloc_r+0x590>
c0105252:	8b 43 04             	mov    0x4(%ebx),%eax
c0105255:	83 e0 fc             	and    $0xfffffffc,%eax
c0105258:	8b 53 0c             	mov    0xc(%ebx),%edx
c010525b:	8b 4b 08             	mov    0x8(%ebx),%ecx
c010525e:	89 51 0c             	mov    %edx,0xc(%ecx)
c0105261:	89 4a 08             	mov    %ecx,0x8(%edx)
c0105264:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c0105269:	8b 45 08             	mov    0x8(%ebp),%eax
c010526c:	89 04 24             	mov    %eax,(%esp)
c010526f:	e8 7c 07 00 00       	call   c01059f0 <__malloc_unlock>
c0105274:	8d 43 08             	lea    0x8(%ebx),%eax
c0105277:	83 c4 2c             	add    $0x2c,%esp
c010527a:	5b                   	pop    %ebx
c010527b:	5e                   	pop    %esi
c010527c:	5f                   	pop    %edi
c010527d:	5d                   	pop    %ebp
c010527e:	c3                   	ret    
c010527f:	90                   	nop
c0105280:	bf 10 00 00 00       	mov    $0x10,%edi
c0105285:	31 d2                	xor    %edx,%edx
c0105287:	39 c7                	cmp    %eax,%edi
c0105289:	8b 45 08             	mov    0x8(%ebp),%eax
c010528c:	73 99                	jae    c0105227 <_malloc_r+0x27>
c010528e:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0105294:	83 c4 2c             	add    $0x2c,%esp
c0105297:	31 c0                	xor    %eax,%eax
c0105299:	5b                   	pop    %ebx
c010529a:	5e                   	pop    %esi
c010529b:	5f                   	pop    %edi
c010529c:	5d                   	pop    %ebp
c010529d:	c3                   	ret    
c010529e:	66 90                	xchg   %ax,%ax
c01052a0:	89 fe                	mov    %edi,%esi
c01052a2:	c1 ee 09             	shr    $0x9,%esi
c01052a5:	85 f6                	test   %esi,%esi
c01052a7:	0f 84 ab 01 00 00    	je     c0105458 <_malloc_r+0x258>
c01052ad:	83 fe 04             	cmp    $0x4,%esi
c01052b0:	0f 87 8a 03 00 00    	ja     c0105640 <_malloc_r+0x440>
c01052b6:	89 fe                	mov    %edi,%esi
c01052b8:	c1 ee 06             	shr    $0x6,%esi
c01052bb:	83 c6 38             	add    $0x38,%esi
c01052be:	8d 04 36             	lea    (%esi,%esi,1),%eax
c01052c1:	8d 0c 85 80 b8 10 c0 	lea    -0x3fef4780(,%eax,4),%ecx
c01052c8:	8b 59 0c             	mov    0xc(%ecx),%ebx
c01052cb:	39 d9                	cmp    %ebx,%ecx
c01052cd:	75 18                	jne    c01052e7 <_malloc_r+0xe7>
c01052cf:	eb 28                	jmp    c01052f9 <_malloc_r+0xf9>
c01052d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01052d8:	85 d2                	test   %edx,%edx
c01052da:	0f 89 78 ff ff ff    	jns    c0105258 <_malloc_r+0x58>
c01052e0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c01052e3:	39 d9                	cmp    %ebx,%ecx
c01052e5:	74 12                	je     c01052f9 <_malloc_r+0xf9>
c01052e7:	8b 43 04             	mov    0x4(%ebx),%eax
c01052ea:	83 e0 fc             	and    $0xfffffffc,%eax
c01052ed:	89 c2                	mov    %eax,%edx
c01052ef:	29 fa                	sub    %edi,%edx
c01052f1:	83 fa 0f             	cmp    $0xf,%edx
c01052f4:	7e e2                	jle    c01052d8 <_malloc_r+0xd8>
c01052f6:	83 ee 01             	sub    $0x1,%esi
c01052f9:	8d 46 01             	lea    0x1(%esi),%eax
c01052fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052ff:	8b 1d 90 b8 10 c0    	mov    0xc010b890,%ebx
c0105305:	a1 84 b8 10 c0       	mov    0xc010b884,%eax
c010530a:	81 fb 88 b8 10 c0    	cmp    $0xc010b888,%ebx
c0105310:	74 6b                	je     c010537d <_malloc_r+0x17d>
c0105312:	8b 73 04             	mov    0x4(%ebx),%esi
c0105315:	83 e6 fc             	and    $0xfffffffc,%esi
c0105318:	89 f0                	mov    %esi,%eax
c010531a:	29 f8                	sub    %edi,%eax
c010531c:	83 f8 0f             	cmp    $0xf,%eax
c010531f:	0f 8f a3 03 00 00    	jg     c01056c8 <_malloc_r+0x4c8>
c0105325:	85 c0                	test   %eax,%eax
c0105327:	c7 05 94 b8 10 c0 88 	movl   $0xc010b888,0xc010b894
c010532e:	b8 10 c0 
c0105331:	c7 05 90 b8 10 c0 88 	movl   $0xc010b888,0xc010b890
c0105338:	b8 10 c0 
c010533b:	0f 89 27 01 00 00    	jns    c0105468 <_malloc_r+0x268>
c0105341:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
c0105347:	0f 87 1b 03 00 00    	ja     c0105668 <_malloc_r+0x468>
c010534d:	c1 ee 03             	shr    $0x3,%esi
c0105350:	b8 01 00 00 00       	mov    $0x1,%eax
c0105355:	89 f1                	mov    %esi,%ecx
c0105357:	8d 14 f5 80 b8 10 c0 	lea    -0x3fef4780(,%esi,8),%edx
c010535e:	c1 f9 02             	sar    $0x2,%ecx
c0105361:	d3 e0                	shl    %cl,%eax
c0105363:	8b 4a 08             	mov    0x8(%edx),%ecx
c0105366:	0b 05 84 b8 10 c0    	or     0xc010b884,%eax
c010536c:	89 53 0c             	mov    %edx,0xc(%ebx)
c010536f:	89 4b 08             	mov    %ecx,0x8(%ebx)
c0105372:	a3 84 b8 10 c0       	mov    %eax,0xc010b884
c0105377:	89 5a 08             	mov    %ebx,0x8(%edx)
c010537a:	89 59 0c             	mov    %ebx,0xc(%ecx)
c010537d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105380:	be 01 00 00 00       	mov    $0x1,%esi
c0105385:	c1 f9 02             	sar    $0x2,%ecx
c0105388:	d3 e6                	shl    %cl,%esi
c010538a:	39 c6                	cmp    %eax,%esi
c010538c:	0f 87 f6 00 00 00    	ja     c0105488 <_malloc_r+0x288>
c0105392:	85 f0                	test   %esi,%eax
c0105394:	0f 85 76 03 00 00    	jne    c0105710 <_malloc_r+0x510>
c010539a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010539d:	01 f6                	add    %esi,%esi
c010539f:	83 e2 fc             	and    $0xfffffffc,%edx
c01053a2:	85 f0                	test   %esi,%eax
c01053a4:	8d 4a 04             	lea    0x4(%edx),%ecx
c01053a7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c01053aa:	0f 85 60 03 00 00    	jne    c0105710 <_malloc_r+0x510>
c01053b0:	89 ca                	mov    %ecx,%edx
c01053b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01053b8:	01 f6                	add    %esi,%esi
c01053ba:	83 c2 04             	add    $0x4,%edx
c01053bd:	85 f0                	test   %esi,%eax
c01053bf:	74 f7                	je     c01053b8 <_malloc_r+0x1b8>
c01053c1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01053c4:	89 75 dc             	mov    %esi,-0x24(%ebp)
c01053c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01053ca:	8d 34 c5 80 b8 10 c0 	lea    -0x3fef4780(,%eax,8),%esi
c01053d1:	89 f1                	mov    %esi,%ecx
c01053d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01053d6:	8b 59 0c             	mov    0xc(%ecx),%ebx
c01053d9:	39 d9                	cmp    %ebx,%ecx
c01053db:	75 1e                	jne    c01053fb <_malloc_r+0x1fb>
c01053dd:	e9 36 03 00 00       	jmp    c0105718 <_malloc_r+0x518>
c01053e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01053e8:	85 d2                	test   %edx,%edx
c01053ea:	0f 89 c0 03 00 00    	jns    c01057b0 <_malloc_r+0x5b0>
c01053f0:	8b 5b 0c             	mov    0xc(%ebx),%ebx
c01053f3:	39 d9                	cmp    %ebx,%ecx
c01053f5:	0f 84 1d 03 00 00    	je     c0105718 <_malloc_r+0x518>
c01053fb:	8b 43 04             	mov    0x4(%ebx),%eax
c01053fe:	83 e0 fc             	and    $0xfffffffc,%eax
c0105401:	89 c2                	mov    %eax,%edx
c0105403:	29 fa                	sub    %edi,%edx
c0105405:	83 fa 0f             	cmp    $0xf,%edx
c0105408:	7e de                	jle    c01053e8 <_malloc_r+0x1e8>
c010540a:	8b 4b 0c             	mov    0xc(%ebx),%ecx
c010540d:	8d 04 3b             	lea    (%ebx,%edi,1),%eax
c0105410:	83 cf 01             	or     $0x1,%edi
c0105413:	8b 73 08             	mov    0x8(%ebx),%esi
c0105416:	89 7b 04             	mov    %edi,0x4(%ebx)
c0105419:	89 4e 0c             	mov    %ecx,0xc(%esi)
c010541c:	89 71 08             	mov    %esi,0x8(%ecx)
c010541f:	89 d1                	mov    %edx,%ecx
c0105421:	83 c9 01             	or     $0x1,%ecx
c0105424:	a3 94 b8 10 c0       	mov    %eax,0xc010b894
c0105429:	a3 90 b8 10 c0       	mov    %eax,0xc010b890
c010542e:	c7 40 0c 88 b8 10 c0 	movl   $0xc010b888,0xc(%eax)
c0105435:	c7 40 08 88 b8 10 c0 	movl   $0xc010b888,0x8(%eax)
c010543c:	89 48 04             	mov    %ecx,0x4(%eax)
c010543f:	89 14 10             	mov    %edx,(%eax,%edx,1)
c0105442:	8b 45 08             	mov    0x8(%ebp),%eax
c0105445:	89 04 24             	mov    %eax,(%esp)
c0105448:	e8 a3 05 00 00       	call   c01059f0 <__malloc_unlock>
c010544d:	8d 43 08             	lea    0x8(%ebx),%eax
c0105450:	e9 22 fe ff ff       	jmp    c0105277 <_malloc_r+0x77>
c0105455:	8d 76 00             	lea    0x0(%esi),%esi
c0105458:	b8 7e 00 00 00       	mov    $0x7e,%eax
c010545d:	be 3f 00 00 00       	mov    $0x3f,%esi
c0105462:	e9 5a fe ff ff       	jmp    c01052c1 <_malloc_r+0xc1>
c0105467:	90                   	nop
c0105468:	8b 45 08             	mov    0x8(%ebp),%eax
c010546b:	83 4c 33 04 01       	orl    $0x1,0x4(%ebx,%esi,1)
c0105470:	89 04 24             	mov    %eax,(%esp)
c0105473:	e8 78 05 00 00       	call   c01059f0 <__malloc_unlock>
c0105478:	83 c4 2c             	add    $0x2c,%esp
c010547b:	8d 43 08             	lea    0x8(%ebx),%eax
c010547e:	5b                   	pop    %ebx
c010547f:	5e                   	pop    %esi
c0105480:	5f                   	pop    %edi
c0105481:	5d                   	pop    %ebp
c0105482:	c3                   	ret    
c0105483:	90                   	nop
c0105484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105488:	8b 1d 88 b8 10 c0    	mov    0xc010b888,%ebx
c010548e:	8b 73 04             	mov    0x4(%ebx),%esi
c0105491:	83 e6 fc             	and    $0xfffffffc,%esi
c0105494:	39 f7                	cmp    %esi,%edi
c0105496:	77 0d                	ja     c01054a5 <_malloc_r+0x2a5>
c0105498:	89 f0                	mov    %esi,%eax
c010549a:	29 f8                	sub    %edi,%eax
c010549c:	83 f8 0f             	cmp    $0xf,%eax
c010549f:	0f 8f 6b 01 00 00    	jg     c0105610 <_malloc_r+0x410>
c01054a5:	8b 0d 90 35 16 c0    	mov    0xc0163590,%ecx
c01054ab:	8d 04 33             	lea    (%ebx,%esi,1),%eax
c01054ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01054b1:	01 f9                	add    %edi,%ecx
c01054b3:	8d 81 0f 10 00 00    	lea    0x100f(%ecx),%eax
c01054b9:	83 c1 10             	add    $0x10,%ecx
c01054bc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01054c1:	83 3d 60 b8 10 c0 ff 	cmpl   $0xffffffff,0xc010b860
c01054c8:	0f 44 c1             	cmove  %ecx,%eax
c01054cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01054ce:	89 44 24 04          	mov    %eax,0x4(%esp)
c01054d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01054d5:	89 04 24             	mov    %eax,(%esp)
c01054d8:	e8 03 13 00 00       	call   c01067e0 <_sbrk_r>
c01054dd:	83 f8 ff             	cmp    $0xffffffff,%eax
c01054e0:	89 c1                	mov    %eax,%ecx
c01054e2:	0f 84 17 03 00 00    	je     c01057ff <_malloc_r+0x5ff>
c01054e8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01054eb:	0f 87 02 03 00 00    	ja     c01057f3 <_malloc_r+0x5f3>
c01054f1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01054f4:	03 15 60 35 16 c0    	add    0xc0163560,%edx
c01054fa:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
c01054fd:	89 15 60 35 16 c0    	mov    %edx,0xc0163560
c0105503:	0f 84 a9 03 00 00    	je     c01058b2 <_malloc_r+0x6b2>
c0105509:	83 3d 60 b8 10 c0 ff 	cmpl   $0xffffffff,0xc010b860
c0105510:	0f 84 ca 03 00 00    	je     c01058e0 <_malloc_r+0x6e0>
c0105516:	89 c8                	mov    %ecx,%eax
c0105518:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c010551b:	01 d0                	add    %edx,%eax
c010551d:	a3 60 35 16 c0       	mov    %eax,0xc0163560
c0105522:	89 c8                	mov    %ecx,%eax
c0105524:	ba 00 10 00 00       	mov    $0x1000,%edx
c0105529:	83 e0 07             	and    $0x7,%eax
c010552c:	74 0c                	je     c010553a <_malloc_r+0x33a>
c010552e:	29 c1                	sub    %eax,%ecx
c0105530:	ba 08 10 00 00       	mov    $0x1008,%edx
c0105535:	8d 49 08             	lea    0x8(%ecx),%ecx
c0105538:	29 c2                	sub    %eax,%edx
c010553a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010553d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105540:	01 c8                	add    %ecx,%eax
c0105542:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105547:	29 c2                	sub    %eax,%edx
c0105549:	8b 45 08             	mov    0x8(%ebp),%eax
c010554c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0105550:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105553:	89 04 24             	mov    %eax,(%esp)
c0105556:	e8 85 12 00 00       	call   c01067e0 <_sbrk_r>
c010555b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c010555e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0105561:	0f 84 6d 03 00 00    	je     c01058d4 <_malloc_r+0x6d4>
c0105567:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010556a:	29 c8                	sub    %ecx,%eax
c010556c:	01 d0                	add    %edx,%eax
c010556e:	83 c8 01             	or     $0x1,%eax
c0105571:	03 15 60 35 16 c0    	add    0xc0163560,%edx
c0105577:	81 fb 80 b8 10 c0    	cmp    $0xc010b880,%ebx
c010557d:	89 0d 88 b8 10 c0    	mov    %ecx,0xc010b888
c0105583:	89 41 04             	mov    %eax,0x4(%ecx)
c0105586:	89 15 60 35 16 c0    	mov    %edx,0xc0163560
c010558c:	0f 84 f2 02 00 00    	je     c0105884 <_malloc_r+0x684>
c0105592:	83 fe 0f             	cmp    $0xf,%esi
c0105595:	0f 86 8d 02 00 00    	jbe    c0105828 <_malloc_r+0x628>
c010559b:	8b 43 04             	mov    0x4(%ebx),%eax
c010559e:	83 ee 0c             	sub    $0xc,%esi
c01055a1:	83 e6 f8             	and    $0xfffffff8,%esi
c01055a4:	83 e0 01             	and    $0x1,%eax
c01055a7:	09 f0                	or     %esi,%eax
c01055a9:	83 fe 0f             	cmp    $0xf,%esi
c01055ac:	89 43 04             	mov    %eax,0x4(%ebx)
c01055af:	a1 88 b8 10 c0       	mov    0xc010b888,%eax
c01055b4:	c7 44 33 04 05 00 00 	movl   $0x5,0x4(%ebx,%esi,1)
c01055bb:	00 
c01055bc:	c7 44 33 08 05 00 00 	movl   $0x5,0x8(%ebx,%esi,1)
c01055c3:	00 
c01055c4:	0f 87 a2 02 00 00    	ja     c010586c <_malloc_r+0x66c>
c01055ca:	3b 15 8c 35 16 c0    	cmp    0xc016358c,%edx
c01055d0:	76 06                	jbe    c01055d8 <_malloc_r+0x3d8>
c01055d2:	89 15 8c 35 16 c0    	mov    %edx,0xc016358c
c01055d8:	3b 15 88 35 16 c0    	cmp    0xc0163588,%edx
c01055de:	76 06                	jbe    c01055e6 <_malloc_r+0x3e6>
c01055e0:	89 15 88 35 16 c0    	mov    %edx,0xc0163588
c01055e6:	8b 50 04             	mov    0x4(%eax),%edx
c01055e9:	89 c3                	mov    %eax,%ebx
c01055eb:	83 e2 fc             	and    $0xfffffffc,%edx
c01055ee:	89 d0                	mov    %edx,%eax
c01055f0:	29 f8                	sub    %edi,%eax
c01055f2:	39 d7                	cmp    %edx,%edi
c01055f4:	77 05                	ja     c01055fb <_malloc_r+0x3fb>
c01055f6:	83 f8 0f             	cmp    $0xf,%eax
c01055f9:	7f 15                	jg     c0105610 <_malloc_r+0x410>
c01055fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01055fe:	89 04 24             	mov    %eax,(%esp)
c0105601:	e8 ea 03 00 00       	call   c01059f0 <__malloc_unlock>
c0105606:	31 c0                	xor    %eax,%eax
c0105608:	e9 6a fc ff ff       	jmp    c0105277 <_malloc_r+0x77>
c010560d:	8d 76 00             	lea    0x0(%esi),%esi
c0105610:	89 fa                	mov    %edi,%edx
c0105612:	83 c8 01             	or     $0x1,%eax
c0105615:	83 ca 01             	or     $0x1,%edx
c0105618:	89 53 04             	mov    %edx,0x4(%ebx)
c010561b:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c010561e:	89 15 88 b8 10 c0    	mov    %edx,0xc010b888
c0105624:	89 42 04             	mov    %eax,0x4(%edx)
c0105627:	8b 45 08             	mov    0x8(%ebp),%eax
c010562a:	89 04 24             	mov    %eax,(%esp)
c010562d:	e8 be 03 00 00       	call   c01059f0 <__malloc_unlock>
c0105632:	83 c4 2c             	add    $0x2c,%esp
c0105635:	8d 43 08             	lea    0x8(%ebx),%eax
c0105638:	5b                   	pop    %ebx
c0105639:	5e                   	pop    %esi
c010563a:	5f                   	pop    %edi
c010563b:	5d                   	pop    %ebp
c010563c:	c3                   	ret    
c010563d:	8d 76 00             	lea    0x0(%esi),%esi
c0105640:	83 fe 14             	cmp    $0x14,%esi
c0105643:	0f 86 8f 01 00 00    	jbe    c01057d8 <_malloc_r+0x5d8>
c0105649:	83 fe 54             	cmp    $0x54,%esi
c010564c:	0f 87 be 01 00 00    	ja     c0105810 <_malloc_r+0x610>
c0105652:	89 fe                	mov    %edi,%esi
c0105654:	c1 ee 0c             	shr    $0xc,%esi
c0105657:	83 c6 6e             	add    $0x6e,%esi
c010565a:	8d 04 36             	lea    (%esi,%esi,1),%eax
c010565d:	e9 5f fc ff ff       	jmp    c01052c1 <_malloc_r+0xc1>
c0105662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105668:	89 f1                	mov    %esi,%ecx
c010566a:	c1 e9 09             	shr    $0x9,%ecx
c010566d:	83 f9 04             	cmp    $0x4,%ecx
c0105670:	0f 86 6d 01 00 00    	jbe    c01057e3 <_malloc_r+0x5e3>
c0105676:	83 f9 14             	cmp    $0x14,%ecx
c0105679:	0f 87 0f 02 00 00    	ja     c010588e <_malloc_r+0x68e>
c010567f:	83 c1 5b             	add    $0x5b,%ecx
c0105682:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105685:	8d 04 85 80 b8 10 c0 	lea    -0x3fef4780(,%eax,4),%eax
c010568c:	8b 50 08             	mov    0x8(%eax),%edx
c010568f:	39 c2                	cmp    %eax,%edx
c0105691:	0f 84 a1 01 00 00    	je     c0105838 <_malloc_r+0x638>
c0105697:	90                   	nop
c0105698:	8b 4a 04             	mov    0x4(%edx),%ecx
c010569b:	83 e1 fc             	and    $0xfffffffc,%ecx
c010569e:	39 ce                	cmp    %ecx,%esi
c01056a0:	73 07                	jae    c01056a9 <_malloc_r+0x4a9>
c01056a2:	8b 52 08             	mov    0x8(%edx),%edx
c01056a5:	39 d0                	cmp    %edx,%eax
c01056a7:	75 ef                	jne    c0105698 <_malloc_r+0x498>
c01056a9:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01056ac:	a1 84 b8 10 c0       	mov    0xc010b884,%eax
c01056b1:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c01056b4:	89 53 08             	mov    %edx,0x8(%ebx)
c01056b7:	89 59 08             	mov    %ebx,0x8(%ecx)
c01056ba:	89 5a 0c             	mov    %ebx,0xc(%edx)
c01056bd:	e9 bb fc ff ff       	jmp    c010537d <_malloc_r+0x17d>
c01056c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01056c8:	89 c1                	mov    %eax,%ecx
c01056ca:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
c01056cd:	83 c9 01             	or     $0x1,%ecx
c01056d0:	83 cf 01             	or     $0x1,%edi
c01056d3:	89 7b 04             	mov    %edi,0x4(%ebx)
c01056d6:	89 15 94 b8 10 c0    	mov    %edx,0xc010b894
c01056dc:	89 15 90 b8 10 c0    	mov    %edx,0xc010b890
c01056e2:	c7 42 0c 88 b8 10 c0 	movl   $0xc010b888,0xc(%edx)
c01056e9:	c7 42 08 88 b8 10 c0 	movl   $0xc010b888,0x8(%edx)
c01056f0:	89 4a 04             	mov    %ecx,0x4(%edx)
c01056f3:	89 04 02             	mov    %eax,(%edx,%eax,1)
c01056f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01056f9:	89 04 24             	mov    %eax,(%esp)
c01056fc:	e8 ef 02 00 00       	call   c01059f0 <__malloc_unlock>
c0105701:	8d 43 08             	lea    0x8(%ebx),%eax
c0105704:	e9 6e fb ff ff       	jmp    c0105277 <_malloc_r+0x77>
c0105709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105710:	89 75 dc             	mov    %esi,-0x24(%ebp)
c0105713:	e9 af fc ff ff       	jmp    c01053c7 <_malloc_r+0x1c7>
c0105718:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010571c:	83 c1 08             	add    $0x8,%ecx
c010571f:	f6 45 e0 03          	testb  $0x3,-0x20(%ebp)
c0105723:	0f 85 ad fc ff ff    	jne    c01053d6 <_malloc_r+0x1d6>
c0105729:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010572c:	eb 12                	jmp    c0105740 <_malloc_r+0x540>
c010572e:	66 90                	xchg   %ax,%ax
c0105730:	8d 56 f8             	lea    -0x8(%esi),%edx
c0105733:	8b 36                	mov    (%esi),%esi
c0105735:	83 e8 01             	sub    $0x1,%eax
c0105738:	39 d6                	cmp    %edx,%esi
c010573a:	0f 85 ea 01 00 00    	jne    c010592a <_malloc_r+0x72a>
c0105740:	a8 03                	test   $0x3,%al
c0105742:	75 ec                	jne    c0105730 <_malloc_r+0x530>
c0105744:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105747:	f7 d0                	not    %eax
c0105749:	23 05 84 b8 10 c0    	and    0xc010b884,%eax
c010574f:	a3 84 b8 10 c0       	mov    %eax,0xc010b884
c0105754:	d1 65 dc             	shll   -0x24(%ebp)
c0105757:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010575a:	39 c2                	cmp    %eax,%edx
c010575c:	0f 87 26 fd ff ff    	ja     c0105488 <_malloc_r+0x288>
c0105762:	85 d2                	test   %edx,%edx
c0105764:	0f 84 1e fd ff ff    	je     c0105488 <_malloc_r+0x288>
c010576a:	85 c2                	test   %eax,%edx
c010576c:	0f 85 c2 01 00 00    	jne    c0105934 <_malloc_r+0x734>
c0105772:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0105775:	89 f1                	mov    %esi,%ecx
c0105777:	01 d2                	add    %edx,%edx
c0105779:	83 c1 04             	add    $0x4,%ecx
c010577c:	85 d0                	test   %edx,%eax
c010577e:	74 f7                	je     c0105777 <_malloc_r+0x577>
c0105780:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105783:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105786:	e9 3c fc ff ff       	jmp    c01053c7 <_malloc_r+0x1c7>
c010578b:	90                   	nop
c010578c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105790:	8d 43 08             	lea    0x8(%ebx),%eax
c0105793:	8b 5b 14             	mov    0x14(%ebx),%ebx
c0105796:	39 d8                	cmp    %ebx,%eax
c0105798:	0f 85 b4 fa ff ff    	jne    c0105252 <_malloc_r+0x52>
c010579e:	8d 42 02             	lea    0x2(%edx),%eax
c01057a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01057a4:	e9 56 fb ff ff       	jmp    c01052ff <_malloc_r+0xff>
c01057a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01057b0:	83 4c 03 04 01       	orl    $0x1,0x4(%ebx,%eax,1)
c01057b5:	8b 53 08             	mov    0x8(%ebx),%edx
c01057b8:	8b 43 0c             	mov    0xc(%ebx),%eax
c01057bb:	89 42 0c             	mov    %eax,0xc(%edx)
c01057be:	89 50 08             	mov    %edx,0x8(%eax)
c01057c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01057c4:	89 04 24             	mov    %eax,(%esp)
c01057c7:	e8 24 02 00 00       	call   c01059f0 <__malloc_unlock>
c01057cc:	8d 43 08             	lea    0x8(%ebx),%eax
c01057cf:	e9 a3 fa ff ff       	jmp    c0105277 <_malloc_r+0x77>
c01057d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01057d8:	83 c6 5b             	add    $0x5b,%esi
c01057db:	8d 04 36             	lea    (%esi,%esi,1),%eax
c01057de:	e9 de fa ff ff       	jmp    c01052c1 <_malloc_r+0xc1>
c01057e3:	89 f1                	mov    %esi,%ecx
c01057e5:	c1 e9 06             	shr    $0x6,%ecx
c01057e8:	83 c1 38             	add    $0x38,%ecx
c01057eb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01057ee:	e9 92 fe ff ff       	jmp    c0105685 <_malloc_r+0x485>
c01057f3:	81 fb 80 b8 10 c0    	cmp    $0xc010b880,%ebx
c01057f9:	0f 84 f2 fc ff ff    	je     c01054f1 <_malloc_r+0x2f1>
c01057ff:	8b 1d 88 b8 10 c0    	mov    0xc010b888,%ebx
c0105805:	8b 53 04             	mov    0x4(%ebx),%edx
c0105808:	83 e2 fc             	and    $0xfffffffc,%edx
c010580b:	e9 de fd ff ff       	jmp    c01055ee <_malloc_r+0x3ee>
c0105810:	81 fe 54 01 00 00    	cmp    $0x154,%esi
c0105816:	77 3c                	ja     c0105854 <_malloc_r+0x654>
c0105818:	89 fe                	mov    %edi,%esi
c010581a:	c1 ee 0f             	shr    $0xf,%esi
c010581d:	83 c6 77             	add    $0x77,%esi
c0105820:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105823:	e9 99 fa ff ff       	jmp    c01052c1 <_malloc_r+0xc1>
c0105828:	c7 41 04 01 00 00 00 	movl   $0x1,0x4(%ecx)
c010582f:	89 cb                	mov    %ecx,%ebx
c0105831:	31 d2                	xor    %edx,%edx
c0105833:	e9 b6 fd ff ff       	jmp    c01055ee <_malloc_r+0x3ee>
c0105838:	c1 f9 02             	sar    $0x2,%ecx
c010583b:	b8 01 00 00 00       	mov    $0x1,%eax
c0105840:	d3 e0                	shl    %cl,%eax
c0105842:	89 d1                	mov    %edx,%ecx
c0105844:	0b 05 84 b8 10 c0    	or     0xc010b884,%eax
c010584a:	a3 84 b8 10 c0       	mov    %eax,0xc010b884
c010584f:	e9 5d fe ff ff       	jmp    c01056b1 <_malloc_r+0x4b1>
c0105854:	81 fe 54 05 00 00    	cmp    $0x554,%esi
c010585a:	77 47                	ja     c01058a3 <_malloc_r+0x6a3>
c010585c:	89 fe                	mov    %edi,%esi
c010585e:	c1 ee 12             	shr    $0x12,%esi
c0105861:	83 c6 7c             	add    $0x7c,%esi
c0105864:	8d 04 36             	lea    (%esi,%esi,1),%eax
c0105867:	e9 55 fa ff ff       	jmp    c01052c1 <_malloc_r+0xc1>
c010586c:	8b 45 08             	mov    0x8(%ebp),%eax
c010586f:	83 c3 08             	add    $0x8,%ebx
c0105872:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0105876:	89 04 24             	mov    %eax,(%esp)
c0105879:	e8 52 22 00 00       	call   c0107ad0 <_free_r>
c010587e:	8b 15 60 35 16 c0    	mov    0xc0163560,%edx
c0105884:	a1 88 b8 10 c0       	mov    0xc010b888,%eax
c0105889:	e9 3c fd ff ff       	jmp    c01055ca <_malloc_r+0x3ca>
c010588e:	83 f9 54             	cmp    $0x54,%ecx
c0105891:	77 58                	ja     c01058eb <_malloc_r+0x6eb>
c0105893:	89 f1                	mov    %esi,%ecx
c0105895:	c1 e9 0c             	shr    $0xc,%ecx
c0105898:	83 c1 6e             	add    $0x6e,%ecx
c010589b:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c010589e:	e9 e2 fd ff ff       	jmp    c0105685 <_malloc_r+0x485>
c01058a3:	b8 fc 00 00 00       	mov    $0xfc,%eax
c01058a8:	be 7e 00 00 00       	mov    $0x7e,%esi
c01058ad:	e9 0f fa ff ff       	jmp    c01052c1 <_malloc_r+0xc1>
c01058b2:	f7 45 e4 ff 0f 00 00 	testl  $0xfff,-0x1c(%ebp)
c01058b9:	0f 85 4a fc ff ff    	jne    c0105509 <_malloc_r+0x309>
c01058bf:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01058c2:	a1 88 b8 10 c0       	mov    0xc010b888,%eax
c01058c7:	01 f1                	add    %esi,%ecx
c01058c9:	83 c9 01             	or     $0x1,%ecx
c01058cc:	89 48 04             	mov    %ecx,0x4(%eax)
c01058cf:	e9 f6 fc ff ff       	jmp    c01055ca <_malloc_r+0x3ca>
c01058d4:	b8 01 00 00 00       	mov    $0x1,%eax
c01058d9:	31 d2                	xor    %edx,%edx
c01058db:	e9 91 fc ff ff       	jmp    c0105571 <_malloc_r+0x371>
c01058e0:	89 0d 60 b8 10 c0    	mov    %ecx,0xc010b860
c01058e6:	e9 37 fc ff ff       	jmp    c0105522 <_malloc_r+0x322>
c01058eb:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c01058f1:	77 10                	ja     c0105903 <_malloc_r+0x703>
c01058f3:	89 f1                	mov    %esi,%ecx
c01058f5:	c1 e9 0f             	shr    $0xf,%ecx
c01058f8:	83 c1 77             	add    $0x77,%ecx
c01058fb:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c01058fe:	e9 82 fd ff ff       	jmp    c0105685 <_malloc_r+0x485>
c0105903:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c0105909:	77 10                	ja     c010591b <_malloc_r+0x71b>
c010590b:	89 f1                	mov    %esi,%ecx
c010590d:	c1 e9 12             	shr    $0x12,%ecx
c0105910:	83 c1 7c             	add    $0x7c,%ecx
c0105913:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
c0105916:	e9 6a fd ff ff       	jmp    c0105685 <_malloc_r+0x485>
c010591b:	b8 fc 00 00 00       	mov    $0xfc,%eax
c0105920:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0105925:	e9 5b fd ff ff       	jmp    c0105685 <_malloc_r+0x485>
c010592a:	a1 84 b8 10 c0       	mov    0xc010b884,%eax
c010592f:	e9 20 fe ff ff       	jmp    c0105754 <_malloc_r+0x554>
c0105934:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105937:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010593a:	e9 88 fa ff ff       	jmp    c01053c7 <_malloc_r+0x1c7>
c010593f:	90                   	nop

c0105940 <memchr>:
c0105940:	55                   	push   %ebp
c0105941:	89 e5                	mov    %esp,%ebp
c0105943:	57                   	push   %edi
c0105944:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
c0105948:	8b 4d 10             	mov    0x10(%ebp),%ecx
c010594b:	8b 7d 08             	mov    0x8(%ebp),%edi
c010594e:	31 d2                	xor    %edx,%edx
c0105950:	85 c9                	test   %ecx,%ecx
c0105952:	74 79                	je     c01059cd <L20>
c0105954:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010595a:	74 28                	je     c0105984 <L5>
c010595c:	3a 07                	cmp    (%edi),%al
c010595e:	74 6a                	je     c01059ca <L15>
c0105960:	47                   	inc    %edi
c0105961:	49                   	dec    %ecx
c0105962:	74 69                	je     c01059cd <L20>
c0105964:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010596a:	74 18                	je     c0105984 <L5>
c010596c:	3a 07                	cmp    (%edi),%al
c010596e:	74 5a                	je     c01059ca <L15>
c0105970:	47                   	inc    %edi
c0105971:	49                   	dec    %ecx
c0105972:	74 59                	je     c01059cd <L20>
c0105974:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010597a:	74 08                	je     c0105984 <L5>
c010597c:	3a 07                	cmp    (%edi),%al
c010597e:	74 4a                	je     c01059ca <L15>
c0105980:	47                   	inc    %edi
c0105981:	49                   	dec    %ecx
c0105982:	74 49                	je     c01059cd <L20>

c0105984 <L5>:
c0105984:	88 c4                	mov    %al,%ah
c0105986:	89 c2                	mov    %eax,%edx
c0105988:	c1 e2 10             	shl    $0x10,%edx
c010598b:	09 d0                	or     %edx,%eax
c010598d:	53                   	push   %ebx
c010598e:	66 90                	xchg   %ax,%ax

c0105990 <L8>:
c0105990:	83 e9 04             	sub    $0x4,%ecx
c0105993:	72 1c                	jb     c01059b1 <L9>
c0105995:	8b 17                	mov    (%edi),%edx
c0105997:	83 c7 04             	add    $0x4,%edi
c010599a:	31 c2                	xor    %eax,%edx
c010599c:	8d 9a ff fe fe fe    	lea    -0x1010101(%edx),%ebx
c01059a2:	f7 d2                	not    %edx
c01059a4:	21 d3                	and    %edx,%ebx
c01059a6:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
c01059ac:	74 e2                	je     c0105990 <L8>
c01059ae:	83 ef 04             	sub    $0x4,%edi

c01059b1 <L9>:
c01059b1:	5b                   	pop    %ebx
c01059b2:	31 d2                	xor    %edx,%edx
c01059b4:	83 c1 04             	add    $0x4,%ecx
c01059b7:	74 14                	je     c01059cd <L20>
c01059b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01059c0 <L10>:
c01059c0:	3a 07                	cmp    (%edi),%al
c01059c2:	74 06                	je     c01059ca <L15>
c01059c4:	47                   	inc    %edi
c01059c5:	49                   	dec    %ecx
c01059c6:	75 f8                	jne    c01059c0 <L10>
c01059c8:	31 ff                	xor    %edi,%edi

c01059ca <L15>:
c01059ca:	4a                   	dec    %edx
c01059cb:	21 fa                	and    %edi,%edx

c01059cd <L20>:
c01059cd:	89 d0                	mov    %edx,%eax
c01059cf:	8d 65 fc             	lea    -0x4(%ebp),%esp
c01059d2:	5f                   	pop    %edi
c01059d3:	c9                   	leave  
c01059d4:	c3                   	ret    
c01059d5:	66 90                	xchg   %ax,%ax
c01059d7:	66 90                	xchg   %ax,%ax
c01059d9:	66 90                	xchg   %ax,%ax
c01059db:	66 90                	xchg   %ax,%ax
c01059dd:	66 90                	xchg   %ax,%ax
c01059df:	90                   	nop

c01059e0 <__malloc_lock>:
c01059e0:	55                   	push   %ebp
c01059e1:	89 e5                	mov    %esp,%ebp
c01059e3:	5d                   	pop    %ebp
c01059e4:	c3                   	ret    
c01059e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01059e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c01059f0 <__malloc_unlock>:
c01059f0:	55                   	push   %ebp
c01059f1:	89 e5                	mov    %esp,%ebp
c01059f3:	5d                   	pop    %ebp
c01059f4:	c3                   	ret    
c01059f5:	66 90                	xchg   %ax,%ax
c01059f7:	66 90                	xchg   %ax,%ax
c01059f9:	66 90                	xchg   %ax,%ax
c01059fb:	66 90                	xchg   %ax,%ax
c01059fd:	66 90                	xchg   %ax,%ax
c01059ff:	90                   	nop

c0105a00 <_Balloc>:
c0105a00:	55                   	push   %ebp
c0105a01:	89 e5                	mov    %esp,%ebp
c0105a03:	57                   	push   %edi
c0105a04:	56                   	push   %esi
c0105a05:	53                   	push   %ebx
c0105a06:	83 ec 1c             	sub    $0x1c,%esp
c0105a09:	8b 75 08             	mov    0x8(%ebp),%esi
c0105a0c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0105a0f:	8b 46 4c             	mov    0x4c(%esi),%eax
c0105a12:	85 c0                	test   %eax,%eax
c0105a14:	74 2a                	je     c0105a40 <_Balloc+0x40>
c0105a16:	8d 14 98             	lea    (%eax,%ebx,4),%edx
c0105a19:	8b 02                	mov    (%edx),%eax
c0105a1b:	85 c0                	test   %eax,%eax
c0105a1d:	74 49                	je     c0105a68 <_Balloc+0x68>
c0105a1f:	8b 08                	mov    (%eax),%ecx
c0105a21:	89 0a                	mov    %ecx,(%edx)
c0105a23:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c0105a2a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0105a31:	83 c4 1c             	add    $0x1c,%esp
c0105a34:	5b                   	pop    %ebx
c0105a35:	5e                   	pop    %esi
c0105a36:	5f                   	pop    %edi
c0105a37:	5d                   	pop    %ebp
c0105a38:	c3                   	ret    
c0105a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105a40:	c7 44 24 08 21 00 00 	movl   $0x21,0x8(%esp)
c0105a47:	00 
c0105a48:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
c0105a4f:	00 
c0105a50:	89 34 24             	mov    %esi,(%esp)
c0105a53:	e8 c8 1e 00 00       	call   c0107920 <_calloc_r>
c0105a58:	85 c0                	test   %eax,%eax
c0105a5a:	89 46 4c             	mov    %eax,0x4c(%esi)
c0105a5d:	75 b7                	jne    c0105a16 <_Balloc+0x16>
c0105a5f:	31 c0                	xor    %eax,%eax
c0105a61:	eb ce                	jmp    c0105a31 <_Balloc+0x31>
c0105a63:	90                   	nop
c0105a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105a68:	89 d9                	mov    %ebx,%ecx
c0105a6a:	bf 01 00 00 00       	mov    $0x1,%edi
c0105a6f:	d3 e7                	shl    %cl,%edi
c0105a71:	8d 04 bd 14 00 00 00 	lea    0x14(,%edi,4),%eax
c0105a78:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105a7c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105a83:	00 
c0105a84:	89 34 24             	mov    %esi,(%esp)
c0105a87:	e8 94 1e 00 00       	call   c0107920 <_calloc_r>
c0105a8c:	85 c0                	test   %eax,%eax
c0105a8e:	74 cf                	je     c0105a5f <_Balloc+0x5f>
c0105a90:	89 58 04             	mov    %ebx,0x4(%eax)
c0105a93:	89 78 08             	mov    %edi,0x8(%eax)
c0105a96:	eb 8b                	jmp    c0105a23 <_Balloc+0x23>
c0105a98:	90                   	nop
c0105a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105aa0 <_Bfree>:
c0105aa0:	55                   	push   %ebp
c0105aa1:	89 e5                	mov    %esp,%ebp
c0105aa3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105aa6:	85 c0                	test   %eax,%eax
c0105aa8:	74 12                	je     c0105abc <_Bfree+0x1c>
c0105aaa:	8b 55 08             	mov    0x8(%ebp),%edx
c0105aad:	8b 48 04             	mov    0x4(%eax),%ecx
c0105ab0:	8b 52 4c             	mov    0x4c(%edx),%edx
c0105ab3:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
c0105ab6:	8b 0a                	mov    (%edx),%ecx
c0105ab8:	89 08                	mov    %ecx,(%eax)
c0105aba:	89 02                	mov    %eax,(%edx)
c0105abc:	5d                   	pop    %ebp
c0105abd:	c3                   	ret    
c0105abe:	66 90                	xchg   %ax,%ax

c0105ac0 <__multadd>:
c0105ac0:	55                   	push   %ebp
c0105ac1:	89 e5                	mov    %esp,%ebp
c0105ac3:	57                   	push   %edi
c0105ac4:	56                   	push   %esi
c0105ac5:	53                   	push   %ebx
c0105ac6:	83 ec 2c             	sub    $0x2c,%esp
c0105ac9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105acc:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0105acf:	8b 40 10             	mov    0x10(%eax),%eax
c0105ad2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ad8:	8d 78 14             	lea    0x14(%eax),%edi
c0105adb:	31 c0                	xor    %eax,%eax
c0105add:	8d 76 00             	lea    0x0(%esi),%esi
c0105ae0:	8b 0c 87             	mov    (%edi,%eax,4),%ecx
c0105ae3:	0f b7 d1             	movzwl %cx,%edx
c0105ae6:	0f af 55 10          	imul   0x10(%ebp),%edx
c0105aea:	c1 e9 10             	shr    $0x10,%ecx
c0105aed:	0f af 4d 10          	imul   0x10(%ebp),%ecx
c0105af1:	01 da                	add    %ebx,%edx
c0105af3:	89 d3                	mov    %edx,%ebx
c0105af5:	0f b7 d2             	movzwl %dx,%edx
c0105af8:	c1 eb 10             	shr    $0x10,%ebx
c0105afb:	01 d9                	add    %ebx,%ecx
c0105afd:	89 ce                	mov    %ecx,%esi
c0105aff:	c1 e1 10             	shl    $0x10,%ecx
c0105b02:	01 d1                	add    %edx,%ecx
c0105b04:	c1 ee 10             	shr    $0x10,%esi
c0105b07:	89 0c 87             	mov    %ecx,(%edi,%eax,4)
c0105b0a:	83 c0 01             	add    $0x1,%eax
c0105b0d:	89 f3                	mov    %esi,%ebx
c0105b0f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0105b12:	7f cc                	jg     c0105ae0 <__multadd+0x20>
c0105b14:	85 f6                	test   %esi,%esi
c0105b16:	74 1b                	je     c0105b33 <__multadd+0x73>
c0105b18:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b1b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
c0105b1e:	3b 78 08             	cmp    0x8(%eax),%edi
c0105b21:	7d 1d                	jge    c0105b40 <__multadd+0x80>
c0105b23:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105b26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b29:	89 74 87 14          	mov    %esi,0x14(%edi,%eax,4)
c0105b2d:	83 c0 01             	add    $0x1,%eax
c0105b30:	89 47 10             	mov    %eax,0x10(%edi)
c0105b33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b36:	83 c4 2c             	add    $0x2c,%esp
c0105b39:	5b                   	pop    %ebx
c0105b3a:	5e                   	pop    %esi
c0105b3b:	5f                   	pop    %edi
c0105b3c:	5d                   	pop    %ebp
c0105b3d:	c3                   	ret    
c0105b3e:	66 90                	xchg   %ax,%ax
c0105b40:	8b 40 04             	mov    0x4(%eax),%eax
c0105b43:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105b46:	83 c0 01             	add    $0x1,%eax
c0105b49:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105b4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b50:	89 04 24             	mov    %eax,(%esp)
c0105b53:	e8 a8 fe ff ff       	call   c0105a00 <_Balloc>
c0105b58:	89 c3                	mov    %eax,%ebx
c0105b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b5d:	8b 40 10             	mov    0x10(%eax),%eax
c0105b60:	8d 04 85 08 00 00 00 	lea    0x8(,%eax,4),%eax
c0105b67:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105b6b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b6e:	83 c0 0c             	add    $0xc,%eax
c0105b71:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105b75:	8d 43 0c             	lea    0xc(%ebx),%eax
c0105b78:	89 04 24             	mov    %eax,(%esp)
c0105b7b:	e8 60 c0 ff ff       	call   c0101be0 <memcpy>
c0105b80:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b83:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105b86:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0105b89:	8b 50 04             	mov    0x4(%eax),%edx
c0105b8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b8f:	8b 40 4c             	mov    0x4c(%eax),%eax
c0105b92:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105b95:	8b 10                	mov    (%eax),%edx
c0105b97:	89 17                	mov    %edx,(%edi)
c0105b99:	89 38                	mov    %edi,(%eax)
c0105b9b:	eb 86                	jmp    c0105b23 <__multadd+0x63>
c0105b9d:	8d 76 00             	lea    0x0(%esi),%esi

c0105ba0 <__s2b>:
c0105ba0:	55                   	push   %ebp
c0105ba1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
c0105ba6:	89 e5                	mov    %esp,%ebp
c0105ba8:	57                   	push   %edi
c0105ba9:	56                   	push   %esi
c0105baa:	53                   	push   %ebx
c0105bab:	83 ec 2c             	sub    $0x2c,%esp
c0105bae:	8b 45 14             	mov    0x14(%ebp),%eax
c0105bb1:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105bb4:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105bb7:	8d 48 08             	lea    0x8(%eax),%ecx
c0105bba:	89 c8                	mov    %ecx,%eax
c0105bbc:	f7 ea                	imul   %edx
c0105bbe:	c1 f9 1f             	sar    $0x1f,%ecx
c0105bc1:	d1 fa                	sar    %edx
c0105bc3:	29 ca                	sub    %ecx,%edx
c0105bc5:	83 fa 01             	cmp    $0x1,%edx
c0105bc8:	0f 8e be 00 00 00    	jle    c0105c8c <__s2b+0xec>
c0105bce:	b8 01 00 00 00       	mov    $0x1,%eax
c0105bd3:	31 c9                	xor    %ecx,%ecx
c0105bd5:	8d 76 00             	lea    0x0(%esi),%esi
c0105bd8:	01 c0                	add    %eax,%eax
c0105bda:	83 c1 01             	add    $0x1,%ecx
c0105bdd:	39 c2                	cmp    %eax,%edx
c0105bdf:	7f f7                	jg     c0105bd8 <__s2b+0x38>
c0105be1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0105be5:	89 1c 24             	mov    %ebx,(%esp)
c0105be8:	e8 13 fe ff ff       	call   c0105a00 <_Balloc>
c0105bed:	8b 55 18             	mov    0x18(%ebp),%edx
c0105bf0:	83 7d 10 09          	cmpl   $0x9,0x10(%ebp)
c0105bf4:	89 50 14             	mov    %edx,0x14(%eax)
c0105bf7:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105bfe:	0f 8e 7c 00 00 00    	jle    c0105c80 <__s2b+0xe0>
c0105c04:	8d 4e 09             	lea    0x9(%esi),%ecx
c0105c07:	03 75 10             	add    0x10(%ebp),%esi
c0105c0a:	89 cf                	mov    %ecx,%edi
c0105c0c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105c0f:	90                   	nop
c0105c10:	83 c7 01             	add    $0x1,%edi
c0105c13:	0f be 57 ff          	movsbl -0x1(%edi),%edx
c0105c17:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0105c1e:	00 
c0105c1f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105c23:	89 1c 24             	mov    %ebx,(%esp)
c0105c26:	83 ea 30             	sub    $0x30,%edx
c0105c29:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0105c2d:	e8 8e fe ff ff       	call   c0105ac0 <__multadd>
c0105c32:	39 f7                	cmp    %esi,%edi
c0105c34:	75 da                	jne    c0105c10 <__s2b+0x70>
c0105c36:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105c39:	8b 7d 10             	mov    0x10(%ebp),%edi
c0105c3c:	8d 74 39 f8          	lea    -0x8(%ecx,%edi,1),%esi
c0105c40:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0105c43:	39 4d 14             	cmp    %ecx,0x14(%ebp)
c0105c46:	7e 2e                	jle    c0105c76 <__s2b+0xd6>
c0105c48:	8b 7d 14             	mov    0x14(%ebp),%edi
c0105c4b:	29 cf                	sub    %ecx,%edi
c0105c4d:	01 f7                	add    %esi,%edi
c0105c4f:	90                   	nop
c0105c50:	83 c6 01             	add    $0x1,%esi
c0105c53:	0f be 56 ff          	movsbl -0x1(%esi),%edx
c0105c57:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
c0105c5e:	00 
c0105c5f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105c63:	89 1c 24             	mov    %ebx,(%esp)
c0105c66:	83 ea 30             	sub    $0x30,%edx
c0105c69:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0105c6d:	e8 4e fe ff ff       	call   c0105ac0 <__multadd>
c0105c72:	39 fe                	cmp    %edi,%esi
c0105c74:	75 da                	jne    c0105c50 <__s2b+0xb0>
c0105c76:	83 c4 2c             	add    $0x2c,%esp
c0105c79:	5b                   	pop    %ebx
c0105c7a:	5e                   	pop    %esi
c0105c7b:	5f                   	pop    %edi
c0105c7c:	5d                   	pop    %ebp
c0105c7d:	c3                   	ret    
c0105c7e:	66 90                	xchg   %ax,%ax
c0105c80:	83 c6 0a             	add    $0xa,%esi
c0105c83:	c7 45 10 09 00 00 00 	movl   $0x9,0x10(%ebp)
c0105c8a:	eb b4                	jmp    c0105c40 <__s2b+0xa0>
c0105c8c:	31 c9                	xor    %ecx,%ecx
c0105c8e:	e9 4e ff ff ff       	jmp    c0105be1 <__s2b+0x41>
c0105c93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0105c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0105ca0 <__hi0bits>:
c0105ca0:	55                   	push   %ebp
c0105ca1:	31 c9                	xor    %ecx,%ecx
c0105ca3:	89 e5                	mov    %esp,%ebp
c0105ca5:	8b 55 08             	mov    0x8(%ebp),%edx
c0105ca8:	f7 c2 00 00 ff ff    	test   $0xffff0000,%edx
c0105cae:	75 05                	jne    c0105cb5 <__hi0bits+0x15>
c0105cb0:	c1 e2 10             	shl    $0x10,%edx
c0105cb3:	b1 10                	mov    $0x10,%cl
c0105cb5:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
c0105cbb:	75 06                	jne    c0105cc3 <__hi0bits+0x23>
c0105cbd:	83 c1 08             	add    $0x8,%ecx
c0105cc0:	c1 e2 08             	shl    $0x8,%edx
c0105cc3:	f7 c2 00 00 00 f0    	test   $0xf0000000,%edx
c0105cc9:	75 06                	jne    c0105cd1 <__hi0bits+0x31>
c0105ccb:	83 c1 04             	add    $0x4,%ecx
c0105cce:	c1 e2 04             	shl    $0x4,%edx
c0105cd1:	f7 c2 00 00 00 c0    	test   $0xc0000000,%edx
c0105cd7:	75 06                	jne    c0105cdf <__hi0bits+0x3f>
c0105cd9:	83 c1 02             	add    $0x2,%ecx
c0105cdc:	c1 e2 02             	shl    $0x2,%edx
c0105cdf:	85 d2                	test   %edx,%edx
c0105ce1:	89 c8                	mov    %ecx,%eax
c0105ce3:	78 0d                	js     c0105cf2 <__hi0bits+0x52>
c0105ce5:	81 e2 00 00 00 40    	and    $0x40000000,%edx
c0105ceb:	b8 20 00 00 00       	mov    $0x20,%eax
c0105cf0:	75 06                	jne    c0105cf8 <__hi0bits+0x58>
c0105cf2:	5d                   	pop    %ebp
c0105cf3:	c3                   	ret    
c0105cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105cf8:	8d 41 01             	lea    0x1(%ecx),%eax
c0105cfb:	5d                   	pop    %ebp
c0105cfc:	c3                   	ret    
c0105cfd:	8d 76 00             	lea    0x0(%esi),%esi

c0105d00 <__lo0bits>:
c0105d00:	55                   	push   %ebp
c0105d01:	89 e5                	mov    %esp,%ebp
c0105d03:	53                   	push   %ebx
c0105d04:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0105d07:	8b 13                	mov    (%ebx),%edx
c0105d09:	f6 c2 07             	test   $0x7,%dl
c0105d0c:	74 1a                	je     c0105d28 <__lo0bits+0x28>
c0105d0e:	31 c0                	xor    %eax,%eax
c0105d10:	f6 c2 01             	test   $0x1,%dl
c0105d13:	75 0f                	jne    c0105d24 <__lo0bits+0x24>
c0105d15:	f6 c2 02             	test   $0x2,%dl
c0105d18:	75 56                	jne    c0105d70 <__lo0bits+0x70>
c0105d1a:	c1 ea 02             	shr    $0x2,%edx
c0105d1d:	b8 02 00 00 00       	mov    $0x2,%eax
c0105d22:	89 13                	mov    %edx,(%ebx)
c0105d24:	5b                   	pop    %ebx
c0105d25:	5d                   	pop    %ebp
c0105d26:	c3                   	ret    
c0105d27:	90                   	nop
c0105d28:	31 c9                	xor    %ecx,%ecx
c0105d2a:	66 85 d2             	test   %dx,%dx
c0105d2d:	75 05                	jne    c0105d34 <__lo0bits+0x34>
c0105d2f:	c1 ea 10             	shr    $0x10,%edx
c0105d32:	b1 10                	mov    $0x10,%cl
c0105d34:	84 d2                	test   %dl,%dl
c0105d36:	75 06                	jne    c0105d3e <__lo0bits+0x3e>
c0105d38:	83 c1 08             	add    $0x8,%ecx
c0105d3b:	c1 ea 08             	shr    $0x8,%edx
c0105d3e:	f6 c2 0f             	test   $0xf,%dl
c0105d41:	75 06                	jne    c0105d49 <__lo0bits+0x49>
c0105d43:	83 c1 04             	add    $0x4,%ecx
c0105d46:	c1 ea 04             	shr    $0x4,%edx
c0105d49:	f6 c2 03             	test   $0x3,%dl
c0105d4c:	75 06                	jne    c0105d54 <__lo0bits+0x54>
c0105d4e:	83 c1 02             	add    $0x2,%ecx
c0105d51:	c1 ea 02             	shr    $0x2,%edx
c0105d54:	f6 c2 01             	test   $0x1,%dl
c0105d57:	75 0c                	jne    c0105d65 <__lo0bits+0x65>
c0105d59:	d1 ea                	shr    %edx
c0105d5b:	b8 20 00 00 00       	mov    $0x20,%eax
c0105d60:	74 c2                	je     c0105d24 <__lo0bits+0x24>
c0105d62:	83 c1 01             	add    $0x1,%ecx
c0105d65:	89 13                	mov    %edx,(%ebx)
c0105d67:	89 c8                	mov    %ecx,%eax
c0105d69:	5b                   	pop    %ebx
c0105d6a:	5d                   	pop    %ebp
c0105d6b:	c3                   	ret    
c0105d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105d70:	d1 ea                	shr    %edx
c0105d72:	b0 01                	mov    $0x1,%al
c0105d74:	89 13                	mov    %edx,(%ebx)
c0105d76:	5b                   	pop    %ebx
c0105d77:	5d                   	pop    %ebp
c0105d78:	c3                   	ret    
c0105d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105d80 <__i2b>:
c0105d80:	55                   	push   %ebp
c0105d81:	89 e5                	mov    %esp,%ebp
c0105d83:	83 ec 18             	sub    $0x18,%esp
c0105d86:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d89:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105d90:	00 
c0105d91:	89 04 24             	mov    %eax,(%esp)
c0105d94:	e8 67 fc ff ff       	call   c0105a00 <_Balloc>
c0105d99:	8b 55 0c             	mov    0xc(%ebp),%edx
c0105d9c:	89 50 14             	mov    %edx,0x14(%eax)
c0105d9f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0105da6:	c9                   	leave  
c0105da7:	c3                   	ret    
c0105da8:	90                   	nop
c0105da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c0105db0 <__multiply>:
c0105db0:	55                   	push   %ebp
c0105db1:	89 e5                	mov    %esp,%ebp
c0105db3:	57                   	push   %edi
c0105db4:	56                   	push   %esi
c0105db5:	53                   	push   %ebx
c0105db6:	83 ec 3c             	sub    $0x3c,%esp
c0105db9:	8b 75 0c             	mov    0xc(%ebp),%esi
c0105dbc:	8b 45 10             	mov    0x10(%ebp),%eax
c0105dbf:	8b 7e 10             	mov    0x10(%esi),%edi
c0105dc2:	8b 58 10             	mov    0x10(%eax),%ebx
c0105dc5:	39 df                	cmp    %ebx,%edi
c0105dc7:	7d 0e                	jge    c0105dd7 <__multiply+0x27>
c0105dc9:	89 f8                	mov    %edi,%eax
c0105dcb:	89 df                	mov    %ebx,%edi
c0105dcd:	89 c3                	mov    %eax,%ebx
c0105dcf:	89 f0                	mov    %esi,%eax
c0105dd1:	8b 75 10             	mov    0x10(%ebp),%esi
c0105dd4:	89 45 10             	mov    %eax,0x10(%ebp)
c0105dd7:	8d 04 1f             	lea    (%edi,%ebx,1),%eax
c0105dda:	3b 46 08             	cmp    0x8(%esi),%eax
c0105ddd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105de0:	0f 9f c0             	setg   %al
c0105de3:	0f b6 c0             	movzbl %al,%eax
c0105de6:	03 46 04             	add    0x4(%esi),%eax
c0105de9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0105ded:	8b 45 08             	mov    0x8(%ebp),%eax
c0105df0:	89 04 24             	mov    %eax,(%esp)
c0105df3:	e8 08 fc ff ff       	call   c0105a00 <_Balloc>
c0105df8:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105dfb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105dfe:	8d 40 14             	lea    0x14(%eax),%eax
c0105e01:	8d 14 90             	lea    (%eax,%edx,4),%edx
c0105e04:	89 d1                	mov    %edx,%ecx
c0105e06:	39 c8                	cmp    %ecx,%eax
c0105e08:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105e0b:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0105e0e:	73 15                	jae    c0105e25 <__multiply+0x75>
c0105e10:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105e13:	90                   	nop
c0105e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105e18:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0105e1e:	83 c0 04             	add    $0x4,%eax
c0105e21:	39 c2                	cmp    %eax,%edx
c0105e23:	77 f3                	ja     c0105e18 <__multiply+0x68>
c0105e25:	8d 46 14             	lea    0x14(%esi),%eax
c0105e28:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105e2b:	8d 04 b8             	lea    (%eax,%edi,4),%eax
c0105e2e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105e31:	8b 45 10             	mov    0x10(%ebp),%eax
c0105e34:	83 c0 14             	add    $0x14,%eax
c0105e37:	8d 3c 98             	lea    (%eax,%ebx,4),%edi
c0105e3a:	39 f8                	cmp    %edi,%eax
c0105e3c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e3f:	89 7d cc             	mov    %edi,-0x34(%ebp)
c0105e42:	0f 83 e8 00 00 00    	jae    c0105f30 <__multiply+0x180>
c0105e48:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105e4b:	8b 00                	mov    (%eax),%eax
c0105e4d:	0f b7 f8             	movzwl %ax,%edi
c0105e50:	85 ff                	test   %edi,%edi
c0105e52:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0105e55:	74 5a                	je     c0105eb1 <__multiply+0x101>
c0105e57:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0105e5a:	31 db                	xor    %ebx,%ebx
c0105e5c:	8b 75 d0             	mov    -0x30(%ebp),%esi
c0105e5f:	eb 09                	jmp    c0105e6a <__multiply+0xba>
c0105e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0105e68:	89 fa                	mov    %edi,%edx
c0105e6a:	8b 0e                	mov    (%esi),%ecx
c0105e6c:	83 c6 04             	add    $0x4,%esi
c0105e6f:	0f b7 3a             	movzwl (%edx),%edi
c0105e72:	0f b7 c1             	movzwl %cx,%eax
c0105e75:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
c0105e79:	c1 e9 10             	shr    $0x10,%ecx
c0105e7c:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105e80:	01 f8                	add    %edi,%eax
c0105e82:	01 d8                	add    %ebx,%eax
c0105e84:	8b 1a                	mov    (%edx),%ebx
c0105e86:	8d 7a 04             	lea    0x4(%edx),%edi
c0105e89:	c1 eb 10             	shr    $0x10,%ebx
c0105e8c:	01 d9                	add    %ebx,%ecx
c0105e8e:	89 c3                	mov    %eax,%ebx
c0105e90:	c1 eb 10             	shr    $0x10,%ebx
c0105e93:	0f b7 c0             	movzwl %ax,%eax
c0105e96:	01 d9                	add    %ebx,%ecx
c0105e98:	89 cb                	mov    %ecx,%ebx
c0105e9a:	c1 e1 10             	shl    $0x10,%ecx
c0105e9d:	09 c1                	or     %eax,%ecx
c0105e9f:	c1 eb 10             	shr    $0x10,%ebx
c0105ea2:	39 75 dc             	cmp    %esi,-0x24(%ebp)
c0105ea5:	89 0a                	mov    %ecx,(%edx)
c0105ea7:	77 bf                	ja     c0105e68 <__multiply+0xb8>
c0105ea9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105eac:	89 5a 04             	mov    %ebx,0x4(%edx)
c0105eaf:	8b 00                	mov    (%eax),%eax
c0105eb1:	c1 e8 10             	shr    $0x10,%eax
c0105eb4:	85 c0                	test   %eax,%eax
c0105eb6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105eb9:	74 61                	je     c0105f1c <__multiply+0x16c>
c0105ebb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105ebe:	31 ff                	xor    %edi,%edi
c0105ec0:	89 fe                	mov    %edi,%esi
c0105ec2:	8b 10                	mov    (%eax),%edx
c0105ec4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ec7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105eca:	89 d3                	mov    %edx,%ebx
c0105ecc:	eb 05                	jmp    c0105ed3 <__multiply+0x123>
c0105ece:	66 90                	xchg   %ax,%ax
c0105ed0:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0105ed3:	0f b7 08             	movzwl (%eax),%ecx
c0105ed6:	c1 eb 10             	shr    $0x10,%ebx
c0105ed9:	0f b7 d2             	movzwl %dx,%edx
c0105edc:	0f af 4d e4          	imul   -0x1c(%ebp),%ecx
c0105ee0:	83 c0 04             	add    $0x4,%eax
c0105ee3:	8d 3c 19             	lea    (%ecx,%ebx,1),%edi
c0105ee6:	01 f7                	add    %esi,%edi
c0105ee8:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0105eeb:	89 fb                	mov    %edi,%ebx
c0105eed:	c1 e3 10             	shl    $0x10,%ebx
c0105ef0:	09 d3                	or     %edx,%ebx
c0105ef2:	89 1e                	mov    %ebx,(%esi)
c0105ef4:	8b 5e 04             	mov    0x4(%esi),%ebx
c0105ef7:	8d 4e 04             	lea    0x4(%esi),%ecx
c0105efa:	0f b7 50 fe          	movzwl -0x2(%eax),%edx
c0105efe:	c1 ef 10             	shr    $0x10,%edi
c0105f01:	0f af 55 e4          	imul   -0x1c(%ebp),%edx
c0105f05:	0f b7 f3             	movzwl %bx,%esi
c0105f08:	01 f2                	add    %esi,%edx
c0105f0a:	01 fa                	add    %edi,%edx
c0105f0c:	89 d6                	mov    %edx,%esi
c0105f0e:	c1 ee 10             	shr    $0x10,%esi
c0105f11:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0105f14:	77 ba                	ja     c0105ed0 <__multiply+0x120>
c0105f16:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105f19:	89 50 04             	mov    %edx,0x4(%eax)
c0105f1c:	83 45 d8 04          	addl   $0x4,-0x28(%ebp)
c0105f20:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105f23:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c0105f27:	39 45 cc             	cmp    %eax,-0x34(%ebp)
c0105f2a:	0f 87 18 ff ff ff    	ja     c0105e48 <__multiply+0x98>
c0105f30:	8b 75 c8             	mov    -0x38(%ebp),%esi
c0105f33:	85 f6                	test   %esi,%esi
c0105f35:	7e 29                	jle    c0105f60 <__multiply+0x1b0>
c0105f37:	8b 7d c4             	mov    -0x3c(%ebp),%edi
c0105f3a:	8b 5f fc             	mov    -0x4(%edi),%ebx
c0105f3d:	85 db                	test   %ebx,%ebx
c0105f3f:	75 1f                	jne    c0105f60 <__multiply+0x1b0>
c0105f41:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105f44:	89 d0                	mov    %edx,%eax
c0105f46:	c1 e0 02             	shl    $0x2,%eax
c0105f49:	29 c7                	sub    %eax,%edi
c0105f4b:	89 f8                	mov    %edi,%eax
c0105f4d:	eb 09                	jmp    c0105f58 <__multiply+0x1a8>
c0105f4f:	90                   	nop
c0105f50:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c0105f54:	85 c9                	test   %ecx,%ecx
c0105f56:	75 05                	jne    c0105f5d <__multiply+0x1ad>
c0105f58:	83 ea 01             	sub    $0x1,%edx
c0105f5b:	75 f3                	jne    c0105f50 <__multiply+0x1a0>
c0105f5d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105f60:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0105f63:	8b 7d c8             	mov    -0x38(%ebp),%edi
c0105f66:	89 78 10             	mov    %edi,0x10(%eax)
c0105f69:	83 c4 3c             	add    $0x3c,%esp
c0105f6c:	5b                   	pop    %ebx
c0105f6d:	5e                   	pop    %esi
c0105f6e:	5f                   	pop    %edi
c0105f6f:	5d                   	pop    %ebp
c0105f70:	c3                   	ret    
c0105f71:	eb 0d                	jmp    c0105f80 <__pow5mult>
c0105f73:	90                   	nop
c0105f74:	90                   	nop
c0105f75:	90                   	nop
c0105f76:	90                   	nop
c0105f77:	90                   	nop
c0105f78:	90                   	nop
c0105f79:	90                   	nop
c0105f7a:	90                   	nop
c0105f7b:	90                   	nop
c0105f7c:	90                   	nop
c0105f7d:	90                   	nop
c0105f7e:	90                   	nop
c0105f7f:	90                   	nop

c0105f80 <__pow5mult>:
c0105f80:	55                   	push   %ebp
c0105f81:	89 e5                	mov    %esp,%ebp
c0105f83:	57                   	push   %edi
c0105f84:	56                   	push   %esi
c0105f85:	53                   	push   %ebx
c0105f86:	83 ec 2c             	sub    $0x2c,%esp
c0105f89:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0105f8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0105f8f:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0105f92:	89 d8                	mov    %ebx,%eax
c0105f94:	83 e0 03             	and    $0x3,%eax
c0105f97:	0f 85 a3 00 00 00    	jne    c0106040 <__pow5mult+0xc0>
c0105f9d:	c1 fb 02             	sar    $0x2,%ebx
c0105fa0:	85 db                	test   %ebx,%ebx
c0105fa2:	74 5c                	je     c0106000 <__pow5mult+0x80>
c0105fa4:	8b 71 48             	mov    0x48(%ecx),%esi
c0105fa7:	85 f6                	test   %esi,%esi
c0105fa9:	0f 84 bd 00 00 00    	je     c010606c <__pow5mult+0xec>
c0105faf:	f6 c3 01             	test   $0x1,%bl
c0105fb2:	75 15                	jne    c0105fc9 <__pow5mult+0x49>
c0105fb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0105fb8:	d1 fb                	sar    %ebx
c0105fba:	74 44                	je     c0106000 <__pow5mult+0x80>
c0105fbc:	8b 06                	mov    (%esi),%eax
c0105fbe:	85 c0                	test   %eax,%eax
c0105fc0:	74 4e                	je     c0106010 <__pow5mult+0x90>
c0105fc2:	89 c6                	mov    %eax,%esi
c0105fc4:	f6 c3 01             	test   $0x1,%bl
c0105fc7:	74 ef                	je     c0105fb8 <__pow5mult+0x38>
c0105fc9:	89 0c 24             	mov    %ecx,(%esp)
c0105fcc:	89 74 24 08          	mov    %esi,0x8(%esp)
c0105fd0:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0105fd4:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0105fd7:	e8 d4 fd ff ff       	call   c0105db0 <__multiply>
c0105fdc:	85 ff                	test   %edi,%edi
c0105fde:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0105fe1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105fe4:	74 52                	je     c0106038 <__pow5mult+0xb8>
c0105fe6:	8b 57 04             	mov    0x4(%edi),%edx
c0105fe9:	d1 fb                	sar    %ebx
c0105feb:	8b 41 4c             	mov    0x4c(%ecx),%eax
c0105fee:	8d 04 90             	lea    (%eax,%edx,4),%eax
c0105ff1:	8b 10                	mov    (%eax),%edx
c0105ff3:	89 17                	mov    %edx,(%edi)
c0105ff5:	89 38                	mov    %edi,(%eax)
c0105ff7:	8b 7d e0             	mov    -0x20(%ebp),%edi
c0105ffa:	75 c0                	jne    c0105fbc <__pow5mult+0x3c>
c0105ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106000:	83 c4 2c             	add    $0x2c,%esp
c0106003:	89 f8                	mov    %edi,%eax
c0106005:	5b                   	pop    %ebx
c0106006:	5e                   	pop    %esi
c0106007:	5f                   	pop    %edi
c0106008:	5d                   	pop    %ebp
c0106009:	c3                   	ret    
c010600a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106010:	89 74 24 08          	mov    %esi,0x8(%esp)
c0106014:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106018:	89 0c 24             	mov    %ecx,(%esp)
c010601b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010601e:	e8 8d fd ff ff       	call   c0105db0 <__multiply>
c0106023:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0106026:	89 06                	mov    %eax,(%esi)
c0106028:	89 c6                	mov    %eax,%esi
c010602a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106030:	eb 92                	jmp    c0105fc4 <__pow5mult+0x44>
c0106032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106038:	8b 7d e0             	mov    -0x20(%ebp),%edi
c010603b:	e9 78 ff ff ff       	jmp    c0105fb8 <__pow5mult+0x38>
c0106040:	8b 04 85 fc 8f 10 c0 	mov    -0x3fef7004(,%eax,4),%eax
c0106047:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010604b:	89 0c 24             	mov    %ecx,(%esp)
c010604e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0106055:	00 
c0106056:	89 44 24 08          	mov    %eax,0x8(%esp)
c010605a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010605d:	e8 5e fa ff ff       	call   c0105ac0 <__multadd>
c0106062:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0106065:	89 c7                	mov    %eax,%edi
c0106067:	e9 31 ff ff ff       	jmp    c0105f9d <__pow5mult+0x1d>
c010606c:	89 0c 24             	mov    %ecx,(%esp)
c010606f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106076:	00 
c0106077:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c010607a:	e8 81 f9 ff ff       	call   c0105a00 <_Balloc>
c010607f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0106082:	c7 40 14 71 02 00 00 	movl   $0x271,0x14(%eax)
c0106089:	89 c6                	mov    %eax,%esi
c010608b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0106092:	89 41 48             	mov    %eax,0x48(%ecx)
c0106095:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010609b:	e9 0f ff ff ff       	jmp    c0105faf <__pow5mult+0x2f>

c01060a0 <__lshift>:
c01060a0:	55                   	push   %ebp
c01060a1:	89 e5                	mov    %esp,%ebp
c01060a3:	57                   	push   %edi
c01060a4:	56                   	push   %esi
c01060a5:	53                   	push   %ebx
c01060a6:	83 ec 2c             	sub    $0x2c,%esp
c01060a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060ac:	8b 75 10             	mov    0x10(%ebp),%esi
c01060af:	89 c7                	mov    %eax,%edi
c01060b1:	8b 50 04             	mov    0x4(%eax),%edx
c01060b4:	8b 40 10             	mov    0x10(%eax),%eax
c01060b7:	89 f3                	mov    %esi,%ebx
c01060b9:	c1 fb 05             	sar    $0x5,%ebx
c01060bc:	01 d8                	add    %ebx,%eax
c01060be:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01060c1:	83 c0 01             	add    $0x1,%eax
c01060c4:	89 c1                	mov    %eax,%ecx
c01060c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060c9:	8b 47 08             	mov    0x8(%edi),%eax
c01060cc:	39 c1                	cmp    %eax,%ecx
c01060ce:	7e 09                	jle    c01060d9 <__lshift+0x39>
c01060d0:	01 c0                	add    %eax,%eax
c01060d2:	83 c2 01             	add    $0x1,%edx
c01060d5:	39 c1                	cmp    %eax,%ecx
c01060d7:	7f f7                	jg     c01060d0 <__lshift+0x30>
c01060d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01060dc:	89 54 24 04          	mov    %edx,0x4(%esp)
c01060e0:	89 04 24             	mov    %eax,(%esp)
c01060e3:	e8 18 f9 ff ff       	call   c0105a00 <_Balloc>
c01060e8:	85 db                	test   %ebx,%ebx
c01060ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01060ed:	8d 50 14             	lea    0x14(%eax),%edx
c01060f0:	7e 17                	jle    c0106109 <__lshift+0x69>
c01060f2:	31 c0                	xor    %eax,%eax
c01060f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01060f8:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
c01060ff:	83 c0 01             	add    $0x1,%eax
c0106102:	39 d8                	cmp    %ebx,%eax
c0106104:	75 f2                	jne    c01060f8 <__lshift+0x58>
c0106106:	8d 14 82             	lea    (%edx,%eax,4),%edx
c0106109:	8b 7d 0c             	mov    0xc(%ebp),%edi
c010610c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010610f:	8b 4f 10             	mov    0x10(%edi),%ecx
c0106112:	83 c0 14             	add    $0x14,%eax
c0106115:	83 e6 1f             	and    $0x1f,%esi
c0106118:	89 75 e0             	mov    %esi,-0x20(%ebp)
c010611b:	8d 3c 88             	lea    (%eax,%ecx,4),%edi
c010611e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
c0106121:	74 7d                	je     c01061a0 <__lshift+0x100>
c0106123:	c7 45 dc 20 00 00 00 	movl   $0x20,-0x24(%ebp)
c010612a:	29 75 dc             	sub    %esi,-0x24(%ebp)
c010612d:	31 f6                	xor    %esi,%esi
c010612f:	eb 09                	jmp    c010613a <__lshift+0x9a>
c0106131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106138:	89 fa                	mov    %edi,%edx
c010613a:	8b 18                	mov    (%eax),%ebx
c010613c:	83 c0 04             	add    $0x4,%eax
c010613f:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c0106143:	8d 7a 04             	lea    0x4(%edx),%edi
c0106146:	d3 e3                	shl    %cl,%ebx
c0106148:	0f b6 4d dc          	movzbl -0x24(%ebp),%ecx
c010614c:	09 f3                	or     %esi,%ebx
c010614e:	89 1a                	mov    %ebx,(%edx)
c0106150:	8b 70 fc             	mov    -0x4(%eax),%esi
c0106153:	d3 ee                	shr    %cl,%esi
c0106155:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0106158:	77 de                	ja     c0106138 <__lshift+0x98>
c010615a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010615d:	89 72 04             	mov    %esi,0x4(%edx)
c0106160:	83 c0 02             	add    $0x2,%eax
c0106163:	85 f6                	test   %esi,%esi
c0106165:	0f 44 45 d8          	cmove  -0x28(%ebp),%eax
c0106169:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010616c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010616f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0106172:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106175:	83 e8 01             	sub    $0x1,%eax
c0106178:	89 47 10             	mov    %eax,0x10(%edi)
c010617b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010617e:	8b 50 04             	mov    0x4(%eax),%edx
c0106181:	8b 45 08             	mov    0x8(%ebp),%eax
c0106184:	8b 40 4c             	mov    0x4c(%eax),%eax
c0106187:	8d 04 90             	lea    (%eax,%edx,4),%eax
c010618a:	8b 10                	mov    (%eax),%edx
c010618c:	89 16                	mov    %edx,(%esi)
c010618e:	89 30                	mov    %esi,(%eax)
c0106190:	83 c4 2c             	add    $0x2c,%esp
c0106193:	89 f8                	mov    %edi,%eax
c0106195:	5b                   	pop    %ebx
c0106196:	5e                   	pop    %esi
c0106197:	5f                   	pop    %edi
c0106198:	5d                   	pop    %ebp
c0106199:	c3                   	ret    
c010619a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c01061a0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
c01061a3:	90                   	nop
c01061a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01061a8:	83 c0 04             	add    $0x4,%eax
c01061ab:	8b 48 fc             	mov    -0x4(%eax),%ecx
c01061ae:	83 c2 04             	add    $0x4,%edx
c01061b1:	39 c3                	cmp    %eax,%ebx
c01061b3:	89 4a fc             	mov    %ecx,-0x4(%edx)
c01061b6:	77 f0                	ja     c01061a8 <__lshift+0x108>
c01061b8:	eb b2                	jmp    c010616c <__lshift+0xcc>
c01061ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

c01061c0 <__mcmp>:
c01061c0:	55                   	push   %ebp
c01061c1:	89 e5                	mov    %esp,%ebp
c01061c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01061c6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01061c9:	53                   	push   %ebx
c01061ca:	8b 41 10             	mov    0x10(%ecx),%eax
c01061cd:	8b 5a 10             	mov    0x10(%edx),%ebx
c01061d0:	29 d8                	sub    %ebx,%eax
c01061d2:	85 c0                	test   %eax,%eax
c01061d4:	75 27                	jne    c01061fd <__mcmp+0x3d>
c01061d6:	c1 e3 02             	shl    $0x2,%ebx
c01061d9:	83 c1 14             	add    $0x14,%ecx
c01061dc:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
c01061df:	8d 54 1a 14          	lea    0x14(%edx,%ebx,1),%edx
c01061e3:	eb 07                	jmp    c01061ec <__mcmp+0x2c>
c01061e5:	8d 76 00             	lea    0x0(%esi),%esi
c01061e8:	39 c1                	cmp    %eax,%ecx
c01061ea:	73 14                	jae    c0106200 <__mcmp+0x40>
c01061ec:	83 ea 04             	sub    $0x4,%edx
c01061ef:	83 e8 04             	sub    $0x4,%eax
c01061f2:	8b 1a                	mov    (%edx),%ebx
c01061f4:	39 18                	cmp    %ebx,(%eax)
c01061f6:	74 f0                	je     c01061e8 <__mcmp+0x28>
c01061f8:	19 c0                	sbb    %eax,%eax
c01061fa:	83 c8 01             	or     $0x1,%eax
c01061fd:	5b                   	pop    %ebx
c01061fe:	5d                   	pop    %ebp
c01061ff:	c3                   	ret    
c0106200:	31 c0                	xor    %eax,%eax
c0106202:	5b                   	pop    %ebx
c0106203:	5d                   	pop    %ebp
c0106204:	c3                   	ret    
c0106205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106210 <__mdiff>:
c0106210:	55                   	push   %ebp
c0106211:	89 e5                	mov    %esp,%ebp
c0106213:	57                   	push   %edi
c0106214:	56                   	push   %esi
c0106215:	53                   	push   %ebx
c0106216:	83 ec 2c             	sub    $0x2c,%esp
c0106219:	8b 75 0c             	mov    0xc(%ebp),%esi
c010621c:	8b 5d 10             	mov    0x10(%ebp),%ebx
c010621f:	89 34 24             	mov    %esi,(%esp)
c0106222:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0106226:	e8 95 ff ff ff       	call   c01061c0 <__mcmp>
c010622b:	85 c0                	test   %eax,%eax
c010622d:	0f 84 25 01 00 00    	je     c0106358 <__mdiff+0x148>
c0106233:	0f 88 0f 01 00 00    	js     c0106348 <__mdiff+0x138>
c0106239:	31 ff                	xor    %edi,%edi
c010623b:	8b 46 04             	mov    0x4(%esi),%eax
c010623e:	83 c6 14             	add    $0x14,%esi
c0106241:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106245:	8b 45 08             	mov    0x8(%ebp),%eax
c0106248:	89 04 24             	mov    %eax,(%esp)
c010624b:	e8 b0 f7 ff ff       	call   c0105a00 <_Balloc>
c0106250:	8d 4b 14             	lea    0x14(%ebx),%ecx
c0106253:	89 c2                	mov    %eax,%edx
c0106255:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106258:	89 78 0c             	mov    %edi,0xc(%eax)
c010625b:	8b 46 fc             	mov    -0x4(%esi),%eax
c010625e:	89 75 e4             	mov    %esi,-0x1c(%ebp)
c0106261:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106264:	8d 04 86             	lea    (%esi,%eax,4),%eax
c0106267:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010626a:	8b 43 10             	mov    0x10(%ebx),%eax
c010626d:	31 db                	xor    %ebx,%ebx
c010626f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
c0106272:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106275:	89 d0                	mov    %edx,%eax
c0106277:	83 c0 14             	add    $0x14,%eax
c010627a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106280:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0106283:	83 c0 04             	add    $0x4,%eax
c0106286:	83 c1 04             	add    $0x4,%ecx
c0106289:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
c010628d:	8b 3e                	mov    (%esi),%edi
c010628f:	8b 71 fc             	mov    -0x4(%ecx),%esi
c0106292:	0f b7 d7             	movzwl %di,%edx
c0106295:	01 da                	add    %ebx,%edx
c0106297:	0f b7 de             	movzwl %si,%ebx
c010629a:	29 da                	sub    %ebx,%edx
c010629c:	c1 ef 10             	shr    $0x10,%edi
c010629f:	89 d3                	mov    %edx,%ebx
c01062a1:	c1 ee 10             	shr    $0x10,%esi
c01062a4:	0f b7 d2             	movzwl %dx,%edx
c01062a7:	c1 fb 10             	sar    $0x10,%ebx
c01062aa:	29 f7                	sub    %esi,%edi
c01062ac:	01 df                	add    %ebx,%edi
c01062ae:	89 fb                	mov    %edi,%ebx
c01062b0:	c1 e7 10             	shl    $0x10,%edi
c01062b3:	09 d7                	or     %edx,%edi
c01062b5:	c1 fb 10             	sar    $0x10,%ebx
c01062b8:	39 4d e0             	cmp    %ecx,-0x20(%ebp)
c01062bb:	89 78 fc             	mov    %edi,-0x4(%eax)
c01062be:	77 c0                	ja     c0106280 <__mdiff+0x70>
c01062c0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c01062c3:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c01062c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01062c9:	89 75 e0             	mov    %esi,-0x20(%ebp)
c01062cc:	39 f1                	cmp    %esi,%ecx
c01062ce:	76 3f                	jbe    c010630f <__mdiff+0xff>
c01062d0:	8b 3e                	mov    (%esi),%edi
c01062d2:	83 c6 04             	add    $0x4,%esi
c01062d5:	83 c0 04             	add    $0x4,%eax
c01062d8:	0f b7 d7             	movzwl %di,%edx
c01062db:	01 da                	add    %ebx,%edx
c01062dd:	89 d3                	mov    %edx,%ebx
c01062df:	0f b7 d2             	movzwl %dx,%edx
c01062e2:	c1 fb 10             	sar    $0x10,%ebx
c01062e5:	c1 ef 10             	shr    $0x10,%edi
c01062e8:	01 df                	add    %ebx,%edi
c01062ea:	89 fb                	mov    %edi,%ebx
c01062ec:	c1 e7 10             	shl    $0x10,%edi
c01062ef:	09 d7                	or     %edx,%edi
c01062f1:	c1 fb 10             	sar    $0x10,%ebx
c01062f4:	39 f1                	cmp    %esi,%ecx
c01062f6:	89 78 fc             	mov    %edi,-0x4(%eax)
c01062f9:	77 d5                	ja     c01062d0 <__mdiff+0xc0>
c01062fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01062fe:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0106301:	f7 d0                	not    %eax
c0106303:	01 c8                	add    %ecx,%eax
c0106305:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0106308:	c1 e8 02             	shr    $0x2,%eax
c010630b:	8d 44 81 04          	lea    0x4(%ecx,%eax,4),%eax
c010630f:	85 ff                	test   %edi,%edi
c0106311:	75 23                	jne    c0106336 <__mdiff+0x126>
c0106313:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0106316:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
c010631d:	29 d0                	sub    %edx,%eax
c010631f:	89 ca                	mov    %ecx,%edx
c0106321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106328:	83 ea 01             	sub    $0x1,%edx
c010632b:	8b 4c 90 fc          	mov    -0x4(%eax,%edx,4),%ecx
c010632f:	85 c9                	test   %ecx,%ecx
c0106331:	74 f5                	je     c0106328 <__mdiff+0x118>
c0106333:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0106336:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106339:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c010633c:	89 48 10             	mov    %ecx,0x10(%eax)
c010633f:	83 c4 2c             	add    $0x2c,%esp
c0106342:	5b                   	pop    %ebx
c0106343:	5e                   	pop    %esi
c0106344:	5f                   	pop    %edi
c0106345:	5d                   	pop    %ebp
c0106346:	c3                   	ret    
c0106347:	90                   	nop
c0106348:	89 f0                	mov    %esi,%eax
c010634a:	bf 01 00 00 00       	mov    $0x1,%edi
c010634f:	89 de                	mov    %ebx,%esi
c0106351:	89 c3                	mov    %eax,%ebx
c0106353:	e9 e3 fe ff ff       	jmp    c010623b <__mdiff+0x2b>
c0106358:	8b 45 08             	mov    0x8(%ebp),%eax
c010635b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106362:	00 
c0106363:	89 04 24             	mov    %eax,(%esp)
c0106366:	e8 95 f6 ff ff       	call   c0105a00 <_Balloc>
c010636b:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0106372:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c0106379:	83 c4 2c             	add    $0x2c,%esp
c010637c:	5b                   	pop    %ebx
c010637d:	5e                   	pop    %esi
c010637e:	5f                   	pop    %edi
c010637f:	5d                   	pop    %ebp
c0106380:	c3                   	ret    
c0106381:	eb 0d                	jmp    c0106390 <__ulp>
c0106383:	90                   	nop
c0106384:	90                   	nop
c0106385:	90                   	nop
c0106386:	90                   	nop
c0106387:	90                   	nop
c0106388:	90                   	nop
c0106389:	90                   	nop
c010638a:	90                   	nop
c010638b:	90                   	nop
c010638c:	90                   	nop
c010638d:	90                   	nop
c010638e:	90                   	nop
c010638f:	90                   	nop

c0106390 <__ulp>:
c0106390:	55                   	push   %ebp
c0106391:	89 e5                	mov    %esp,%ebp
c0106393:	83 ec 08             	sub    $0x8,%esp
c0106396:	dd 45 08             	fldl   0x8(%ebp)
c0106399:	dd 5d f8             	fstpl  -0x8(%ebp)
c010639c:	8b 4d fc             	mov    -0x4(%ebp),%ecx
c010639f:	81 e1 00 00 f0 7f    	and    $0x7ff00000,%ecx
c01063a5:	81 e9 00 00 40 03    	sub    $0x3400000,%ecx
c01063ab:	85 c9                	test   %ecx,%ecx
c01063ad:	7e 11                	jle    c01063c0 <__ulp+0x30>
c01063af:	89 4d fc             	mov    %ecx,-0x4(%ebp)
c01063b2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01063b9:	dd 45 f8             	fldl   -0x8(%ebp)
c01063bc:	c9                   	leave  
c01063bd:	c3                   	ret    
c01063be:	66 90                	xchg   %ax,%ax
c01063c0:	f7 d9                	neg    %ecx
c01063c2:	c1 f9 14             	sar    $0x14,%ecx
c01063c5:	83 f9 13             	cmp    $0x13,%ecx
c01063c8:	7e 26                	jle    c01063f0 <__ulp+0x60>
c01063ca:	83 f9 32             	cmp    $0x32,%ecx
c01063cd:	b8 01 00 00 00       	mov    $0x1,%eax
c01063d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01063d9:	7f 0b                	jg     c01063e6 <__ulp+0x56>
c01063db:	ba 33 00 00 00       	mov    $0x33,%edx
c01063e0:	29 ca                	sub    %ecx,%edx
c01063e2:	89 d1                	mov    %edx,%ecx
c01063e4:	d3 e0                	shl    %cl,%eax
c01063e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01063e9:	dd 45 f8             	fldl   -0x8(%ebp)
c01063ec:	c9                   	leave  
c01063ed:	c3                   	ret    
c01063ee:	66 90                	xchg   %ax,%ax
c01063f0:	b8 00 00 08 00       	mov    $0x80000,%eax
c01063f5:	d3 f8                	sar    %cl,%eax
c01063f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01063fa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0106401:	dd 45 f8             	fldl   -0x8(%ebp)
c0106404:	c9                   	leave  
c0106405:	c3                   	ret    
c0106406:	8d 76 00             	lea    0x0(%esi),%esi
c0106409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106410 <__b2d>:
c0106410:	55                   	push   %ebp
c0106411:	89 e5                	mov    %esp,%ebp
c0106413:	57                   	push   %edi
c0106414:	56                   	push   %esi
c0106415:	53                   	push   %ebx
c0106416:	83 ec 18             	sub    $0x18,%esp
c0106419:	8b 45 08             	mov    0x8(%ebp),%eax
c010641c:	8d 78 14             	lea    0x14(%eax),%edi
c010641f:	8b 40 10             	mov    0x10(%eax),%eax
c0106422:	8d 1c 87             	lea    (%edi,%eax,4),%ebx
c0106425:	8b 73 fc             	mov    -0x4(%ebx),%esi
c0106428:	8d 43 fc             	lea    -0x4(%ebx),%eax
c010642b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010642e:	89 34 24             	mov    %esi,(%esp)
c0106431:	e8 6a f8 ff ff       	call   c0105ca0 <__hi0bits>
c0106436:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c0106439:	ba 20 00 00 00       	mov    $0x20,%edx
c010643e:	29 c2                	sub    %eax,%edx
c0106440:	83 f8 0a             	cmp    $0xa,%eax
c0106443:	89 11                	mov    %edx,(%ecx)
c0106445:	7f 41                	jg     c0106488 <__b2d+0x78>
c0106447:	b9 0b 00 00 00       	mov    $0xb,%ecx
c010644c:	89 f2                	mov    %esi,%edx
c010644e:	29 c1                	sub    %eax,%ecx
c0106450:	d3 ea                	shr    %cl,%edx
c0106452:	81 ca 00 00 f0 3f    	or     $0x3ff00000,%edx
c0106458:	89 55 ec             	mov    %edx,-0x14(%ebp)
c010645b:	31 d2                	xor    %edx,%edx
c010645d:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c0106460:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106467:	73 05                	jae    c010646e <__b2d+0x5e>
c0106469:	8b 53 f8             	mov    -0x8(%ebx),%edx
c010646c:	d3 ea                	shr    %cl,%edx
c010646e:	8d 48 15             	lea    0x15(%eax),%ecx
c0106471:	d3 e6                	shl    %cl,%esi
c0106473:	09 f2                	or     %esi,%edx
c0106475:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0106478:	dd 45 e8             	fldl   -0x18(%ebp)
c010647b:	83 c4 18             	add    $0x18,%esp
c010647e:	5b                   	pop    %ebx
c010647f:	5e                   	pop    %esi
c0106480:	5f                   	pop    %edi
c0106481:	5d                   	pop    %ebp
c0106482:	c3                   	ret    
c0106483:	90                   	nop
c0106484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106488:	31 d2                	xor    %edx,%edx
c010648a:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
c010648d:	73 09                	jae    c0106498 <__b2d+0x88>
c010648f:	8b 53 f8             	mov    -0x8(%ebx),%edx
c0106492:	8d 4b f8             	lea    -0x8(%ebx),%ecx
c0106495:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0106498:	89 c3                	mov    %eax,%ebx
c010649a:	83 eb 0b             	sub    $0xb,%ebx
c010649d:	89 5d e0             	mov    %ebx,-0x20(%ebp)
c01064a0:	74 4e                	je     c01064f0 <__b2d+0xe0>
c01064a2:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c01064a6:	bb 2b 00 00 00       	mov    $0x2b,%ebx
c01064ab:	29 c3                	sub    %eax,%ebx
c01064ad:	89 d0                	mov    %edx,%eax
c01064af:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01064b6:	d3 e6                	shl    %cl,%esi
c01064b8:	89 d9                	mov    %ebx,%ecx
c01064ba:	d3 e8                	shr    %cl,%eax
c01064bc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01064bf:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c01064c5:	09 c6                	or     %eax,%esi
c01064c7:	31 c0                	xor    %eax,%eax
c01064c9:	89 75 ec             	mov    %esi,-0x14(%ebp)
c01064cc:	39 f9                	cmp    %edi,%ecx
c01064ce:	76 07                	jbe    c01064d7 <__b2d+0xc7>
c01064d0:	8b 41 fc             	mov    -0x4(%ecx),%eax
c01064d3:	89 d9                	mov    %ebx,%ecx
c01064d5:	d3 e8                	shr    %cl,%eax
c01064d7:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
c01064db:	d3 e2                	shl    %cl,%edx
c01064dd:	09 d0                	or     %edx,%eax
c01064df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01064e2:	dd 45 e8             	fldl   -0x18(%ebp)
c01064e5:	83 c4 18             	add    $0x18,%esp
c01064e8:	5b                   	pop    %ebx
c01064e9:	5e                   	pop    %esi
c01064ea:	5f                   	pop    %edi
c01064eb:	5d                   	pop    %ebp
c01064ec:	c3                   	ret    
c01064ed:	8d 76 00             	lea    0x0(%esi),%esi
c01064f0:	81 ce 00 00 f0 3f    	or     $0x3ff00000,%esi
c01064f6:	89 75 ec             	mov    %esi,-0x14(%ebp)
c01064f9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01064fc:	dd 45 e8             	fldl   -0x18(%ebp)
c01064ff:	83 c4 18             	add    $0x18,%esp
c0106502:	5b                   	pop    %ebx
c0106503:	5e                   	pop    %esi
c0106504:	5f                   	pop    %edi
c0106505:	5d                   	pop    %ebp
c0106506:	c3                   	ret    
c0106507:	89 f6                	mov    %esi,%esi
c0106509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106510 <__d2b>:
c0106510:	55                   	push   %ebp
c0106511:	89 e5                	mov    %esp,%ebp
c0106513:	57                   	push   %edi
c0106514:	56                   	push   %esi
c0106515:	53                   	push   %ebx
c0106516:	83 ec 2c             	sub    $0x2c,%esp
c0106519:	8b 45 08             	mov    0x8(%ebp),%eax
c010651c:	dd 45 0c             	fldl   0xc(%ebp)
c010651f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106526:	00 
c0106527:	dd 5d d0             	fstpl  -0x30(%ebp)
c010652a:	89 04 24             	mov    %eax,(%esp)
c010652d:	e8 ce f4 ff ff       	call   c0105a00 <_Balloc>
c0106532:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0106535:	89 c6                	mov    %eax,%esi
c0106537:	89 d8                	mov    %ebx,%eax
c0106539:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
c010653f:	25 ff ff 0f 00       	and    $0xfffff,%eax
c0106544:	c1 eb 14             	shr    $0x14,%ebx
c0106547:	85 db                	test   %ebx,%ebx
c0106549:	74 05                	je     c0106550 <__d2b+0x40>
c010654b:	0d 00 00 10 00       	or     $0x100000,%eax
c0106550:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106553:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106556:	85 c0                	test   %eax,%eax
c0106558:	74 56                	je     c01065b0 <__d2b+0xa0>
c010655a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010655d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0106560:	89 04 24             	mov    %eax,(%esp)
c0106563:	e8 98 f7 ff ff       	call   c0105d00 <__lo0bits>
c0106568:	85 c0                	test   %eax,%eax
c010656a:	0f 85 90 00 00 00    	jne    c0106600 <__d2b+0xf0>
c0106570:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106573:	89 56 14             	mov    %edx,0x14(%esi)
c0106576:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106579:	83 fa 01             	cmp    $0x1,%edx
c010657c:	19 ff                	sbb    %edi,%edi
c010657e:	83 c7 02             	add    $0x2,%edi
c0106581:	85 db                	test   %ebx,%ebx
c0106583:	89 56 18             	mov    %edx,0x18(%esi)
c0106586:	89 7e 10             	mov    %edi,0x10(%esi)
c0106589:	74 49                	je     c01065d4 <__d2b+0xc4>
c010658b:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010658e:	8d 94 18 cd fb ff ff 	lea    -0x433(%eax,%ebx,1),%edx
c0106595:	89 11                	mov    %edx,(%ecx)
c0106597:	ba 35 00 00 00       	mov    $0x35,%edx
c010659c:	29 c2                	sub    %eax,%edx
c010659e:	8b 45 18             	mov    0x18(%ebp),%eax
c01065a1:	89 10                	mov    %edx,(%eax)
c01065a3:	83 c4 2c             	add    $0x2c,%esp
c01065a6:	89 f0                	mov    %esi,%eax
c01065a8:	5b                   	pop    %ebx
c01065a9:	5e                   	pop    %esi
c01065aa:	5f                   	pop    %edi
c01065ab:	5d                   	pop    %ebp
c01065ac:	c3                   	ret    
c01065ad:	8d 76 00             	lea    0x0(%esi),%esi
c01065b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01065b3:	bf 01 00 00 00       	mov    $0x1,%edi
c01065b8:	89 04 24             	mov    %eax,(%esp)
c01065bb:	e8 40 f7 ff ff       	call   c0105d00 <__lo0bits>
c01065c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01065c3:	c7 46 10 01 00 00 00 	movl   $0x1,0x10(%esi)
c01065ca:	89 56 14             	mov    %edx,0x14(%esi)
c01065cd:	83 c0 20             	add    $0x20,%eax
c01065d0:	85 db                	test   %ebx,%ebx
c01065d2:	75 b7                	jne    c010658b <__d2b+0x7b>
c01065d4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01065d7:	2d 32 04 00 00       	sub    $0x432,%eax
c01065dc:	89 01                	mov    %eax,(%ecx)
c01065de:	8b 44 be 10          	mov    0x10(%esi,%edi,4),%eax
c01065e2:	c1 e7 05             	shl    $0x5,%edi
c01065e5:	89 04 24             	mov    %eax,(%esp)
c01065e8:	e8 b3 f6 ff ff       	call   c0105ca0 <__hi0bits>
c01065ed:	29 c7                	sub    %eax,%edi
c01065ef:	8b 45 18             	mov    0x18(%ebp),%eax
c01065f2:	89 38                	mov    %edi,(%eax)
c01065f4:	83 c4 2c             	add    $0x2c,%esp
c01065f7:	89 f0                	mov    %esi,%eax
c01065f9:	5b                   	pop    %ebx
c01065fa:	5e                   	pop    %esi
c01065fb:	5f                   	pop    %edi
c01065fc:	5d                   	pop    %ebp
c01065fd:	c3                   	ret    
c01065fe:	66 90                	xchg   %ax,%ax
c0106600:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106603:	b9 20 00 00 00       	mov    $0x20,%ecx
c0106608:	29 c1                	sub    %eax,%ecx
c010660a:	89 d7                	mov    %edx,%edi
c010660c:	d3 e7                	shl    %cl,%edi
c010660e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0106611:	09 f9                	or     %edi,%ecx
c0106613:	89 4e 14             	mov    %ecx,0x14(%esi)
c0106616:	89 c1                	mov    %eax,%ecx
c0106618:	d3 ea                	shr    %cl,%edx
c010661a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c010661d:	e9 57 ff ff ff       	jmp    c0106579 <__d2b+0x69>
c0106622:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106630 <__ratio>:
c0106630:	55                   	push   %ebp
c0106631:	89 e5                	mov    %esp,%ebp
c0106633:	56                   	push   %esi
c0106634:	53                   	push   %ebx
c0106635:	83 ec 30             	sub    $0x30,%esp
c0106638:	8b 75 08             	mov    0x8(%ebp),%esi
c010663b:	8d 45 f0             	lea    -0x10(%ebp),%eax
c010663e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0106641:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106645:	89 34 24             	mov    %esi,(%esp)
c0106648:	e8 c3 fd ff ff       	call   c0106410 <__b2d>
c010664d:	8d 45 f4             	lea    -0xc(%ebp),%eax
c0106650:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106654:	89 1c 24             	mov    %ebx,(%esp)
c0106657:	dd 55 e0             	fstl   -0x20(%ebp)
c010665a:	dd 5d d8             	fstpl  -0x28(%ebp)
c010665d:	e8 ae fd ff ff       	call   c0106410 <__b2d>
c0106662:	8b 46 10             	mov    0x10(%esi),%eax
c0106665:	2b 43 10             	sub    0x10(%ebx),%eax
c0106668:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010666b:	2b 55 f4             	sub    -0xc(%ebp),%edx
c010666e:	c1 e0 05             	shl    $0x5,%eax
c0106671:	01 d0                	add    %edx,%eax
c0106673:	dd 55 d0             	fstl   -0x30(%ebp)
c0106676:	85 c0                	test   %eax,%eax
c0106678:	dd 45 d8             	fldl   -0x28(%ebp)
c010667b:	7e 1b                	jle    c0106698 <__ratio+0x68>
c010667d:	dd d8                	fstp   %st(0)
c010667f:	c1 e0 14             	shl    $0x14,%eax
c0106682:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0106685:	dd 45 e0             	fldl   -0x20(%ebp)
c0106688:	83 c4 30             	add    $0x30,%esp
c010668b:	5b                   	pop    %ebx
c010668c:	de f1                	fdivp  %st,%st(1)
c010668e:	5e                   	pop    %esi
c010668f:	5d                   	pop    %ebp
c0106690:	c3                   	ret    
c0106691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106698:	dd d9                	fstp   %st(1)
c010669a:	c1 e0 14             	shl    $0x14,%eax
c010669d:	29 45 d4             	sub    %eax,-0x2c(%ebp)
c01066a0:	dd 45 d0             	fldl   -0x30(%ebp)
c01066a3:	83 c4 30             	add    $0x30,%esp
c01066a6:	5b                   	pop    %ebx
c01066a7:	de f9                	fdivrp %st,%st(1)
c01066a9:	5e                   	pop    %esi
c01066aa:	5d                   	pop    %ebp
c01066ab:	c3                   	ret    
c01066ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

c01066b0 <_mprec_log10>:
c01066b0:	55                   	push   %ebp
c01066b1:	89 e5                	mov    %esp,%ebp
c01066b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01066b6:	83 f8 17             	cmp    $0x17,%eax
c01066b9:	7e 1d                	jle    c01066d8 <_mprec_log10+0x28>
c01066bb:	d9 e8                	fld1   
c01066bd:	d9 05 d0 8f 10 c0    	flds   0xc0108fd0
c01066c3:	90                   	nop
c01066c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01066c8:	83 e8 01             	sub    $0x1,%eax
c01066cb:	dc c9                	fmul   %st,%st(1)
c01066cd:	75 f9                	jne    c01066c8 <_mprec_log10+0x18>
c01066cf:	dd d8                	fstp   %st(0)
c01066d1:	5d                   	pop    %ebp
c01066d2:	c3                   	ret    
c01066d3:	90                   	nop
c01066d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01066d8:	dd 04 c5 a0 90 10 c0 	fldl   -0x3fef6f60(,%eax,8)
c01066df:	5d                   	pop    %ebp
c01066e0:	c3                   	ret    
c01066e1:	eb 0d                	jmp    c01066f0 <__copybits>
c01066e3:	90                   	nop
c01066e4:	90                   	nop
c01066e5:	90                   	nop
c01066e6:	90                   	nop
c01066e7:	90                   	nop
c01066e8:	90                   	nop
c01066e9:	90                   	nop
c01066ea:	90                   	nop
c01066eb:	90                   	nop
c01066ec:	90                   	nop
c01066ed:	90                   	nop
c01066ee:	90                   	nop
c01066ef:	90                   	nop

c01066f0 <__copybits>:
c01066f0:	55                   	push   %ebp
c01066f1:	89 e5                	mov    %esp,%ebp
c01066f3:	57                   	push   %edi
c01066f4:	8b 7d 10             	mov    0x10(%ebp),%edi
c01066f7:	56                   	push   %esi
c01066f8:	8b 75 0c             	mov    0xc(%ebp),%esi
c01066fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01066fe:	53                   	push   %ebx
c01066ff:	8b 4f 10             	mov    0x10(%edi),%ecx
c0106702:	8d 56 ff             	lea    -0x1(%esi),%edx
c0106705:	c1 fa 05             	sar    $0x5,%edx
c0106708:	8d 74 90 04          	lea    0x4(%eax,%edx,4),%esi
c010670c:	8d 57 14             	lea    0x14(%edi),%edx
c010670f:	8d 1c 8a             	lea    (%edx,%ecx,4),%ebx
c0106712:	39 da                	cmp    %ebx,%edx
c0106714:	73 34                	jae    c010674a <__copybits+0x5a>
c0106716:	89 c1                	mov    %eax,%ecx
c0106718:	83 c2 04             	add    $0x4,%edx
c010671b:	8b 42 fc             	mov    -0x4(%edx),%eax
c010671e:	83 c1 04             	add    $0x4,%ecx
c0106721:	39 d3                	cmp    %edx,%ebx
c0106723:	89 41 fc             	mov    %eax,-0x4(%ecx)
c0106726:	77 f0                	ja     c0106718 <__copybits+0x28>
c0106728:	8b 45 08             	mov    0x8(%ebp),%eax
c010672b:	29 fb                	sub    %edi,%ebx
c010672d:	8d 53 eb             	lea    -0x15(%ebx),%edx
c0106730:	c1 ea 02             	shr    $0x2,%edx
c0106733:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
c0106737:	39 c6                	cmp    %eax,%esi
c0106739:	76 13                	jbe    c010674e <__copybits+0x5e>
c010673b:	90                   	nop
c010673c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106740:	83 c0 04             	add    $0x4,%eax
c0106743:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
c010674a:	39 c6                	cmp    %eax,%esi
c010674c:	77 f2                	ja     c0106740 <__copybits+0x50>
c010674e:	5b                   	pop    %ebx
c010674f:	5e                   	pop    %esi
c0106750:	5f                   	pop    %edi
c0106751:	5d                   	pop    %ebp
c0106752:	c3                   	ret    
c0106753:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0106760 <__any_on>:
c0106760:	55                   	push   %ebp
c0106761:	89 e5                	mov    %esp,%ebp
c0106763:	8b 45 08             	mov    0x8(%ebp),%eax
c0106766:	57                   	push   %edi
c0106767:	56                   	push   %esi
c0106768:	53                   	push   %ebx
c0106769:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010676c:	8d 50 14             	lea    0x14(%eax),%edx
c010676f:	8b 40 10             	mov    0x10(%eax),%eax
c0106772:	c1 fb 05             	sar    $0x5,%ebx
c0106775:	39 d8                	cmp    %ebx,%eax
c0106777:	7d 2f                	jge    c01067a8 <__any_on+0x48>
c0106779:	8d 1c 82             	lea    (%edx,%eax,4),%ebx
c010677c:	39 da                	cmp    %ebx,%edx
c010677e:	73 1d                	jae    c010679d <__any_on+0x3d>
c0106780:	8d 43 fc             	lea    -0x4(%ebx),%eax
c0106783:	8b 5b fc             	mov    -0x4(%ebx),%ebx
c0106786:	85 db                	test   %ebx,%ebx
c0106788:	74 0f                	je     c0106799 <__any_on+0x39>
c010678a:	eb 44                	jmp    c01067d0 <__any_on+0x70>
c010678c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106790:	83 e8 04             	sub    $0x4,%eax
c0106793:	8b 08                	mov    (%eax),%ecx
c0106795:	85 c9                	test   %ecx,%ecx
c0106797:	75 37                	jne    c01067d0 <__any_on+0x70>
c0106799:	39 c2                	cmp    %eax,%edx
c010679b:	72 f3                	jb     c0106790 <__any_on+0x30>
c010679d:	31 c0                	xor    %eax,%eax
c010679f:	5b                   	pop    %ebx
c01067a0:	5e                   	pop    %esi
c01067a1:	5f                   	pop    %edi
c01067a2:	5d                   	pop    %ebp
c01067a3:	c3                   	ret    
c01067a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01067a8:	7e 1e                	jle    c01067c8 <__any_on+0x68>
c01067aa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c01067ad:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c01067b0:	83 e1 1f             	and    $0x1f,%ecx
c01067b3:	74 c7                	je     c010677c <__any_on+0x1c>
c01067b5:	8b 3b                	mov    (%ebx),%edi
c01067b7:	b8 01 00 00 00       	mov    $0x1,%eax
c01067bc:	89 fe                	mov    %edi,%esi
c01067be:	d3 ee                	shr    %cl,%esi
c01067c0:	d3 e6                	shl    %cl,%esi
c01067c2:	39 fe                	cmp    %edi,%esi
c01067c4:	75 d9                	jne    c010679f <__any_on+0x3f>
c01067c6:	eb b4                	jmp    c010677c <__any_on+0x1c>
c01067c8:	8d 1c 9a             	lea    (%edx,%ebx,4),%ebx
c01067cb:	eb af                	jmp    c010677c <__any_on+0x1c>
c01067cd:	8d 76 00             	lea    0x0(%esi),%esi
c01067d0:	5b                   	pop    %ebx
c01067d1:	b8 01 00 00 00       	mov    $0x1,%eax
c01067d6:	5e                   	pop    %esi
c01067d7:	5f                   	pop    %edi
c01067d8:	5d                   	pop    %ebp
c01067d9:	c3                   	ret    
c01067da:	66 90                	xchg   %ax,%ax
c01067dc:	66 90                	xchg   %ax,%ax
c01067de:	66 90                	xchg   %ax,%ax

c01067e0 <_sbrk_r>:
c01067e0:	55                   	push   %ebp
c01067e1:	89 e5                	mov    %esp,%ebp
c01067e3:	83 ec 18             	sub    $0x18,%esp
c01067e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01067e9:	c7 05 94 35 16 c0 00 	movl   $0x0,0xc0163594
c01067f0:	00 00 00 
c01067f3:	89 04 24             	mov    %eax,(%esp)
c01067f6:	e8 b5 ae ff ff       	call   c01016b0 <sbrk>
c01067fb:	83 f8 ff             	cmp    $0xffffffff,%eax
c01067fe:	74 08                	je     c0106808 <_sbrk_r+0x28>
c0106800:	c9                   	leave  
c0106801:	c3                   	ret    
c0106802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106808:	8b 15 94 35 16 c0    	mov    0xc0163594,%edx
c010680e:	85 d2                	test   %edx,%edx
c0106810:	74 ee                	je     c0106800 <_sbrk_r+0x20>
c0106812:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0106815:	89 11                	mov    %edx,(%ecx)
c0106817:	c9                   	leave  
c0106818:	c3                   	ret    
c0106819:	66 90                	xchg   %ax,%ax
c010681b:	66 90                	xchg   %ax,%ax
c010681d:	66 90                	xchg   %ax,%ax
c010681f:	90                   	nop

c0106820 <__fpclassifyd>:
c0106820:	55                   	push   %ebp
c0106821:	b8 02 00 00 00       	mov    $0x2,%eax
c0106826:	89 e5                	mov    %esp,%ebp
c0106828:	53                   	push   %ebx
c0106829:	83 ec 0c             	sub    $0xc,%esp
c010682c:	dd 45 08             	fldl   0x8(%ebp)
c010682f:	dd 5d f0             	fstpl  -0x10(%ebp)
c0106832:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0106835:	8b 4d f4             	mov    -0xc(%ebp),%ecx
c0106838:	89 d3                	mov    %edx,%ebx
c010683a:	09 cb                	or     %ecx,%ebx
c010683c:	75 0a                	jne    c0106848 <__fpclassifyd+0x28>
c010683e:	83 c4 0c             	add    $0xc,%esp
c0106841:	5b                   	pop    %ebx
c0106842:	5d                   	pop    %ebp
c0106843:	c3                   	ret    
c0106844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106848:	85 d2                	test   %edx,%edx
c010684a:	0f 94 c2             	sete   %dl
c010684d:	75 08                	jne    c0106857 <__fpclassifyd+0x37>
c010684f:	81 f9 00 00 00 80    	cmp    $0x80000000,%ecx
c0106855:	74 e7                	je     c010683e <__fpclassifyd+0x1e>
c0106857:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
c010685d:	b8 04 00 00 00       	mov    $0x4,%eax
c0106862:	8d 99 00 00 f0 ff    	lea    -0x100000(%ecx),%ebx
c0106868:	81 fb ff ff df 7f    	cmp    $0x7fdfffff,%ebx
c010686e:	76 ce                	jbe    c010683e <__fpclassifyd+0x1e>
c0106870:	81 f9 ff ff 0f 00    	cmp    $0xfffff,%ecx
c0106876:	b0 03                	mov    $0x3,%al
c0106878:	76 c4                	jbe    c010683e <__fpclassifyd+0x1e>
c010687a:	31 c0                	xor    %eax,%eax
c010687c:	81 f9 00 00 f0 7f    	cmp    $0x7ff00000,%ecx
c0106882:	0f 94 c0             	sete   %al
c0106885:	21 d0                	and    %edx,%eax
c0106887:	eb b5                	jmp    c010683e <__fpclassifyd+0x1e>
c0106889:	66 90                	xchg   %ax,%ax
c010688b:	66 90                	xchg   %ax,%ax
c010688d:	66 90                	xchg   %ax,%ax
c010688f:	90                   	nop

c0106890 <strlen>:
c0106890:	55                   	push   %ebp
c0106891:	89 e5                	mov    %esp,%ebp
c0106893:	57                   	push   %edi
c0106894:	8b 55 08             	mov    0x8(%ebp),%edx
c0106897:	89 d7                	mov    %edx,%edi
c0106899:	f7 c7 03 00 00 00    	test   $0x3,%edi
c010689f:	74 25                	je     c01068c6 <L5>
c01068a1:	8a 0f                	mov    (%edi),%cl
c01068a3:	47                   	inc    %edi
c01068a4:	84 c9                	test   %cl,%cl
c01068a6:	74 56                	je     c01068fe <L15>
c01068a8:	f7 c7 03 00 00 00    	test   $0x3,%edi
c01068ae:	74 16                	je     c01068c6 <L5>
c01068b0:	8a 0f                	mov    (%edi),%cl
c01068b2:	47                   	inc    %edi
c01068b3:	84 c9                	test   %cl,%cl
c01068b5:	74 47                	je     c01068fe <L15>
c01068b7:	f7 c7 03 00 00 00    	test   $0x3,%edi
c01068bd:	74 07                	je     c01068c6 <L5>
c01068bf:	8a 0f                	mov    (%edi),%cl
c01068c1:	47                   	inc    %edi
c01068c2:	84 c9                	test   %cl,%cl
c01068c4:	74 38                	je     c01068fe <L15>

c01068c6 <L5>:
c01068c6:	83 ef 04             	sub    $0x4,%edi
c01068c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

c01068d0 <L10>:
c01068d0:	83 c7 04             	add    $0x4,%edi
c01068d3:	8b 0f                	mov    (%edi),%ecx
c01068d5:	8d 81 ff fe fe fe    	lea    -0x1010101(%ecx),%eax
c01068db:	f7 d1                	not    %ecx
c01068dd:	21 c8                	and    %ecx,%eax
c01068df:	a9 80 80 80 80       	test   $0x80808080,%eax
c01068e4:	74 ea                	je     c01068d0 <L10>
c01068e6:	f7 d1                	not    %ecx
c01068e8:	47                   	inc    %edi
c01068e9:	84 c9                	test   %cl,%cl
c01068eb:	74 11                	je     c01068fe <L15>
c01068ed:	47                   	inc    %edi
c01068ee:	c1 e9 08             	shr    $0x8,%ecx
c01068f1:	84 c9                	test   %cl,%cl
c01068f3:	74 09                	je     c01068fe <L15>
c01068f5:	47                   	inc    %edi
c01068f6:	c1 e9 08             	shr    $0x8,%ecx
c01068f9:	84 c9                	test   %cl,%cl
c01068fb:	74 01                	je     c01068fe <L15>
c01068fd:	47                   	inc    %edi

c01068fe <L15>:
c01068fe:	29 d7                	sub    %edx,%edi
c0106900:	8d 47 ff             	lea    -0x1(%edi),%eax
c0106903:	8d 65 fc             	lea    -0x4(%ebp),%esp
c0106906:	5f                   	pop    %edi
c0106907:	c9                   	leave  
c0106908:	c3                   	ret    
c0106909:	66 90                	xchg   %ax,%ax
c010690b:	66 90                	xchg   %ax,%ax
c010690d:	66 90                	xchg   %ax,%ax
c010690f:	90                   	nop

c0106910 <__ssprint_r>:
c0106910:	55                   	push   %ebp
c0106911:	89 e5                	mov    %esp,%ebp
c0106913:	57                   	push   %edi
c0106914:	56                   	push   %esi
c0106915:	53                   	push   %ebx
c0106916:	83 ec 2c             	sub    $0x2c,%esp
c0106919:	8b 45 10             	mov    0x10(%ebp),%eax
c010691c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010691f:	8b 00                	mov    (%eax),%eax
c0106921:	89 c7                	mov    %eax,%edi
c0106923:	8b 45 10             	mov    0x10(%ebp),%eax
c0106926:	8b 40 08             	mov    0x8(%eax),%eax
c0106929:	85 c0                	test   %eax,%eax
c010692b:	0f 84 af 01 00 00    	je     c0106ae0 <__ssprint_r+0x1d0>
c0106931:	31 c9                	xor    %ecx,%ecx
c0106933:	31 d2                	xor    %edx,%edx
c0106935:	8b 03                	mov    (%ebx),%eax
c0106937:	89 ce                	mov    %ecx,%esi
c0106939:	85 f6                	test   %esi,%esi
c010693b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c010693e:	0f 84 ec 00 00 00    	je     c0106a30 <__ssprint_r+0x120>
c0106944:	8b 53 08             	mov    0x8(%ebx),%edx
c0106947:	39 d6                	cmp    %edx,%esi
c0106949:	0f 82 fc 00 00 00    	jb     c0106a4b <__ssprint_r+0x13b>
c010694f:	0f b7 4b 0c          	movzwl 0xc(%ebx),%ecx
c0106953:	66 f7 c1 80 04       	test   $0x480,%cx
c0106958:	0f 84 fa 00 00 00    	je     c0106a58 <__ssprint_r+0x148>
c010695e:	8b 53 10             	mov    0x10(%ebx),%edx
c0106961:	29 d0                	sub    %edx,%eax
c0106963:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106966:	8b 43 14             	mov    0x14(%ebx),%eax
c0106969:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010696c:	8d 04 40             	lea    (%eax,%eax,2),%eax
c010696f:	89 c2                	mov    %eax,%edx
c0106971:	c1 ea 1f             	shr    $0x1f,%edx
c0106974:	01 d0                	add    %edx,%eax
c0106976:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106979:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010697c:	d1 7d e0             	sarl   -0x20(%ebp)
c010697f:	8d 44 06 01          	lea    0x1(%esi,%eax,1),%eax
c0106983:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0106986:	0f 83 34 01 00 00    	jae    c0106ac0 <__ssprint_r+0x1b0>
c010698c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010698f:	80 e5 04             	and    $0x4,%ch
c0106992:	0f 84 c8 00 00 00    	je     c0106a60 <__ssprint_r+0x150>
c0106998:	89 44 24 04          	mov    %eax,0x4(%esp)
c010699c:	8b 45 08             	mov    0x8(%ebp),%eax
c010699f:	89 04 24             	mov    %eax,(%esp)
c01069a2:	e8 59 e8 ff ff       	call   c0105200 <_malloc_r>
c01069a7:	85 c0                	test   %eax,%eax
c01069a9:	89 c2                	mov    %eax,%edx
c01069ab:	0f 84 e1 00 00 00    	je     c0106a92 <__ssprint_r+0x182>
c01069b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01069b4:	89 55 d8             	mov    %edx,-0x28(%ebp)
c01069b7:	89 44 24 08          	mov    %eax,0x8(%esp)
c01069bb:	8b 43 10             	mov    0x10(%ebx),%eax
c01069be:	89 14 24             	mov    %edx,(%esp)
c01069c1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01069c5:	e8 16 b2 ff ff       	call   c0101be0 <memcpy>
c01069ca:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
c01069ce:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01069d1:	66 25 7f fb          	and    $0xfb7f,%ax
c01069d5:	0c 80                	or     $0x80,%al
c01069d7:	66 89 43 0c          	mov    %ax,0xc(%ebx)
c01069db:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01069de:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01069e1:	89 53 10             	mov    %edx,0x10(%ebx)
c01069e4:	89 4b 14             	mov    %ecx,0x14(%ebx)
c01069e7:	2b 4d dc             	sub    -0x24(%ebp),%ecx
c01069ea:	01 d0                	add    %edx,%eax
c01069ec:	89 03                	mov    %eax,(%ebx)
c01069ee:	89 f2                	mov    %esi,%edx
c01069f0:	89 4b 08             	mov    %ecx,0x8(%ebx)
c01069f3:	89 f1                	mov    %esi,%ecx
c01069f5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01069f9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c01069fc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c01069ff:	89 04 24             	mov    %eax,(%esp)
c0106a02:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0106a05:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0106a09:	e8 22 13 00 00       	call   c0107d30 <memmove>
c0106a0e:	8b 03                	mov    (%ebx),%eax
c0106a10:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0106a13:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106a16:	29 53 08             	sub    %edx,0x8(%ebx)
c0106a19:	01 c8                	add    %ecx,%eax
c0106a1b:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0106a1e:	89 03                	mov    %eax,(%ebx)
c0106a20:	8b 51 08             	mov    0x8(%ecx),%edx
c0106a23:	29 f2                	sub    %esi,%edx
c0106a25:	85 d2                	test   %edx,%edx
c0106a27:	89 51 08             	mov    %edx,0x8(%ecx)
c0106a2a:	0f 84 98 00 00 00    	je     c0106ac8 <__ssprint_r+0x1b8>
c0106a30:	8b 77 04             	mov    0x4(%edi),%esi
c0106a33:	83 c7 08             	add    $0x8,%edi
c0106a36:	8b 4f f8             	mov    -0x8(%edi),%ecx
c0106a39:	85 f6                	test   %esi,%esi
c0106a3b:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
c0106a3e:	74 f0                	je     c0106a30 <__ssprint_r+0x120>
c0106a40:	8b 53 08             	mov    0x8(%ebx),%edx
c0106a43:	39 d6                	cmp    %edx,%esi
c0106a45:	0f 83 04 ff ff ff    	jae    c010694f <__ssprint_r+0x3f>
c0106a4b:	89 f2                	mov    %esi,%edx
c0106a4d:	89 f1                	mov    %esi,%ecx
c0106a4f:	eb a4                	jmp    c01069f5 <__ssprint_r+0xe5>
c0106a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106a58:	89 d1                	mov    %edx,%ecx
c0106a5a:	eb 99                	jmp    c01069f5 <__ssprint_r+0xe5>
c0106a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0106a60:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106a64:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a67:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106a6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a6e:	89 04 24             	mov    %eax,(%esp)
c0106a71:	e8 4a 13 00 00       	call   c0107dc0 <_realloc_r>
c0106a76:	85 c0                	test   %eax,%eax
c0106a78:	89 c2                	mov    %eax,%edx
c0106a7a:	0f 85 5b ff ff ff    	jne    c01069db <__ssprint_r+0xcb>
c0106a80:	8b 43 10             	mov    0x10(%ebx),%eax
c0106a83:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106a87:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a8a:	89 04 24             	mov    %eax,(%esp)
c0106a8d:	e8 3e 10 00 00       	call   c0107ad0 <_free_r>
c0106a92:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a95:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0106a9b:	8b 45 10             	mov    0x10(%ebp),%eax
c0106a9e:	66 83 4b 0c 40       	orw    $0x40,0xc(%ebx)
c0106aa3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0106aaa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106ab1:	83 c4 2c             	add    $0x2c,%esp
c0106ab4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0106ab9:	5b                   	pop    %ebx
c0106aba:	5e                   	pop    %esi
c0106abb:	5f                   	pop    %edi
c0106abc:	5d                   	pop    %ebp
c0106abd:	c3                   	ret    
c0106abe:	66 90                	xchg   %ax,%ax
c0106ac0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106ac3:	e9 c7 fe ff ff       	jmp    c010698f <__ssprint_r+0x7f>
c0106ac8:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
c0106acf:	83 c4 2c             	add    $0x2c,%esp
c0106ad2:	31 c0                	xor    %eax,%eax
c0106ad4:	5b                   	pop    %ebx
c0106ad5:	5e                   	pop    %esi
c0106ad6:	5f                   	pop    %edi
c0106ad7:	5d                   	pop    %ebp
c0106ad8:	c3                   	ret    
c0106ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106ae0:	8b 45 10             	mov    0x10(%ebp),%eax
c0106ae3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0106aea:	83 c4 2c             	add    $0x2c,%esp
c0106aed:	31 c0                	xor    %eax,%eax
c0106aef:	5b                   	pop    %ebx
c0106af0:	5e                   	pop    %esi
c0106af1:	5f                   	pop    %edi
c0106af2:	5d                   	pop    %ebp
c0106af3:	c3                   	ret    
c0106af4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106afa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

c0106b00 <_svfiprintf_r>:
c0106b00:	55                   	push   %ebp
c0106b01:	89 e5                	mov    %esp,%ebp
c0106b03:	57                   	push   %edi
c0106b04:	56                   	push   %esi
c0106b05:	53                   	push   %ebx
c0106b06:	81 ec cc 00 00 00    	sub    $0xcc,%esp
c0106b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106b0f:	f6 40 0c 80          	testb  $0x80,0xc(%eax)
c0106b13:	74 0b                	je     c0106b20 <_svfiprintf_r+0x20>
c0106b15:	8b 50 10             	mov    0x10(%eax),%edx
c0106b18:	85 d2                	test   %edx,%edx
c0106b1a:	0f 84 1c 0d 00 00    	je     c010783c <_svfiprintf_r+0xd3c>
c0106b20:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106b23:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c0106b26:	89 c6                	mov    %eax,%esi
c0106b28:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0106b2e:	29 d8                	sub    %ebx,%eax
c0106b30:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%ebp)
c0106b37:	00 00 00 
c0106b3a:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c0106b41:	00 00 00 
c0106b44:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%ebp)
c0106b4b:	00 00 00 
c0106b4e:	c7 85 50 ff ff ff 00 	movl   $0x0,-0xb0(%ebp)
c0106b55:	00 00 00 
c0106b58:	89 85 3c ff ff ff    	mov    %eax,-0xc4(%ebp)
c0106b5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0106b61:	8b 5d 10             	mov    0x10(%ebp),%ebx
c0106b64:	0f b6 00             	movzbl (%eax),%eax
c0106b67:	84 c0                	test   %al,%al
c0106b69:	74 58                	je     c0106bc3 <_svfiprintf_r+0xc3>
c0106b6b:	3c 25                	cmp    $0x25,%al
c0106b6d:	75 13                	jne    c0106b82 <_svfiprintf_r+0x82>
c0106b6f:	eb 52                	jmp    c0106bc3 <_svfiprintf_r+0xc3>
c0106b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106b78:	84 c0                	test   %al,%al
c0106b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106b80:	74 0a                	je     c0106b8c <_svfiprintf_r+0x8c>
c0106b82:	83 c3 01             	add    $0x1,%ebx
c0106b85:	0f b6 03             	movzbl (%ebx),%eax
c0106b88:	3c 25                	cmp    $0x25,%al
c0106b8a:	75 ec                	jne    c0106b78 <_svfiprintf_r+0x78>
c0106b8c:	89 df                	mov    %ebx,%edi
c0106b8e:	2b 7d 10             	sub    0x10(%ebp),%edi
c0106b91:	74 30                	je     c0106bc3 <_svfiprintf_r+0xc3>
c0106b93:	8b 45 10             	mov    0x10(%ebp),%eax
c0106b96:	83 c6 08             	add    $0x8,%esi
c0106b99:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106b9c:	01 bd 7c ff ff ff    	add    %edi,-0x84(%ebp)
c0106ba2:	89 46 f8             	mov    %eax,-0x8(%esi)
c0106ba5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106bab:	83 c0 01             	add    $0x1,%eax
c0106bae:	83 f8 07             	cmp    $0x7,%eax
c0106bb1:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106bb7:	0f 8f eb 0a 00 00    	jg     c01076a8 <_svfiprintf_r+0xba8>
c0106bbd:	01 bd 50 ff ff ff    	add    %edi,-0xb0(%ebp)
c0106bc3:	80 3b 00             	cmpb   $0x0,(%ebx)
c0106bc6:	0f 84 11 09 00 00    	je     c01074dd <_svfiprintf_r+0x9dd>
c0106bcc:	8d 43 01             	lea    0x1(%ebx),%eax
c0106bcf:	31 ff                	xor    %edi,%edi
c0106bd1:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106bd8:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c0106bdf:	ff ff ff 
c0106be2:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0106be9:	00 00 00 
c0106bec:	c7 85 64 ff ff ff 00 	movl   $0x0,-0x9c(%ebp)
c0106bf3:	00 00 00 
c0106bf6:	8d 50 01             	lea    0x1(%eax),%edx
c0106bf9:	0f be 00             	movsbl (%eax),%eax
c0106bfc:	8d 48 e0             	lea    -0x20(%eax),%ecx
c0106bff:	83 f9 58             	cmp    $0x58,%ecx
c0106c02:	0f 87 63 03 00 00    	ja     c0106f6b <_svfiprintf_r+0x46b>
c0106c08:	ff 24 8d 68 91 10 c0 	jmp    *-0x3fef6e98(,%ecx,4)
c0106c0f:	90                   	nop
c0106c10:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106c17:	89 d0                	mov    %edx,%eax
c0106c19:	eb db                	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0106c1b:	8b 45 14             	mov    0x14(%ebp),%eax
c0106c1e:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0106c21:	8b 00                	mov    (%eax),%eax
c0106c23:	83 c3 04             	add    $0x4,%ebx
c0106c26:	89 5d 14             	mov    %ebx,0x14(%ebp)
c0106c29:	85 c0                	test   %eax,%eax
c0106c2b:	89 85 54 ff ff ff    	mov    %eax,-0xac(%ebp)
c0106c31:	79 e4                	jns    c0106c17 <_svfiprintf_r+0x117>
c0106c33:	f7 9d 54 ff ff ff    	negl   -0xac(%ebp)
c0106c39:	83 8d 64 ff ff ff 04 	orl    $0x4,-0x9c(%ebp)
c0106c40:	89 d0                	mov    %edx,%eax
c0106c42:	eb b2                	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0106c44:	bf 2b 00 00 00       	mov    $0x2b,%edi
c0106c49:	89 d0                	mov    %edx,%eax
c0106c4b:	eb a9                	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0106c4d:	8b 45 14             	mov    0x14(%ebp),%eax
c0106c50:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c0106c57:	89 55 10             	mov    %edx,0x10(%ebp)
c0106c5a:	ba 02 00 00 00       	mov    $0x2,%edx
c0106c5f:	8b 08                	mov    (%eax),%ecx
c0106c61:	83 c0 04             	add    $0x4,%eax
c0106c64:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c0106c6b:	c6 85 73 ff ff ff 78 	movb   $0x78,-0x8d(%ebp)
c0106c72:	89 45 14             	mov    %eax,0x14(%ebp)
c0106c75:	c7 85 44 ff ff ff 1b 	movl   $0xc0108e1b,-0xbc(%ebp)
c0106c7c:	8e 10 c0 
c0106c7f:	90                   	nop
c0106c80:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106c87:	31 ff                	xor    %edi,%edi
c0106c89:	8b 9d 64 ff ff ff    	mov    -0x9c(%ebp),%ebx
c0106c8f:	89 d8                	mov    %ebx,%eax
c0106c91:	24 7f                	and    $0x7f,%al
c0106c93:	83 bd 5c ff ff ff 00 	cmpl   $0x0,-0xa4(%ebp)
c0106c9a:	0f 48 c3             	cmovs  %ebx,%eax
c0106c9d:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0106ca3:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106ca9:	85 c0                	test   %eax,%eax
c0106cab:	75 08                	jne    c0106cb5 <_svfiprintf_r+0x1b5>
c0106cad:	85 c9                	test   %ecx,%ecx
c0106caf:	0f 84 03 08 00 00    	je     c01074b8 <_svfiprintf_r+0x9b8>
c0106cb5:	80 fa 01             	cmp    $0x1,%dl
c0106cb8:	0f 84 8a 0a 00 00    	je     c0107748 <_svfiprintf_r+0xc48>
c0106cbe:	80 fa 02             	cmp    $0x2,%dl
c0106cc1:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0106cc4:	0f 85 86 01 00 00    	jne    c0106e50 <_svfiprintf_r+0x350>
c0106cca:	8b 95 44 ff ff ff    	mov    -0xbc(%ebp),%edx
c0106cd0:	89 c8                	mov    %ecx,%eax
c0106cd2:	83 eb 01             	sub    $0x1,%ebx
c0106cd5:	83 e0 0f             	and    $0xf,%eax
c0106cd8:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
c0106cdc:	c1 e9 04             	shr    $0x4,%ecx
c0106cdf:	85 c9                	test   %ecx,%ecx
c0106ce1:	88 03                	mov    %al,(%ebx)
c0106ce3:	75 eb                	jne    c0106cd0 <_svfiprintf_r+0x1d0>
c0106ce5:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106ce8:	29 d8                	sub    %ebx,%eax
c0106cea:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106cf0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c0106cf6:	8b 8d 58 ff ff ff    	mov    -0xa8(%ebp),%ecx
c0106cfc:	39 c1                	cmp    %eax,%ecx
c0106cfe:	0f 4d c1             	cmovge %ecx,%eax
c0106d01:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0106d07:	89 f8                	mov    %edi,%eax
c0106d09:	3c 01                	cmp    $0x1,%al
c0106d0b:	83 9d 60 ff ff ff ff 	sbbl   $0xffffffff,-0xa0(%ebp)
c0106d12:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c0106d18:	8b 8d 64 ff ff ff    	mov    -0x9c(%ebp),%ecx
c0106d1e:	89 d0                	mov    %edx,%eax
c0106d20:	89 cf                	mov    %ecx,%edi
c0106d22:	83 c0 02             	add    $0x2,%eax
c0106d25:	83 e7 02             	and    $0x2,%edi
c0106d28:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%ebp)
c0106d2e:	89 cf                	mov    %ecx,%edi
c0106d30:	0f 44 c2             	cmove  %edx,%eax
c0106d33:	81 e7 84 00 00 00    	and    $0x84,%edi
c0106d39:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0106d3f:	89 bd 48 ff ff ff    	mov    %edi,-0xb8(%ebp)
c0106d45:	0f 85 cd 04 00 00    	jne    c0107218 <_svfiprintf_r+0x718>
c0106d4b:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0106d51:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c0106d57:	85 ff                	test   %edi,%edi
c0106d59:	0f 8e b9 04 00 00    	jle    c0107218 <_svfiprintf_r+0x718>
c0106d5f:	83 ff 10             	cmp    $0x10,%edi
c0106d62:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106d68:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106d6e:	7e 7c                	jle    c0106dec <_svfiprintf_r+0x2ec>
c0106d70:	89 9d 40 ff ff ff    	mov    %ebx,-0xc0(%ebp)
c0106d76:	89 f1                	mov    %esi,%ecx
c0106d78:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0106d7b:	8b 75 0c             	mov    0xc(%ebp),%esi
c0106d7e:	eb 08                	jmp    c0106d88 <_svfiprintf_r+0x288>
c0106d80:	83 ef 10             	sub    $0x10,%edi
c0106d83:	83 ff 10             	cmp    $0x10,%edi
c0106d86:	7e 5c                	jle    c0106de4 <_svfiprintf_r+0x2e4>
c0106d88:	83 c0 01             	add    $0x1,%eax
c0106d8b:	83 c2 10             	add    $0x10,%edx
c0106d8e:	c7 01 dc 92 10 c0    	movl   $0xc01092dc,(%ecx)
c0106d94:	83 c1 08             	add    $0x8,%ecx
c0106d97:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c0106d9e:	83 f8 07             	cmp    $0x7,%eax
c0106da1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106da7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106dad:	7e d1                	jle    c0106d80 <_svfiprintf_r+0x280>
c0106daf:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106db5:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106db9:	89 74 24 04          	mov    %esi,0x4(%esp)
c0106dbd:	89 1c 24             	mov    %ebx,(%esp)
c0106dc0:	e8 4b fb ff ff       	call   c0106910 <__ssprint_r>
c0106dc5:	85 c0                	test   %eax,%eax
c0106dc7:	0f 85 3b 07 00 00    	jne    c0107508 <_svfiprintf_r+0xa08>
c0106dcd:	83 ef 10             	sub    $0x10,%edi
c0106dd0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106dd6:	83 ff 10             	cmp    $0x10,%edi
c0106dd9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106ddf:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0106de2:	7f a4                	jg     c0106d88 <_svfiprintf_r+0x288>
c0106de4:	8b 9d 40 ff ff ff    	mov    -0xc0(%ebp),%ebx
c0106dea:	89 ce                	mov    %ecx,%esi
c0106dec:	83 c0 01             	add    $0x1,%eax
c0106def:	01 fa                	add    %edi,%edx
c0106df1:	c7 06 dc 92 10 c0    	movl   $0xc01092dc,(%esi)
c0106df7:	83 c6 08             	add    $0x8,%esi
c0106dfa:	89 7e fc             	mov    %edi,-0x4(%esi)
c0106dfd:	83 f8 07             	cmp    $0x7,%eax
c0106e00:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0106e06:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0106e0c:	0f 8e 12 04 00 00    	jle    c0107224 <_svfiprintf_r+0x724>
c0106e12:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0106e18:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106e1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106e1f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106e23:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e26:	89 04 24             	mov    %eax,(%esp)
c0106e29:	e8 e2 fa ff ff       	call   c0106910 <__ssprint_r>
c0106e2e:	85 c0                	test   %eax,%eax
c0106e30:	0f 85 d2 06 00 00    	jne    c0107508 <_svfiprintf_r+0xa08>
c0106e36:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0106e3c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0106e3f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0106e45:	e9 da 03 00 00       	jmp    c0107224 <_svfiprintf_r+0x724>
c0106e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106e50:	89 c8                	mov    %ecx,%eax
c0106e52:	83 eb 01             	sub    $0x1,%ebx
c0106e55:	83 e0 07             	and    $0x7,%eax
c0106e58:	c1 e9 03             	shr    $0x3,%ecx
c0106e5b:	83 c0 30             	add    $0x30,%eax
c0106e5e:	85 c9                	test   %ecx,%ecx
c0106e60:	88 03                	mov    %al,(%ebx)
c0106e62:	75 ec                	jne    c0106e50 <_svfiprintf_r+0x350>
c0106e64:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0106e6b:	89 da                	mov    %ebx,%edx
c0106e6d:	0f 84 72 fe ff ff    	je     c0106ce5 <_svfiprintf_r+0x1e5>
c0106e73:	3c 30                	cmp    $0x30,%al
c0106e75:	0f 84 6a fe ff ff    	je     c0106ce5 <_svfiprintf_r+0x1e5>
c0106e7b:	83 eb 01             	sub    $0x1,%ebx
c0106e7e:	8d 45 a8             	lea    -0x58(%ebp),%eax
c0106e81:	29 d8                	sub    %ebx,%eax
c0106e83:	c6 42 ff 30          	movb   $0x30,-0x1(%edx)
c0106e87:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0106e8d:	e9 5e fe ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c0106e92:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106e99:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106ea0:	89 55 10             	mov    %edx,0x10(%ebp)
c0106ea3:	8b 45 14             	mov    0x14(%ebp),%eax
c0106ea6:	0f 85 48 01 00 00    	jne    c0106ff4 <_svfiprintf_r+0x4f4>
c0106eac:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106eb3:	0f 84 3b 01 00 00    	je     c0106ff4 <_svfiprintf_r+0x4f4>
c0106eb9:	0f b7 08             	movzwl (%eax),%ecx
c0106ebc:	83 c0 04             	add    $0x4,%eax
c0106ebf:	31 d2                	xor    %edx,%edx
c0106ec1:	89 45 14             	mov    %eax,0x14(%ebp)
c0106ec4:	e9 b7 fd ff ff       	jmp    c0106c80 <_svfiprintf_r+0x180>
c0106ec9:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c0106ed0:	89 f8                	mov    %edi,%eax
c0106ed2:	89 55 10             	mov    %edx,0x10(%ebp)
c0106ed5:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0106edb:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106ee2:	8b 45 14             	mov    0x14(%ebp),%eax
c0106ee5:	75 0d                	jne    c0106ef4 <_svfiprintf_r+0x3f4>
c0106ee7:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0106eee:	0f 85 f2 08 00 00    	jne    c01077e6 <_svfiprintf_r+0xce6>
c0106ef4:	8b 08                	mov    (%eax),%ecx
c0106ef6:	83 c0 04             	add    $0x4,%eax
c0106ef9:	89 45 14             	mov    %eax,0x14(%ebp)
c0106efc:	85 c9                	test   %ecx,%ecx
c0106efe:	0f 88 f3 08 00 00    	js     c01077f7 <_svfiprintf_r+0xcf7>
c0106f04:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0106f0b:	ba 01 00 00 00       	mov    $0x1,%edx
c0106f10:	e9 74 fd ff ff       	jmp    c0106c89 <_svfiprintf_r+0x189>
c0106f15:	0f be 02             	movsbl (%edx),%eax
c0106f18:	8d 5a 01             	lea    0x1(%edx),%ebx
c0106f1b:	83 f8 2a             	cmp    $0x2a,%eax
c0106f1e:	0f 84 af 09 00 00    	je     c01078d3 <_svfiprintf_r+0xdd3>
c0106f24:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106f27:	31 d2                	xor    %edx,%edx
c0106f29:	83 f9 09             	cmp    $0x9,%ecx
c0106f2c:	0f 87 90 09 00 00    	ja     c01078c2 <_svfiprintf_r+0xdc2>
c0106f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0106f38:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0106f3b:	83 c3 01             	add    $0x1,%ebx
c0106f3e:	8d 14 41             	lea    (%ecx,%eax,2),%edx
c0106f41:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
c0106f45:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106f48:	83 f9 09             	cmp    $0x9,%ecx
c0106f4b:	76 eb                	jbe    c0106f38 <_svfiprintf_r+0x438>
c0106f4d:	85 d2                	test   %edx,%edx
c0106f4f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
c0106f54:	0f 48 d1             	cmovs  %ecx,%edx
c0106f57:	8d 48 e0             	lea    -0x20(%eax),%ecx
c0106f5a:	83 f9 58             	cmp    $0x58,%ecx
c0106f5d:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%ebp)
c0106f63:	89 da                	mov    %ebx,%edx
c0106f65:	0f 86 9d fc ff ff    	jbe    c0106c08 <_svfiprintf_r+0x108>
c0106f6b:	89 fb                	mov    %edi,%ebx
c0106f6d:	85 c0                	test   %eax,%eax
c0106f6f:	89 55 10             	mov    %edx,0x10(%ebp)
c0106f72:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0106f78:	0f 84 5f 05 00 00    	je     c01074dd <_svfiprintf_r+0x9dd>
c0106f7e:	88 45 80             	mov    %al,-0x80(%ebp)
c0106f81:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c0106f84:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0106f8b:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c0106f92:	00 00 00 
c0106f95:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c0106f9c:	00 00 00 
c0106f9f:	e9 5a 01 00 00       	jmp    c01070fe <_svfiprintf_r+0x5fe>
c0106fa4:	31 db                	xor    %ebx,%ebx
c0106fa6:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0106fb0:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
c0106fb3:	83 c2 01             	add    $0x1,%edx
c0106fb6:	8d 1c 41             	lea    (%ecx,%eax,2),%ebx
c0106fb9:	0f be 42 ff          	movsbl -0x1(%edx),%eax
c0106fbd:	8d 48 d0             	lea    -0x30(%eax),%ecx
c0106fc0:	83 f9 09             	cmp    $0x9,%ecx
c0106fc3:	76 eb                	jbe    c0106fb0 <_svfiprintf_r+0x4b0>
c0106fc5:	89 9d 54 ff ff ff    	mov    %ebx,-0xac(%ebp)
c0106fcb:	e9 2c fc ff ff       	jmp    c0106bfc <_svfiprintf_r+0xfc>
c0106fd0:	81 8d 64 ff ff ff 80 	orl    $0x80,-0x9c(%ebp)
c0106fd7:	00 00 00 
c0106fda:	89 d0                	mov    %edx,%eax
c0106fdc:	e9 15 fc ff ff       	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0106fe1:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0106fe8:	89 55 10             	mov    %edx,0x10(%ebp)
c0106feb:	8b 45 14             	mov    0x14(%ebp),%eax
c0106fee:	0f 84 b8 fe ff ff    	je     c0106eac <_svfiprintf_r+0x3ac>
c0106ff4:	8b 08                	mov    (%eax),%ecx
c0106ff6:	83 c0 04             	add    $0x4,%eax
c0106ff9:	31 d2                	xor    %edx,%edx
c0106ffb:	89 45 14             	mov    %eax,0x14(%ebp)
c0106ffe:	e9 7d fc ff ff       	jmp    c0106c80 <_svfiprintf_r+0x180>
c0107003:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c010700a:	89 f8                	mov    %edi,%eax
c010700c:	89 55 10             	mov    %edx,0x10(%ebp)
c010700f:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c0107015:	0f 85 a2 07 00 00    	jne    c01077bd <_svfiprintf_r+0xcbd>
c010701b:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0107022:	0f 84 95 07 00 00    	je     c01077bd <_svfiprintf_r+0xcbd>
c0107028:	8b 45 14             	mov    0x14(%ebp),%eax
c010702b:	0f b7 9d 50 ff ff ff 	movzwl -0xb0(%ebp),%ebx
c0107032:	8b 00                	mov    (%eax),%eax
c0107034:	66 89 18             	mov    %bx,(%eax)
c0107037:	8b 45 14             	mov    0x14(%ebp),%eax
c010703a:	83 c0 04             	add    $0x4,%eax
c010703d:	89 45 14             	mov    %eax,0x14(%ebp)
c0107040:	e9 19 fb ff ff       	jmp    c0106b5e <_svfiprintf_r+0x5e>
c0107045:	89 fb                	mov    %edi,%ebx
c0107047:	89 55 10             	mov    %edx,0x10(%ebp)
c010704a:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0107050:	c7 85 44 ff ff ff 1b 	movl   $0xc0108e1b,-0xbc(%ebp)
c0107057:	8e 10 c0 
c010705a:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0107061:	8b 5d 14             	mov    0x14(%ebp),%ebx
c0107064:	75 0d                	jne    c0107073 <_svfiprintf_r+0x573>
c0107066:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c010706d:	0f 85 65 07 00 00    	jne    c01077d8 <_svfiprintf_r+0xcd8>
c0107073:	8b 0b                	mov    (%ebx),%ecx
c0107075:	83 c3 04             	add    $0x4,%ebx
c0107078:	89 5d 14             	mov    %ebx,0x14(%ebp)
c010707b:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c0107082:	ba 02 00 00 00       	mov    $0x2,%edx
c0107087:	0f 84 f3 fb ff ff    	je     c0106c80 <_svfiprintf_r+0x180>
c010708d:	85 c9                	test   %ecx,%ecx
c010708f:	0f 84 eb fb ff ff    	je     c0106c80 <_svfiprintf_r+0x180>
c0107095:	c6 85 72 ff ff ff 30 	movb   $0x30,-0x8e(%ebp)
c010709c:	88 85 73 ff ff ff    	mov    %al,-0x8d(%ebp)
c01070a2:	83 8d 64 ff ff ff 02 	orl    $0x2,-0x9c(%ebp)
c01070a9:	e9 d2 fb ff ff       	jmp    c0106c80 <_svfiprintf_r+0x180>
c01070ae:	83 8d 64 ff ff ff 40 	orl    $0x40,-0x9c(%ebp)
c01070b5:	89 d0                	mov    %edx,%eax
c01070b7:	e9 3a fb ff ff       	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c01070bc:	89 f8                	mov    %edi,%eax
c01070be:	89 55 10             	mov    %edx,0x10(%ebp)
c01070c1:	88 85 71 ff ff ff    	mov    %al,-0x8f(%ebp)
c01070c7:	e9 0f fe ff ff       	jmp    c0106edb <_svfiprintf_r+0x3db>
c01070cc:	8b 45 14             	mov    0x14(%ebp),%eax
c01070cf:	8d 5d 80             	lea    -0x80(%ebp),%ebx
c01070d2:	89 55 10             	mov    %edx,0x10(%ebp)
c01070d5:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c01070dc:	c7 85 60 ff ff ff 01 	movl   $0x1,-0xa0(%ebp)
c01070e3:	00 00 00 
c01070e6:	8b 00                	mov    (%eax),%eax
c01070e8:	c7 85 58 ff ff ff 01 	movl   $0x1,-0xa8(%ebp)
c01070ef:	00 00 00 
c01070f2:	88 45 80             	mov    %al,-0x80(%ebp)
c01070f5:	8b 45 14             	mov    0x14(%ebp),%eax
c01070f8:	83 c0 04             	add    $0x4,%eax
c01070fb:	89 45 14             	mov    %eax,0x14(%ebp)
c01070fe:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c0107105:	00 00 00 
c0107108:	e9 05 fc ff ff       	jmp    c0106d12 <_svfiprintf_r+0x212>
c010710d:	89 fb                	mov    %edi,%ebx
c010710f:	89 55 10             	mov    %edx,0x10(%ebp)
c0107112:	88 9d 71 ff ff ff    	mov    %bl,-0x8f(%ebp)
c0107118:	c7 85 44 ff ff ff 0a 	movl   $0xc0108e0a,-0xbc(%ebp)
c010711f:	8e 10 c0 
c0107122:	e9 33 ff ff ff       	jmp    c010705a <_svfiprintf_r+0x55a>
c0107127:	83 8d 64 ff ff ff 10 	orl    $0x10,-0x9c(%ebp)
c010712e:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c0107135:	89 55 10             	mov    %edx,0x10(%ebp)
c0107138:	8b 45 14             	mov    0x14(%ebp),%eax
c010713b:	75 39                	jne    c0107176 <_svfiprintf_r+0x676>
c010713d:	f6 85 64 ff ff ff 40 	testb  $0x40,-0x9c(%ebp)
c0107144:	74 30                	je     c0107176 <_svfiprintf_r+0x676>
c0107146:	0f b7 08             	movzwl (%eax),%ecx
c0107149:	83 c0 04             	add    $0x4,%eax
c010714c:	ba 01 00 00 00       	mov    $0x1,%edx
c0107151:	89 45 14             	mov    %eax,0x14(%ebp)
c0107154:	e9 27 fb ff ff       	jmp    c0106c80 <_svfiprintf_r+0x180>
c0107159:	83 8d 64 ff ff ff 01 	orl    $0x1,-0x9c(%ebp)
c0107160:	89 d0                	mov    %edx,%eax
c0107162:	e9 8f fa ff ff       	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0107167:	f6 85 64 ff ff ff 10 	testb  $0x10,-0x9c(%ebp)
c010716e:	89 55 10             	mov    %edx,0x10(%ebp)
c0107171:	8b 45 14             	mov    0x14(%ebp),%eax
c0107174:	74 c7                	je     c010713d <_svfiprintf_r+0x63d>
c0107176:	8b 08                	mov    (%eax),%ecx
c0107178:	83 c0 04             	add    $0x4,%eax
c010717b:	ba 01 00 00 00       	mov    $0x1,%edx
c0107180:	89 45 14             	mov    %eax,0x14(%ebp)
c0107183:	e9 f8 fa ff ff       	jmp    c0106c80 <_svfiprintf_r+0x180>
c0107188:	8b 45 14             	mov    0x14(%ebp),%eax
c010718b:	89 55 10             	mov    %edx,0x10(%ebp)
c010718e:	c6 85 71 ff ff ff 00 	movb   $0x0,-0x8f(%ebp)
c0107195:	8b 18                	mov    (%eax),%ebx
c0107197:	8d 50 04             	lea    0x4(%eax),%edx
c010719a:	85 db                	test   %ebx,%ebx
c010719c:	0f 84 cc 06 00 00    	je     c010786e <_svfiprintf_r+0xd6e>
c01071a2:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c01071a8:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
c01071ae:	85 ff                	test   %edi,%edi
c01071b0:	0f 88 59 06 00 00    	js     c010780f <_svfiprintf_r+0xd0f>
c01071b6:	89 7c 24 08          	mov    %edi,0x8(%esp)
c01071ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01071c1:	00 
c01071c2:	89 1c 24             	mov    %ebx,(%esp)
c01071c5:	e8 76 e7 ff ff       	call   c0105940 <memchr>
c01071ca:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c01071d0:	85 c0                	test   %eax,%eax
c01071d2:	0f 84 c5 06 00 00    	je     c010789d <_svfiprintf_r+0xd9d>
c01071d8:	29 d8                	sub    %ebx,%eax
c01071da:	39 f8                	cmp    %edi,%eax
c01071dc:	0f 4f c7             	cmovg  %edi,%eax
c01071df:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01071e6:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01071ec:	89 55 14             	mov    %edx,0x14(%ebp)
c01071ef:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01071f6:	00 00 00 
c01071f9:	e9 f2 fa ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c01071fe:	89 f8                	mov    %edi,%eax
c0107200:	84 c0                	test   %al,%al
c0107202:	b8 20 00 00 00       	mov    $0x20,%eax
c0107207:	0f 44 f8             	cmove  %eax,%edi
c010720a:	89 d0                	mov    %edx,%eax
c010720c:	e9 e5 f9 ff ff       	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0107211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107218:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010721e:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107224:	80 bd 71 ff ff ff 00 	cmpb   $0x0,-0x8f(%ebp)
c010722b:	74 2e                	je     c010725b <_svfiprintf_r+0x75b>
c010722d:	83 c0 01             	add    $0x1,%eax
c0107230:	83 c2 01             	add    $0x1,%edx
c0107233:	8d 8d 71 ff ff ff    	lea    -0x8f(%ebp),%ecx
c0107239:	83 c6 08             	add    $0x8,%esi
c010723c:	89 4e f8             	mov    %ecx,-0x8(%esi)
c010723f:	c7 46 fc 01 00 00 00 	movl   $0x1,-0x4(%esi)
c0107246:	83 f8 07             	cmp    $0x7,%eax
c0107249:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010724f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0107255:	0f 8f b5 04 00 00    	jg     c0107710 <_svfiprintf_r+0xc10>
c010725b:	8b 8d 4c ff ff ff    	mov    -0xb4(%ebp),%ecx
c0107261:	85 c9                	test   %ecx,%ecx
c0107263:	74 2e                	je     c0107293 <_svfiprintf_r+0x793>
c0107265:	83 c0 01             	add    $0x1,%eax
c0107268:	83 c2 02             	add    $0x2,%edx
c010726b:	8d 8d 72 ff ff ff    	lea    -0x8e(%ebp),%ecx
c0107271:	83 c6 08             	add    $0x8,%esi
c0107274:	89 4e f8             	mov    %ecx,-0x8(%esi)
c0107277:	c7 46 fc 02 00 00 00 	movl   $0x2,-0x4(%esi)
c010727e:	83 f8 07             	cmp    $0x7,%eax
c0107281:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107287:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010728d:	0f 8f 45 04 00 00    	jg     c01076d8 <_svfiprintf_r+0xbd8>
c0107293:	81 bd 48 ff ff ff 80 	cmpl   $0x80,-0xb8(%ebp)
c010729a:	00 00 00 
c010729d:	0f 84 9d 02 00 00    	je     c0107540 <_svfiprintf_r+0xa40>
c01072a3:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c01072a9:	2b bd 58 ff ff ff    	sub    -0xa8(%ebp),%edi
c01072af:	85 ff                	test   %edi,%edi
c01072b1:	0f 8e e1 00 00 00    	jle    c0107398 <_svfiprintf_r+0x898>
c01072b7:	83 ff 10             	cmp    $0x10,%edi
c01072ba:	0f 8e 7c 00 00 00    	jle    c010733c <_svfiprintf_r+0x83c>
c01072c0:	89 9d 5c ff ff ff    	mov    %ebx,-0xa4(%ebp)
c01072c6:	89 f1                	mov    %esi,%ecx
c01072c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01072cb:	8b 75 0c             	mov    0xc(%ebp),%esi
c01072ce:	eb 08                	jmp    c01072d8 <_svfiprintf_r+0x7d8>
c01072d0:	83 ef 10             	sub    $0x10,%edi
c01072d3:	83 ff 10             	cmp    $0x10,%edi
c01072d6:	7e 5c                	jle    c0107334 <_svfiprintf_r+0x834>
c01072d8:	83 c0 01             	add    $0x1,%eax
c01072db:	83 c2 10             	add    $0x10,%edx
c01072de:	c7 01 cc 92 10 c0    	movl   $0xc01092cc,(%ecx)
c01072e4:	83 c1 08             	add    $0x8,%ecx
c01072e7:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c01072ee:	83 f8 07             	cmp    $0x7,%eax
c01072f1:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01072f7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01072fd:	7e d1                	jle    c01072d0 <_svfiprintf_r+0x7d0>
c01072ff:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107305:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107309:	89 74 24 04          	mov    %esi,0x4(%esp)
c010730d:	89 1c 24             	mov    %ebx,(%esp)
c0107310:	e8 fb f5 ff ff       	call   c0106910 <__ssprint_r>
c0107315:	85 c0                	test   %eax,%eax
c0107317:	0f 85 eb 01 00 00    	jne    c0107508 <_svfiprintf_r+0xa08>
c010731d:	83 ef 10             	sub    $0x10,%edi
c0107320:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107326:	83 ff 10             	cmp    $0x10,%edi
c0107329:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010732f:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c0107332:	7f a4                	jg     c01072d8 <_svfiprintf_r+0x7d8>
c0107334:	8b 9d 5c ff ff ff    	mov    -0xa4(%ebp),%ebx
c010733a:	89 ce                	mov    %ecx,%esi
c010733c:	83 c0 01             	add    $0x1,%eax
c010733f:	01 fa                	add    %edi,%edx
c0107341:	c7 06 cc 92 10 c0    	movl   $0xc01092cc,(%esi)
c0107347:	83 c6 08             	add    $0x8,%esi
c010734a:	89 7e fc             	mov    %edi,-0x4(%esi)
c010734d:	83 f8 07             	cmp    $0x7,%eax
c0107350:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107356:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010735c:	7e 3a                	jle    c0107398 <_svfiprintf_r+0x898>
c010735e:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107364:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107368:	8b 45 0c             	mov    0xc(%ebp),%eax
c010736b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010736f:	8b 45 08             	mov    0x8(%ebp),%eax
c0107372:	89 04 24             	mov    %eax,(%esp)
c0107375:	e8 96 f5 ff ff       	call   c0106910 <__ssprint_r>
c010737a:	85 c0                	test   %eax,%eax
c010737c:	0f 85 86 01 00 00    	jne    c0107508 <_svfiprintf_r+0xa08>
c0107382:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107388:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010738b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107398:	89 1e                	mov    %ebx,(%esi)
c010739a:	8b 9d 58 ff ff ff    	mov    -0xa8(%ebp),%ebx
c01073a0:	83 c0 01             	add    $0x1,%eax
c01073a3:	83 c6 08             	add    $0x8,%esi
c01073a6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01073ac:	89 5e fc             	mov    %ebx,-0x4(%esi)
c01073af:	01 da                	add    %ebx,%edx
c01073b1:	83 f8 07             	cmp    $0x7,%eax
c01073b4:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01073ba:	0f 8f 80 02 00 00    	jg     c0107640 <_svfiprintf_r+0xb40>
c01073c0:	f6 85 64 ff ff ff 04 	testb  $0x4,-0x9c(%ebp)
c01073c7:	0f 84 b9 00 00 00    	je     c0107486 <_svfiprintf_r+0x986>
c01073cd:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c01073d3:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c01073d9:	85 ff                	test   %edi,%edi
c01073db:	0f 8e a5 00 00 00    	jle    c0107486 <_svfiprintf_r+0x986>
c01073e1:	83 ff 10             	cmp    $0x10,%edi
c01073e4:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01073ea:	8d 9d 74 ff ff ff    	lea    -0x8c(%ebp),%ebx
c01073f0:	7e 71                	jle    c0107463 <_svfiprintf_r+0x963>
c01073f2:	89 f1                	mov    %esi,%ecx
c01073f4:	8b 75 08             	mov    0x8(%ebp),%esi
c01073f7:	eb 0f                	jmp    c0107408 <_svfiprintf_r+0x908>
c01073f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107400:	83 ef 10             	sub    $0x10,%edi
c0107403:	83 ff 10             	cmp    $0x10,%edi
c0107406:	7e 59                	jle    c0107461 <_svfiprintf_r+0x961>
c0107408:	83 c0 01             	add    $0x1,%eax
c010740b:	83 c2 10             	add    $0x10,%edx
c010740e:	c7 01 dc 92 10 c0    	movl   $0xc01092dc,(%ecx)
c0107414:	83 c1 08             	add    $0x8,%ecx
c0107417:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010741e:	83 f8 07             	cmp    $0x7,%eax
c0107421:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107427:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010742d:	7e d1                	jle    c0107400 <_svfiprintf_r+0x900>
c010742f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107432:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0107436:	89 34 24             	mov    %esi,(%esp)
c0107439:	89 44 24 04          	mov    %eax,0x4(%esp)
c010743d:	e8 ce f4 ff ff       	call   c0106910 <__ssprint_r>
c0107442:	85 c0                	test   %eax,%eax
c0107444:	0f 85 be 00 00 00    	jne    c0107508 <_svfiprintf_r+0xa08>
c010744a:	83 ef 10             	sub    $0x10,%edi
c010744d:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107453:	83 ff 10             	cmp    $0x10,%edi
c0107456:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010745c:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c010745f:	7f a7                	jg     c0107408 <_svfiprintf_r+0x908>
c0107461:	89 ce                	mov    %ecx,%esi
c0107463:	83 c0 01             	add    $0x1,%eax
c0107466:	01 fa                	add    %edi,%edx
c0107468:	83 f8 07             	cmp    $0x7,%eax
c010746b:	c7 06 dc 92 10 c0    	movl   $0xc01092dc,(%esi)
c0107471:	89 7e 04             	mov    %edi,0x4(%esi)
c0107474:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c010747a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0107480:	0f 8f ee 02 00 00    	jg     c0107774 <_svfiprintf_r+0xc74>
c0107486:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
c010748c:	8b b5 60 ff ff ff    	mov    -0xa0(%ebp),%esi
c0107492:	39 c6                	cmp    %eax,%esi
c0107494:	0f 4d c6             	cmovge %esi,%eax
c0107497:	01 85 50 ff ff ff    	add    %eax,-0xb0(%ebp)
c010749d:	85 d2                	test   %edx,%edx
c010749f:	0f 85 d3 01 00 00    	jne    c0107678 <_svfiprintf_r+0xb78>
c01074a5:	c7 85 78 ff ff ff 00 	movl   $0x0,-0x88(%ebp)
c01074ac:	00 00 00 
c01074af:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01074b2:	e9 a7 f6 ff ff       	jmp    c0106b5e <_svfiprintf_r+0x5e>
c01074b7:	90                   	nop
c01074b8:	84 d2                	test   %dl,%dl
c01074ba:	75 6c                	jne    c0107528 <_svfiprintf_r+0xa28>
c01074bc:	f6 85 64 ff ff ff 01 	testb  $0x1,-0x9c(%ebp)
c01074c3:	74 63                	je     c0107528 <_svfiprintf_r+0xa28>
c01074c5:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c01074cb:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c01074ce:	c6 45 a7 30          	movb   $0x30,-0x59(%ebp)
c01074d2:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01074d8:	e9 13 f8 ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c01074dd:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01074e3:	85 c0                	test   %eax,%eax
c01074e5:	74 21                	je     c0107508 <_svfiprintf_r+0xa08>
c01074e7:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01074ed:	89 44 24 08          	mov    %eax,0x8(%esp)
c01074f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01074f4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01074f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01074fb:	89 04 24             	mov    %eax,(%esp)
c01074fe:	e8 0d f4 ff ff       	call   c0106910 <__ssprint_r>
c0107503:	90                   	nop
c0107504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107508:	8b 75 0c             	mov    0xc(%ebp),%esi
c010750b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0107510:	f6 46 0c 40          	testb  $0x40,0xc(%esi)
c0107514:	0f 44 85 50 ff ff ff 	cmove  -0xb0(%ebp),%eax
c010751b:	81 c4 cc 00 00 00    	add    $0xcc,%esp
c0107521:	5b                   	pop    %ebx
c0107522:	5e                   	pop    %esi
c0107523:	5f                   	pop    %edi
c0107524:	5d                   	pop    %ebp
c0107525:	c3                   	ret    
c0107526:	66 90                	xchg   %ax,%ax
c0107528:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c010752f:	00 00 00 
c0107532:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0107535:	e9 b6 f7 ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c010753a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107540:	8b bd 54 ff ff ff    	mov    -0xac(%ebp),%edi
c0107546:	2b bd 60 ff ff ff    	sub    -0xa0(%ebp),%edi
c010754c:	85 ff                	test   %edi,%edi
c010754e:	0f 8e 4f fd ff ff    	jle    c01072a3 <_svfiprintf_r+0x7a3>
c0107554:	83 ff 10             	cmp    $0x10,%edi
c0107557:	0f 8e 7f 00 00 00    	jle    c01075dc <_svfiprintf_r+0xadc>
c010755d:	89 9d 4c ff ff ff    	mov    %ebx,-0xb4(%ebp)
c0107563:	89 f1                	mov    %esi,%ecx
c0107565:	8b 5d 08             	mov    0x8(%ebp),%ebx
c0107568:	8b 75 0c             	mov    0xc(%ebp),%esi
c010756b:	eb 0b                	jmp    c0107578 <_svfiprintf_r+0xa78>
c010756d:	8d 76 00             	lea    0x0(%esi),%esi
c0107570:	83 ef 10             	sub    $0x10,%edi
c0107573:	83 ff 10             	cmp    $0x10,%edi
c0107576:	7e 5c                	jle    c01075d4 <_svfiprintf_r+0xad4>
c0107578:	83 c0 01             	add    $0x1,%eax
c010757b:	83 c2 10             	add    $0x10,%edx
c010757e:	c7 01 cc 92 10 c0    	movl   $0xc01092cc,(%ecx)
c0107584:	83 c1 08             	add    $0x8,%ecx
c0107587:	c7 41 fc 10 00 00 00 	movl   $0x10,-0x4(%ecx)
c010758e:	83 f8 07             	cmp    $0x7,%eax
c0107591:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c0107597:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010759d:	7e d1                	jle    c0107570 <_svfiprintf_r+0xa70>
c010759f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01075a5:	89 44 24 08          	mov    %eax,0x8(%esp)
c01075a9:	89 74 24 04          	mov    %esi,0x4(%esp)
c01075ad:	89 1c 24             	mov    %ebx,(%esp)
c01075b0:	e8 5b f3 ff ff       	call   c0106910 <__ssprint_r>
c01075b5:	85 c0                	test   %eax,%eax
c01075b7:	0f 85 4b ff ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c01075bd:	83 ef 10             	sub    $0x10,%edi
c01075c0:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c01075c6:	83 ff 10             	cmp    $0x10,%edi
c01075c9:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01075cf:	8d 4d a8             	lea    -0x58(%ebp),%ecx
c01075d2:	7f a4                	jg     c0107578 <_svfiprintf_r+0xa78>
c01075d4:	8b 9d 4c ff ff ff    	mov    -0xb4(%ebp),%ebx
c01075da:	89 ce                	mov    %ecx,%esi
c01075dc:	83 c0 01             	add    $0x1,%eax
c01075df:	01 fa                	add    %edi,%edx
c01075e1:	c7 06 cc 92 10 c0    	movl   $0xc01092cc,(%esi)
c01075e7:	83 c6 08             	add    $0x8,%esi
c01075ea:	89 7e fc             	mov    %edi,-0x4(%esi)
c01075ed:	83 f8 07             	cmp    $0x7,%eax
c01075f0:	89 95 7c ff ff ff    	mov    %edx,-0x84(%ebp)
c01075f6:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01075fc:	0f 8e a1 fc ff ff    	jle    c01072a3 <_svfiprintf_r+0x7a3>
c0107602:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107608:	89 44 24 08          	mov    %eax,0x8(%esp)
c010760c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010760f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107613:	8b 45 08             	mov    0x8(%ebp),%eax
c0107616:	89 04 24             	mov    %eax,(%esp)
c0107619:	e8 f2 f2 ff ff       	call   c0106910 <__ssprint_r>
c010761e:	85 c0                	test   %eax,%eax
c0107620:	0f 85 e2 fe ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c0107626:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010762c:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010762f:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107635:	e9 69 fc ff ff       	jmp    c01072a3 <_svfiprintf_r+0x7a3>
c010763a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107640:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107646:	89 44 24 08          	mov    %eax,0x8(%esp)
c010764a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010764d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107651:	8b 45 08             	mov    0x8(%ebp),%eax
c0107654:	89 04 24             	mov    %eax,(%esp)
c0107657:	e8 b4 f2 ff ff       	call   c0106910 <__ssprint_r>
c010765c:	85 c0                	test   %eax,%eax
c010765e:	0f 85 a4 fe ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c0107664:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010766a:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010766d:	e9 4e fd ff ff       	jmp    c01073c0 <_svfiprintf_r+0x8c0>
c0107672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107678:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010767e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107682:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107685:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107689:	8b 45 08             	mov    0x8(%ebp),%eax
c010768c:	89 04 24             	mov    %eax,(%esp)
c010768f:	e8 7c f2 ff ff       	call   c0106910 <__ssprint_r>
c0107694:	85 c0                	test   %eax,%eax
c0107696:	0f 84 09 fe ff ff    	je     c01074a5 <_svfiprintf_r+0x9a5>
c010769c:	e9 67 fe ff ff       	jmp    c0107508 <_svfiprintf_r+0xa08>
c01076a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01076a8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01076ae:	89 44 24 08          	mov    %eax,0x8(%esp)
c01076b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01076b5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01076b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01076bc:	89 04 24             	mov    %eax,(%esp)
c01076bf:	e8 4c f2 ff ff       	call   c0106910 <__ssprint_r>
c01076c4:	85 c0                	test   %eax,%eax
c01076c6:	0f 85 3c fe ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c01076cc:	8d 75 a8             	lea    -0x58(%ebp),%esi
c01076cf:	e9 e9 f4 ff ff       	jmp    c0106bbd <_svfiprintf_r+0xbd>
c01076d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01076d8:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01076de:	89 44 24 08          	mov    %eax,0x8(%esp)
c01076e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01076e5:	89 44 24 04          	mov    %eax,0x4(%esp)
c01076e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01076ec:	89 04 24             	mov    %eax,(%esp)
c01076ef:	e8 1c f2 ff ff       	call   c0106910 <__ssprint_r>
c01076f4:	85 c0                	test   %eax,%eax
c01076f6:	0f 85 0c fe ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c01076fc:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c0107702:	8d 75 a8             	lea    -0x58(%ebp),%esi
c0107705:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010770b:	e9 83 fb ff ff       	jmp    c0107293 <_svfiprintf_r+0x793>
c0107710:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0107716:	89 44 24 08          	mov    %eax,0x8(%esp)
c010771a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010771d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107721:	8b 45 08             	mov    0x8(%ebp),%eax
c0107724:	89 04 24             	mov    %eax,(%esp)
c0107727:	e8 e4 f1 ff ff       	call   c0106910 <__ssprint_r>
c010772c:	85 c0                	test   %eax,%eax
c010772e:	0f 85 d4 fd ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c0107734:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010773a:	8d 75 a8             	lea    -0x58(%ebp),%esi
c010773d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0107743:	e9 13 fb ff ff       	jmp    c010725b <_svfiprintf_r+0x75b>
c0107748:	83 f9 09             	cmp    $0x9,%ecx
c010774b:	76 56                	jbe    c01077a3 <_svfiprintf_r+0xca3>
c010774d:	8d 5d a8             	lea    -0x58(%ebp),%ebx
c0107750:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
c0107755:	83 eb 01             	sub    $0x1,%ebx
c0107758:	f7 e1                	mul    %ecx
c010775a:	c1 ea 03             	shr    $0x3,%edx
c010775d:	8d 04 92             	lea    (%edx,%edx,4),%eax
c0107760:	01 c0                	add    %eax,%eax
c0107762:	29 c1                	sub    %eax,%ecx
c0107764:	83 c1 30             	add    $0x30,%ecx
c0107767:	85 d2                	test   %edx,%edx
c0107769:	88 0b                	mov    %cl,(%ebx)
c010776b:	89 d1                	mov    %edx,%ecx
c010776d:	75 e1                	jne    c0107750 <_svfiprintf_r+0xc50>
c010776f:	e9 71 f5 ff ff       	jmp    c0106ce5 <_svfiprintf_r+0x1e5>
c0107774:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010777a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010777e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107781:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107785:	8b 45 08             	mov    0x8(%ebp),%eax
c0107788:	89 04 24             	mov    %eax,(%esp)
c010778b:	e8 80 f1 ff ff       	call   c0106910 <__ssprint_r>
c0107790:	85 c0                	test   %eax,%eax
c0107792:	0f 85 70 fd ff ff    	jne    c0107508 <_svfiprintf_r+0xa08>
c0107798:	8b 95 7c ff ff ff    	mov    -0x84(%ebp),%edx
c010779e:	e9 e3 fc ff ff       	jmp    c0107486 <_svfiprintf_r+0x986>
c01077a3:	8b 85 3c ff ff ff    	mov    -0xc4(%ebp),%eax
c01077a9:	83 c1 30             	add    $0x30,%ecx
c01077ac:	88 4d a7             	mov    %cl,-0x59(%ebp)
c01077af:	8d 5d a7             	lea    -0x59(%ebp),%ebx
c01077b2:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01077b8:	e9 33 f5 ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c01077bd:	8b 45 14             	mov    0x14(%ebp),%eax
c01077c0:	8b 9d 50 ff ff ff    	mov    -0xb0(%ebp),%ebx
c01077c6:	8b 00                	mov    (%eax),%eax
c01077c8:	89 18                	mov    %ebx,(%eax)
c01077ca:	8b 45 14             	mov    0x14(%ebp),%eax
c01077cd:	83 c0 04             	add    $0x4,%eax
c01077d0:	89 45 14             	mov    %eax,0x14(%ebp)
c01077d3:	e9 86 f3 ff ff       	jmp    c0106b5e <_svfiprintf_r+0x5e>
c01077d8:	0f b7 0b             	movzwl (%ebx),%ecx
c01077db:	83 c3 04             	add    $0x4,%ebx
c01077de:	89 5d 14             	mov    %ebx,0x14(%ebp)
c01077e1:	e9 95 f8 ff ff       	jmp    c010707b <_svfiprintf_r+0x57b>
c01077e6:	0f bf 08             	movswl (%eax),%ecx
c01077e9:	83 c0 04             	add    $0x4,%eax
c01077ec:	89 45 14             	mov    %eax,0x14(%ebp)
c01077ef:	85 c9                	test   %ecx,%ecx
c01077f1:	0f 89 0d f7 ff ff    	jns    c0106f04 <_svfiprintf_r+0x404>
c01077f7:	f7 d9                	neg    %ecx
c01077f9:	bf 2d 00 00 00       	mov    $0x2d,%edi
c01077fe:	c6 85 71 ff ff ff 2d 	movb   $0x2d,-0x8f(%ebp)
c0107805:	ba 01 00 00 00       	mov    $0x1,%edx
c010780a:	e9 7a f4 ff ff       	jmp    c0106c89 <_svfiprintf_r+0x189>
c010780f:	89 1c 24             	mov    %ebx,(%esp)
c0107812:	e8 79 f0 ff ff       	call   c0106890 <strlen>
c0107817:	8b 95 60 ff ff ff    	mov    -0xa0(%ebp),%edx
c010781d:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c0107824:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c010782b:	00 00 00 
c010782e:	89 55 14             	mov    %edx,0x14(%ebp)
c0107831:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107837:	e9 b4 f4 ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c010783c:	8b 45 08             	mov    0x8(%ebp),%eax
c010783f:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
c0107846:	00 
c0107847:	89 04 24             	mov    %eax,(%esp)
c010784a:	e8 b1 d9 ff ff       	call   c0105200 <_malloc_r>
c010784f:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107852:	85 c0                	test   %eax,%eax
c0107854:	89 06                	mov    %eax,(%esi)
c0107856:	89 46 10             	mov    %eax,0x10(%esi)
c0107859:	0f 84 a3 00 00 00    	je     c0107902 <_svfiprintf_r+0xe02>
c010785f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107862:	c7 40 14 40 00 00 00 	movl   $0x40,0x14(%eax)
c0107869:	e9 b2 f2 ff ff       	jmp    c0106b20 <_svfiprintf_r+0x20>
c010786e:	8b bd 5c ff ff ff    	mov    -0xa4(%ebp),%edi
c0107874:	b8 06 00 00 00       	mov    $0x6,%eax
c0107879:	89 55 14             	mov    %edx,0x14(%ebp)
c010787c:	83 ff 06             	cmp    $0x6,%edi
c010787f:	0f 46 c7             	cmovbe %edi,%eax
c0107882:	85 c0                	test   %eax,%eax
c0107884:	0f 49 d8             	cmovns %eax,%ebx
c0107887:	89 9d 60 ff ff ff    	mov    %ebx,-0xa0(%ebp)
c010788d:	bb 2c 8e 10 c0       	mov    $0xc0108e2c,%ebx
c0107892:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c0107898:	e9 61 f8 ff ff       	jmp    c01070fe <_svfiprintf_r+0x5fe>
c010789d:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c01078a3:	0f b6 bd 71 ff ff ff 	movzbl -0x8f(%ebp),%edi
c01078aa:	89 55 14             	mov    %edx,0x14(%ebp)
c01078ad:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01078b4:	00 00 00 
c01078b7:	89 85 58 ff ff ff    	mov    %eax,-0xa8(%ebp)
c01078bd:	e9 2e f4 ff ff       	jmp    c0106cf0 <_svfiprintf_r+0x1f0>
c01078c2:	89 da                	mov    %ebx,%edx
c01078c4:	c7 85 5c ff ff ff 00 	movl   $0x0,-0xa4(%ebp)
c01078cb:	00 00 00 
c01078ce:	e9 29 f3 ff ff       	jmp    c0106bfc <_svfiprintf_r+0xfc>
c01078d3:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01078d6:	89 da                	mov    %ebx,%edx
c01078d8:	8b 45 14             	mov    0x14(%ebp),%eax
c01078db:	8b 09                	mov    (%ecx),%ecx
c01078dd:	83 c0 04             	add    $0x4,%eax
c01078e0:	89 45 14             	mov    %eax,0x14(%ebp)
c01078e3:	85 c9                	test   %ecx,%ecx
c01078e5:	89 8d 5c ff ff ff    	mov    %ecx,-0xa4(%ebp)
c01078eb:	0f 89 26 f3 ff ff    	jns    c0106c17 <_svfiprintf_r+0x117>
c01078f1:	c7 85 5c ff ff ff ff 	movl   $0xffffffff,-0xa4(%ebp)
c01078f8:	ff ff ff 
c01078fb:	89 d0                	mov    %edx,%eax
c01078fd:	e9 f4 f2 ff ff       	jmp    c0106bf6 <_svfiprintf_r+0xf6>
c0107902:	8b 45 08             	mov    0x8(%ebp),%eax
c0107905:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c010790b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0107910:	e9 06 fc ff ff       	jmp    c010751b <_svfiprintf_r+0xa1b>
c0107915:	66 90                	xchg   %ax,%ax
c0107917:	66 90                	xchg   %ax,%ax
c0107919:	66 90                	xchg   %ax,%ax
c010791b:	66 90                	xchg   %ax,%ax
c010791d:	66 90                	xchg   %ax,%ax
c010791f:	90                   	nop

c0107920 <_calloc_r>:
c0107920:	55                   	push   %ebp
c0107921:	89 e5                	mov    %esp,%ebp
c0107923:	53                   	push   %ebx
c0107924:	83 ec 14             	sub    $0x14,%esp
c0107927:	8b 45 10             	mov    0x10(%ebp),%eax
c010792a:	0f af 45 0c          	imul   0xc(%ebp),%eax
c010792e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107932:	8b 45 08             	mov    0x8(%ebp),%eax
c0107935:	89 04 24             	mov    %eax,(%esp)
c0107938:	e8 c3 d8 ff ff       	call   c0105200 <_malloc_r>
c010793d:	85 c0                	test   %eax,%eax
c010793f:	89 c3                	mov    %eax,%ebx
c0107941:	0f 84 91 00 00 00    	je     c01079d8 <_calloc_r+0xb8>
c0107947:	8b 40 fc             	mov    -0x4(%eax),%eax
c010794a:	83 e0 fc             	and    $0xfffffffc,%eax
c010794d:	83 e8 04             	sub    $0x4,%eax
c0107950:	83 f8 24             	cmp    $0x24,%eax
c0107953:	77 63                	ja     c01079b8 <_calloc_r+0x98>
c0107955:	83 f8 13             	cmp    $0x13,%eax
c0107958:	89 da                	mov    %ebx,%edx
c010795a:	77 1c                	ja     c0107978 <_calloc_r+0x58>
c010795c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
c0107962:	89 d8                	mov    %ebx,%eax
c0107964:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
c010796b:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
c0107972:	83 c4 14             	add    $0x14,%esp
c0107975:	5b                   	pop    %ebx
c0107976:	5d                   	pop    %ebp
c0107977:	c3                   	ret    
c0107978:	83 f8 1b             	cmp    $0x1b,%eax
c010797b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
c0107981:	8d 53 08             	lea    0x8(%ebx),%edx
c0107984:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
c010798b:	76 cf                	jbe    c010795c <_calloc_r+0x3c>
c010798d:	83 f8 24             	cmp    $0x24,%eax
c0107990:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
c0107997:	8d 53 10             	lea    0x10(%ebx),%edx
c010799a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
c01079a1:	75 b9                	jne    c010795c <_calloc_r+0x3c>
c01079a3:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
c01079aa:	8d 53 18             	lea    0x18(%ebx),%edx
c01079ad:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
c01079b4:	eb a6                	jmp    c010795c <_calloc_r+0x3c>
c01079b6:	66 90                	xchg   %ax,%ax
c01079b8:	89 1c 24             	mov    %ebx,(%esp)
c01079bb:	89 44 24 08          	mov    %eax,0x8(%esp)
c01079bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01079c6:	00 
c01079c7:	e8 5c a2 ff ff       	call   c0101c28 <memset>
c01079cc:	83 c4 14             	add    $0x14,%esp
c01079cf:	89 d8                	mov    %ebx,%eax
c01079d1:	5b                   	pop    %ebx
c01079d2:	5d                   	pop    %ebp
c01079d3:	c3                   	ret    
c01079d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01079d8:	31 c0                	xor    %eax,%eax
c01079da:	eb 96                	jmp    c0107972 <_calloc_r+0x52>
c01079dc:	66 90                	xchg   %ax,%ax
c01079de:	66 90                	xchg   %ax,%ax

c01079e0 <_malloc_trim_r>:
c01079e0:	55                   	push   %ebp
c01079e1:	89 e5                	mov    %esp,%ebp
c01079e3:	57                   	push   %edi
c01079e4:	56                   	push   %esi
c01079e5:	53                   	push   %ebx
c01079e6:	83 ec 1c             	sub    $0x1c,%esp
c01079e9:	8b 75 08             	mov    0x8(%ebp),%esi
c01079ec:	89 34 24             	mov    %esi,(%esp)
c01079ef:	e8 ec df ff ff       	call   c01059e0 <__malloc_lock>
c01079f4:	a1 88 b8 10 c0       	mov    0xc010b888,%eax
c01079f9:	8b 58 04             	mov    0x4(%eax),%ebx
c01079fc:	83 e3 fc             	and    $0xfffffffc,%ebx
c01079ff:	89 d8                	mov    %ebx,%eax
c0107a01:	2b 45 0c             	sub    0xc(%ebp),%eax
c0107a04:	05 ef 0f 00 00       	add    $0xfef,%eax
c0107a09:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0107a0e:	8d b8 00 f0 ff ff    	lea    -0x1000(%eax),%edi
c0107a14:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
c0107a1a:	7e 1c                	jle    c0107a38 <_malloc_trim_r+0x58>
c0107a1c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107a23:	00 
c0107a24:	89 34 24             	mov    %esi,(%esp)
c0107a27:	e8 b4 ed ff ff       	call   c01067e0 <_sbrk_r>
c0107a2c:	8b 15 88 b8 10 c0    	mov    0xc010b888,%edx
c0107a32:	01 da                	add    %ebx,%edx
c0107a34:	39 d0                	cmp    %edx,%eax
c0107a36:	74 18                	je     c0107a50 <_malloc_trim_r+0x70>
c0107a38:	89 34 24             	mov    %esi,(%esp)
c0107a3b:	e8 b0 df ff ff       	call   c01059f0 <__malloc_unlock>
c0107a40:	83 c4 1c             	add    $0x1c,%esp
c0107a43:	31 c0                	xor    %eax,%eax
c0107a45:	5b                   	pop    %ebx
c0107a46:	5e                   	pop    %esi
c0107a47:	5f                   	pop    %edi
c0107a48:	5d                   	pop    %ebp
c0107a49:	c3                   	ret    
c0107a4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107a50:	89 f8                	mov    %edi,%eax
c0107a52:	f7 d8                	neg    %eax
c0107a54:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107a58:	89 34 24             	mov    %esi,(%esp)
c0107a5b:	e8 80 ed ff ff       	call   c01067e0 <_sbrk_r>
c0107a60:	83 f8 ff             	cmp    $0xffffffff,%eax
c0107a63:	74 2b                	je     c0107a90 <_malloc_trim_r+0xb0>
c0107a65:	a1 88 b8 10 c0       	mov    0xc010b888,%eax
c0107a6a:	29 fb                	sub    %edi,%ebx
c0107a6c:	83 cb 01             	or     $0x1,%ebx
c0107a6f:	29 3d 60 35 16 c0    	sub    %edi,0xc0163560
c0107a75:	89 58 04             	mov    %ebx,0x4(%eax)
c0107a78:	89 34 24             	mov    %esi,(%esp)
c0107a7b:	e8 70 df ff ff       	call   c01059f0 <__malloc_unlock>
c0107a80:	83 c4 1c             	add    $0x1c,%esp
c0107a83:	b8 01 00 00 00       	mov    $0x1,%eax
c0107a88:	5b                   	pop    %ebx
c0107a89:	5e                   	pop    %esi
c0107a8a:	5f                   	pop    %edi
c0107a8b:	5d                   	pop    %ebp
c0107a8c:	c3                   	ret    
c0107a8d:	8d 76 00             	lea    0x0(%esi),%esi
c0107a90:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107a97:	00 
c0107a98:	89 34 24             	mov    %esi,(%esp)
c0107a9b:	e8 40 ed ff ff       	call   c01067e0 <_sbrk_r>
c0107aa0:	8b 15 88 b8 10 c0    	mov    0xc010b888,%edx
c0107aa6:	89 c1                	mov    %eax,%ecx
c0107aa8:	29 d1                	sub    %edx,%ecx
c0107aaa:	83 f9 0f             	cmp    $0xf,%ecx
c0107aad:	7e 89                	jle    c0107a38 <_malloc_trim_r+0x58>
c0107aaf:	2b 05 60 b8 10 c0    	sub    0xc010b860,%eax
c0107ab5:	83 c9 01             	or     $0x1,%ecx
c0107ab8:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107abb:	a3 60 35 16 c0       	mov    %eax,0xc0163560
c0107ac0:	e9 73 ff ff ff       	jmp    c0107a38 <_malloc_trim_r+0x58>
c0107ac5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

c0107ad0 <_free_r>:
c0107ad0:	55                   	push   %ebp
c0107ad1:	89 e5                	mov    %esp,%ebp
c0107ad3:	57                   	push   %edi
c0107ad4:	56                   	push   %esi
c0107ad5:	53                   	push   %ebx
c0107ad6:	83 ec 1c             	sub    $0x1c,%esp
c0107ad9:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107adc:	8b 45 08             	mov    0x8(%ebp),%eax
c0107adf:	85 f6                	test   %esi,%esi
c0107ae1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107ae4:	0f 84 fe 00 00 00    	je     c0107be8 <_free_r+0x118>
c0107aea:	89 04 24             	mov    %eax,(%esp)
c0107aed:	e8 ee de ff ff       	call   c01059e0 <__malloc_lock>
c0107af2:	8b 7e fc             	mov    -0x4(%esi),%edi
c0107af5:	8d 56 f8             	lea    -0x8(%esi),%edx
c0107af8:	89 f8                	mov    %edi,%eax
c0107afa:	83 e0 fe             	and    $0xfffffffe,%eax
c0107afd:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
c0107b00:	8b 59 04             	mov    0x4(%ecx),%ebx
c0107b03:	83 e3 fc             	and    $0xfffffffc,%ebx
c0107b06:	39 0d 88 b8 10 c0    	cmp    %ecx,0xc010b888
c0107b0c:	0f 84 0e 01 00 00    	je     c0107c20 <_free_r+0x150>
c0107b12:	83 e7 01             	and    $0x1,%edi
c0107b15:	89 59 04             	mov    %ebx,0x4(%ecx)
c0107b18:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107b1f:	75 1f                	jne    c0107b40 <_free_r+0x70>
c0107b21:	8b 76 f8             	mov    -0x8(%esi),%esi
c0107b24:	29 f2                	sub    %esi,%edx
c0107b26:	01 f0                	add    %esi,%eax
c0107b28:	8b 72 08             	mov    0x8(%edx),%esi
c0107b2b:	81 fe 88 b8 10 c0    	cmp    $0xc010b888,%esi
c0107b31:	0f 84 39 01 00 00    	je     c0107c70 <_free_r+0x1a0>
c0107b37:	8b 7a 0c             	mov    0xc(%edx),%edi
c0107b3a:	89 7e 0c             	mov    %edi,0xc(%esi)
c0107b3d:	89 77 08             	mov    %esi,0x8(%edi)
c0107b40:	f6 44 19 04 01       	testb  $0x1,0x4(%ecx,%ebx,1)
c0107b45:	75 21                	jne    c0107b68 <_free_r+0x98>
c0107b47:	8b 75 e0             	mov    -0x20(%ebp),%esi
c0107b4a:	01 d8                	add    %ebx,%eax
c0107b4c:	8b 59 08             	mov    0x8(%ecx),%ebx
c0107b4f:	85 f6                	test   %esi,%esi
c0107b51:	75 0c                	jne    c0107b5f <_free_r+0x8f>
c0107b53:	81 fb 88 b8 10 c0    	cmp    $0xc010b888,%ebx
c0107b59:	0f 84 21 01 00 00    	je     c0107c80 <_free_r+0x1b0>
c0107b5f:	8b 49 0c             	mov    0xc(%ecx),%ecx
c0107b62:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0107b65:	89 59 08             	mov    %ebx,0x8(%ecx)
c0107b68:	89 c1                	mov    %eax,%ecx
c0107b6a:	83 c9 01             	or     $0x1,%ecx
c0107b6d:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107b70:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107b73:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107b76:	85 c9                	test   %ecx,%ecx
c0107b78:	75 56                	jne    c0107bd0 <_free_r+0x100>
c0107b7a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0107b7f:	76 6f                	jbe    c0107bf0 <_free_r+0x120>
c0107b81:	89 c1                	mov    %eax,%ecx
c0107b83:	c1 e9 09             	shr    $0x9,%ecx
c0107b86:	83 f9 04             	cmp    $0x4,%ecx
c0107b89:	0f 87 21 01 00 00    	ja     c0107cb0 <_free_r+0x1e0>
c0107b8f:	89 c1                	mov    %eax,%ecx
c0107b91:	c1 e9 06             	shr    $0x6,%ecx
c0107b94:	83 c1 38             	add    $0x38,%ecx
c0107b97:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107b9a:	8d 34 9d 80 b8 10 c0 	lea    -0x3fef4780(,%ebx,4),%esi
c0107ba1:	8b 5e 08             	mov    0x8(%esi),%ebx
c0107ba4:	39 f3                	cmp    %esi,%ebx
c0107ba6:	0f 84 14 01 00 00    	je     c0107cc0 <_free_r+0x1f0>
c0107bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107bb0:	8b 4b 04             	mov    0x4(%ebx),%ecx
c0107bb3:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107bb6:	39 c8                	cmp    %ecx,%eax
c0107bb8:	73 07                	jae    c0107bc1 <_free_r+0xf1>
c0107bba:	8b 5b 08             	mov    0x8(%ebx),%ebx
c0107bbd:	39 de                	cmp    %ebx,%esi
c0107bbf:	75 ef                	jne    c0107bb0 <_free_r+0xe0>
c0107bc1:	8b 43 0c             	mov    0xc(%ebx),%eax
c0107bc4:	89 42 0c             	mov    %eax,0xc(%edx)
c0107bc7:	89 5a 08             	mov    %ebx,0x8(%edx)
c0107bca:	89 50 08             	mov    %edx,0x8(%eax)
c0107bcd:	89 53 0c             	mov    %edx,0xc(%ebx)
c0107bd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107bd3:	89 45 08             	mov    %eax,0x8(%ebp)
c0107bd6:	83 c4 1c             	add    $0x1c,%esp
c0107bd9:	5b                   	pop    %ebx
c0107bda:	5e                   	pop    %esi
c0107bdb:	5f                   	pop    %edi
c0107bdc:	5d                   	pop    %ebp
c0107bdd:	e9 0e de ff ff       	jmp    c01059f0 <__malloc_unlock>
c0107be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107be8:	83 c4 1c             	add    $0x1c,%esp
c0107beb:	5b                   	pop    %ebx
c0107bec:	5e                   	pop    %esi
c0107bed:	5f                   	pop    %edi
c0107bee:	5d                   	pop    %ebp
c0107bef:	c3                   	ret    
c0107bf0:	c1 e8 03             	shr    $0x3,%eax
c0107bf3:	bb 01 00 00 00       	mov    $0x1,%ebx
c0107bf8:	89 c1                	mov    %eax,%ecx
c0107bfa:	c1 f9 02             	sar    $0x2,%ecx
c0107bfd:	8d 04 c5 80 b8 10 c0 	lea    -0x3fef4780(,%eax,8),%eax
c0107c04:	d3 e3                	shl    %cl,%ebx
c0107c06:	8b 48 08             	mov    0x8(%eax),%ecx
c0107c09:	09 1d 84 b8 10 c0    	or     %ebx,0xc010b884
c0107c0f:	89 42 0c             	mov    %eax,0xc(%edx)
c0107c12:	89 4a 08             	mov    %ecx,0x8(%edx)
c0107c15:	89 50 08             	mov    %edx,0x8(%eax)
c0107c18:	89 51 0c             	mov    %edx,0xc(%ecx)
c0107c1b:	eb b3                	jmp    c0107bd0 <_free_r+0x100>
c0107c1d:	8d 76 00             	lea    0x0(%esi),%esi
c0107c20:	01 d8                	add    %ebx,%eax
c0107c22:	83 e7 01             	and    $0x1,%edi
c0107c25:	75 13                	jne    c0107c3a <_free_r+0x16a>
c0107c27:	8b 4e f8             	mov    -0x8(%esi),%ecx
c0107c2a:	29 ca                	sub    %ecx,%edx
c0107c2c:	01 c8                	add    %ecx,%eax
c0107c2e:	8b 5a 08             	mov    0x8(%edx),%ebx
c0107c31:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0107c34:	89 4b 0c             	mov    %ecx,0xc(%ebx)
c0107c37:	89 59 08             	mov    %ebx,0x8(%ecx)
c0107c3a:	89 c1                	mov    %eax,%ecx
c0107c3c:	83 c9 01             	or     $0x1,%ecx
c0107c3f:	3b 05 64 b8 10 c0    	cmp    0xc010b864,%eax
c0107c45:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107c48:	89 15 88 b8 10 c0    	mov    %edx,0xc010b888
c0107c4e:	72 80                	jb     c0107bd0 <_free_r+0x100>
c0107c50:	a1 90 35 16 c0       	mov    0xc0163590,%eax
c0107c55:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107c59:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107c5c:	89 04 24             	mov    %eax,(%esp)
c0107c5f:	e8 7c fd ff ff       	call   c01079e0 <_malloc_trim_r>
c0107c64:	e9 67 ff ff ff       	jmp    c0107bd0 <_free_r+0x100>
c0107c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107c70:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0107c77:	e9 c4 fe ff ff       	jmp    c0107b40 <_free_r+0x70>
c0107c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107c80:	89 c1                	mov    %eax,%ecx
c0107c82:	83 c9 01             	or     $0x1,%ecx
c0107c85:	89 15 94 b8 10 c0    	mov    %edx,0xc010b894
c0107c8b:	89 15 90 b8 10 c0    	mov    %edx,0xc010b890
c0107c91:	c7 42 0c 88 b8 10 c0 	movl   $0xc010b888,0xc(%edx)
c0107c98:	c7 42 08 88 b8 10 c0 	movl   $0xc010b888,0x8(%edx)
c0107c9f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0107ca2:	89 04 02             	mov    %eax,(%edx,%eax,1)
c0107ca5:	e9 26 ff ff ff       	jmp    c0107bd0 <_free_r+0x100>
c0107caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0107cb0:	83 f9 14             	cmp    $0x14,%ecx
c0107cb3:	77 23                	ja     c0107cd8 <_free_r+0x208>
c0107cb5:	83 c1 5b             	add    $0x5b,%ecx
c0107cb8:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107cbb:	e9 da fe ff ff       	jmp    c0107b9a <_free_r+0xca>
c0107cc0:	c1 f9 02             	sar    $0x2,%ecx
c0107cc3:	b8 01 00 00 00       	mov    $0x1,%eax
c0107cc8:	d3 e0                	shl    %cl,%eax
c0107cca:	09 05 84 b8 10 c0    	or     %eax,0xc010b884
c0107cd0:	89 d8                	mov    %ebx,%eax
c0107cd2:	e9 ed fe ff ff       	jmp    c0107bc4 <_free_r+0xf4>
c0107cd7:	90                   	nop
c0107cd8:	83 f9 54             	cmp    $0x54,%ecx
c0107cdb:	77 10                	ja     c0107ced <_free_r+0x21d>
c0107cdd:	89 c1                	mov    %eax,%ecx
c0107cdf:	c1 e9 0c             	shr    $0xc,%ecx
c0107ce2:	83 c1 6e             	add    $0x6e,%ecx
c0107ce5:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107ce8:	e9 ad fe ff ff       	jmp    c0107b9a <_free_r+0xca>
c0107ced:	81 f9 54 01 00 00    	cmp    $0x154,%ecx
c0107cf3:	77 10                	ja     c0107d05 <_free_r+0x235>
c0107cf5:	89 c1                	mov    %eax,%ecx
c0107cf7:	c1 e9 0f             	shr    $0xf,%ecx
c0107cfa:	83 c1 77             	add    $0x77,%ecx
c0107cfd:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107d00:	e9 95 fe ff ff       	jmp    c0107b9a <_free_r+0xca>
c0107d05:	81 f9 54 05 00 00    	cmp    $0x554,%ecx
c0107d0b:	77 10                	ja     c0107d1d <_free_r+0x24d>
c0107d0d:	89 c1                	mov    %eax,%ecx
c0107d0f:	c1 e9 12             	shr    $0x12,%ecx
c0107d12:	83 c1 7c             	add    $0x7c,%ecx
c0107d15:	8d 1c 09             	lea    (%ecx,%ecx,1),%ebx
c0107d18:	e9 7d fe ff ff       	jmp    c0107b9a <_free_r+0xca>
c0107d1d:	bb fc 00 00 00       	mov    $0xfc,%ebx
c0107d22:	b9 7e 00 00 00       	mov    $0x7e,%ecx
c0107d27:	e9 6e fe ff ff       	jmp    c0107b9a <_free_r+0xca>
c0107d2c:	66 90                	xchg   %ax,%ax
c0107d2e:	66 90                	xchg   %ax,%ax

c0107d30 <memmove>:
c0107d30:	55                   	push   %ebp
c0107d31:	89 e5                	mov    %esp,%ebp
c0107d33:	56                   	push   %esi
c0107d34:	57                   	push   %edi
c0107d35:	53                   	push   %ebx
c0107d36:	8b 7d 08             	mov    0x8(%ebp),%edi
c0107d39:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0107d3c:	8b 75 0c             	mov    0xc(%ebp),%esi
c0107d3f:	fc                   	cld    
c0107d40:	39 fe                	cmp    %edi,%esi
c0107d42:	73 43                	jae    c0107d87 <memmove+0x57>
c0107d44:	8d 5c 31 ff          	lea    -0x1(%ecx,%esi,1),%ebx
c0107d48:	39 df                	cmp    %ebx,%edi
c0107d4a:	77 3b                	ja     c0107d87 <memmove+0x57>
c0107d4c:	01 ce                	add    %ecx,%esi
c0107d4e:	01 cf                	add    %ecx,%edi
c0107d50:	fd                   	std    
c0107d51:	83 f9 08             	cmp    $0x8,%ecx
c0107d54:	76 2b                	jbe    c0107d81 <memmove+0x51>
c0107d56:	89 fa                	mov    %edi,%edx
c0107d58:	89 cb                	mov    %ecx,%ebx
c0107d5a:	83 e2 03             	and    $0x3,%edx
c0107d5d:	74 0c                	je     c0107d6b <memmove+0x3b>
c0107d5f:	89 d1                	mov    %edx,%ecx
c0107d61:	4e                   	dec    %esi
c0107d62:	4f                   	dec    %edi
c0107d63:	29 cb                	sub    %ecx,%ebx
c0107d65:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107d67:	89 d9                	mov    %ebx,%ecx
c0107d69:	46                   	inc    %esi
c0107d6a:	47                   	inc    %edi
c0107d6b:	c1 e9 02             	shr    $0x2,%ecx
c0107d6e:	83 ee 04             	sub    $0x4,%esi
c0107d71:	83 ef 04             	sub    $0x4,%edi
c0107d74:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107d76:	83 c6 04             	add    $0x4,%esi
c0107d79:	83 c7 04             	add    $0x4,%edi
c0107d7c:	89 d9                	mov    %ebx,%ecx
c0107d7e:	83 e1 03             	and    $0x3,%ecx
c0107d81:	4e                   	dec    %esi
c0107d82:	4f                   	dec    %edi
c0107d83:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107d85:	eb 2a                	jmp    c0107db1 <memmove+0x81>
c0107d87:	83 f9 08             	cmp    $0x8,%ecx
c0107d8a:	76 23                	jbe    c0107daf <memmove+0x7f>
c0107d8c:	89 fa                	mov    %edi,%edx
c0107d8e:	89 cb                	mov    %ecx,%ebx
c0107d90:	83 e2 03             	and    $0x3,%edx
c0107d93:	74 10                	je     c0107da5 <memmove+0x75>
c0107d95:	b9 04 00 00 00       	mov    $0x4,%ecx
c0107d9a:	29 d1                	sub    %edx,%ecx
c0107d9c:	83 e1 03             	and    $0x3,%ecx
c0107d9f:	29 cb                	sub    %ecx,%ebx
c0107da1:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107da3:	89 d9                	mov    %ebx,%ecx
c0107da5:	c1 e9 02             	shr    $0x2,%ecx
c0107da8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107daa:	89 d9                	mov    %ebx,%ecx
c0107dac:	83 e1 03             	and    $0x3,%ecx
c0107daf:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0107db1:	8b 45 08             	mov    0x8(%ebp),%eax
c0107db4:	fc                   	cld    
c0107db5:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107db8:	5b                   	pop    %ebx
c0107db9:	5f                   	pop    %edi
c0107dba:	5e                   	pop    %esi
c0107dbb:	c9                   	leave  
c0107dbc:	c3                   	ret    
c0107dbd:	66 90                	xchg   %ax,%ax
c0107dbf:	90                   	nop

c0107dc0 <_realloc_r>:
c0107dc0:	55                   	push   %ebp
c0107dc1:	89 e5                	mov    %esp,%ebp
c0107dc3:	57                   	push   %edi
c0107dc4:	56                   	push   %esi
c0107dc5:	53                   	push   %ebx
c0107dc6:	83 ec 3c             	sub    $0x3c,%esp
c0107dc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0107dcc:	8b 7d 0c             	mov    0xc(%ebp),%edi
c0107dcf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107dd2:	8b 45 10             	mov    0x10(%ebp),%eax
c0107dd5:	85 ff                	test   %edi,%edi
c0107dd7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107dda:	0f 84 50 02 00 00    	je     c0108030 <_realloc_r+0x270>
c0107de0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107de3:	8d 77 f8             	lea    -0x8(%edi),%esi
c0107de6:	89 04 24             	mov    %eax,(%esp)
c0107de9:	e8 f2 db ff ff       	call   c01059e0 <__malloc_lock>
c0107dee:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107df1:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107df4:	89 c3                	mov    %eax,%ebx
c0107df6:	8d 51 0b             	lea    0xb(%ecx),%edx
c0107df9:	83 e3 fc             	and    $0xfffffffc,%ebx
c0107dfc:	83 fa 16             	cmp    $0x16,%edx
c0107dff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107e02:	0f 87 00 01 00 00    	ja     c0107f08 <_realloc_r+0x148>
c0107e08:	31 d2                	xor    %edx,%edx
c0107e0a:	c7 45 d8 10 00 00 00 	movl   $0x10,-0x28(%ebp)
c0107e11:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0107e18:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107e1b:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
c0107e1e:	0f 82 1c 02 00 00    	jb     c0108040 <_realloc_r+0x280>
c0107e24:	84 d2                	test   %dl,%dl
c0107e26:	0f 85 14 02 00 00    	jne    c0108040 <_realloc_r+0x280>
c0107e2c:	3b 5d d8             	cmp    -0x28(%ebp),%ebx
c0107e2f:	0f 8d eb 00 00 00    	jge    c0107f20 <_realloc_r+0x160>
c0107e35:	8b 0d 88 b8 10 c0    	mov    0xc010b888,%ecx
c0107e3b:	8d 14 1e             	lea    (%esi,%ebx,1),%edx
c0107e3e:	39 d1                	cmp    %edx,%ecx
c0107e40:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c0107e43:	0f 84 6f 02 00 00    	je     c01080b8 <_realloc_r+0x2f8>
c0107e49:	8b 4a 04             	mov    0x4(%edx),%ecx
c0107e4c:	89 c8                	mov    %ecx,%eax
c0107e4e:	83 e0 fe             	and    $0xfffffffe,%eax
c0107e51:	f6 44 02 04 01       	testb  $0x1,0x4(%edx,%eax,1)
c0107e56:	0f 84 f4 00 00 00    	je     c0107f50 <_realloc_r+0x190>
c0107e5c:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
c0107e63:	31 d2                	xor    %edx,%edx
c0107e65:	f6 45 d4 01          	testb  $0x1,-0x2c(%ebp)
c0107e69:	0f 85 39 01 00 00    	jne    c0107fa8 <_realloc_r+0x1e8>
c0107e6f:	89 f1                	mov    %esi,%ecx
c0107e71:	2b 4f f8             	sub    -0x8(%edi),%ecx
c0107e74:	8b 41 04             	mov    0x4(%ecx),%eax
c0107e77:	83 e0 fc             	and    $0xfffffffc,%eax
c0107e7a:	85 d2                	test   %edx,%edx
c0107e7c:	0f 84 f6 02 00 00    	je     c0108178 <_realloc_r+0x3b8>
c0107e82:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0107e85:	0f 84 f5 02 00 00    	je     c0108180 <_realloc_r+0x3c0>
c0107e8b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0107e8e:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0107e91:	01 d8                	add    %ebx,%eax
c0107e93:	01 c2                	add    %eax,%edx
c0107e95:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0107e98:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0107e9b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0107e9e:	0f 8c ac 01 00 00    	jl     c0108050 <_realloc_r+0x290>
c0107ea4:	8b 42 0c             	mov    0xc(%edx),%eax
c0107ea7:	83 eb 04             	sub    $0x4,%ebx
c0107eaa:	8b 52 08             	mov    0x8(%edx),%edx
c0107ead:	83 fb 24             	cmp    $0x24,%ebx
c0107eb0:	8d 71 08             	lea    0x8(%ecx),%esi
c0107eb3:	89 42 0c             	mov    %eax,0xc(%edx)
c0107eb6:	89 50 08             	mov    %edx,0x8(%eax)
c0107eb9:	8b 41 0c             	mov    0xc(%ecx),%eax
c0107ebc:	8b 51 08             	mov    0x8(%ecx),%edx
c0107ebf:	89 42 0c             	mov    %eax,0xc(%edx)
c0107ec2:	89 50 08             	mov    %edx,0x8(%eax)
c0107ec5:	0f 87 85 03 00 00    	ja     c0108250 <_realloc_r+0x490>
c0107ecb:	83 fb 13             	cmp    $0x13,%ebx
c0107ece:	89 f0                	mov    %esi,%eax
c0107ed0:	76 1a                	jbe    c0107eec <_realloc_r+0x12c>
c0107ed2:	8b 07                	mov    (%edi),%eax
c0107ed4:	83 fb 1b             	cmp    $0x1b,%ebx
c0107ed7:	89 41 08             	mov    %eax,0x8(%ecx)
c0107eda:	8b 47 04             	mov    0x4(%edi),%eax
c0107edd:	89 41 0c             	mov    %eax,0xc(%ecx)
c0107ee0:	0f 87 8f 03 00 00    	ja     c0108275 <_realloc_r+0x4b5>
c0107ee6:	8d 41 10             	lea    0x10(%ecx),%eax
c0107ee9:	83 c7 08             	add    $0x8,%edi
c0107eec:	8b 17                	mov    (%edi),%edx
c0107eee:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c0107ef1:	89 10                	mov    %edx,(%eax)
c0107ef3:	8b 57 04             	mov    0x4(%edi),%edx
c0107ef6:	89 50 04             	mov    %edx,0x4(%eax)
c0107ef9:	8b 57 08             	mov    0x8(%edi),%edx
c0107efc:	89 f7                	mov    %esi,%edi
c0107efe:	89 ce                	mov    %ecx,%esi
c0107f00:	89 50 08             	mov    %edx,0x8(%eax)
c0107f03:	8b 41 04             	mov    0x4(%ecx),%eax
c0107f06:	eb 1b                	jmp    c0107f23 <_realloc_r+0x163>
c0107f08:	83 e2 f8             	and    $0xfffffff8,%edx
c0107f0b:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0107f0e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0107f11:	c1 ea 1f             	shr    $0x1f,%edx
c0107f14:	e9 ff fe ff ff       	jmp    c0107e18 <_realloc_r+0x58>
c0107f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c0107f20:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0107f23:	89 da                	mov    %ebx,%edx
c0107f25:	2b 55 dc             	sub    -0x24(%ebp),%edx
c0107f28:	83 fa 0f             	cmp    $0xf,%edx
c0107f2b:	77 4b                	ja     c0107f78 <_realloc_r+0x1b8>
c0107f2d:	83 e0 01             	and    $0x1,%eax
c0107f30:	09 d8                	or     %ebx,%eax
c0107f32:	89 46 04             	mov    %eax,0x4(%esi)
c0107f35:	83 4c 1e 04 01       	orl    $0x1,0x4(%esi,%ebx,1)
c0107f3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107f3d:	89 04 24             	mov    %eax,(%esp)
c0107f40:	e8 ab da ff ff       	call   c01059f0 <__malloc_unlock>
c0107f45:	89 f8                	mov    %edi,%eax
c0107f47:	83 c4 3c             	add    $0x3c,%esp
c0107f4a:	5b                   	pop    %ebx
c0107f4b:	5e                   	pop    %esi
c0107f4c:	5f                   	pop    %edi
c0107f4d:	5d                   	pop    %ebp
c0107f4e:	c3                   	ret    
c0107f4f:	90                   	nop
c0107f50:	83 e1 fc             	and    $0xfffffffc,%ecx
c0107f53:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c0107f56:	01 d9                	add    %ebx,%ecx
c0107f58:	3b 4d d8             	cmp    -0x28(%ebp),%ecx
c0107f5b:	0f 8c 04 ff ff ff    	jl     c0107e65 <_realloc_r+0xa5>
c0107f61:	8b 5a 0c             	mov    0xc(%edx),%ebx
c0107f64:	8b 52 08             	mov    0x8(%edx),%edx
c0107f67:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0107f6a:	89 5a 0c             	mov    %ebx,0xc(%edx)
c0107f6d:	89 53 08             	mov    %edx,0x8(%ebx)
c0107f70:	89 cb                	mov    %ecx,%ebx
c0107f72:	eb af                	jmp    c0107f23 <_realloc_r+0x163>
c0107f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0107f78:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c0107f7b:	83 e0 01             	and    $0x1,%eax
c0107f7e:	09 d8                	or     %ebx,%eax
c0107f80:	89 46 04             	mov    %eax,0x4(%esi)
c0107f83:	89 d0                	mov    %edx,%eax
c0107f85:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
c0107f88:	83 c8 01             	or     $0x1,%eax
c0107f8b:	89 41 04             	mov    %eax,0x4(%ecx)
c0107f8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107f91:	83 4c 11 04 01       	orl    $0x1,0x4(%ecx,%edx,1)
c0107f96:	83 c1 08             	add    $0x8,%ecx
c0107f99:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0107f9d:	89 04 24             	mov    %eax,(%esp)
c0107fa0:	e8 2b fb ff ff       	call   c0107ad0 <_free_r>
c0107fa5:	eb 93                	jmp    c0107f3a <_realloc_r+0x17a>
c0107fa7:	90                   	nop
c0107fa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107fab:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107faf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107fb2:	89 04 24             	mov    %eax,(%esp)
c0107fb5:	e8 46 d2 ff ff       	call   c0105200 <_malloc_r>
c0107fba:	85 c0                	test   %eax,%eax
c0107fbc:	89 c1                	mov    %eax,%ecx
c0107fbe:	0f 84 65 03 00 00    	je     c0108329 <_realloc_r+0x569>
c0107fc4:	8b 47 fc             	mov    -0x4(%edi),%eax
c0107fc7:	8d 51 f8             	lea    -0x8(%ecx),%edx
c0107fca:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0107fcd:	89 c2                	mov    %eax,%edx
c0107fcf:	83 e2 fe             	and    $0xfffffffe,%edx
c0107fd2:	01 f2                	add    %esi,%edx
c0107fd4:	39 55 e0             	cmp    %edx,-0x20(%ebp)
c0107fd7:	0f 84 63 02 00 00    	je     c0108240 <_realloc_r+0x480>
c0107fdd:	83 eb 04             	sub    $0x4,%ebx
c0107fe0:	83 fb 24             	cmp    $0x24,%ebx
c0107fe3:	0f 87 6f 01 00 00    	ja     c0108158 <_realloc_r+0x398>
c0107fe9:	83 fb 13             	cmp    $0x13,%ebx
c0107fec:	0f 87 ee 00 00 00    	ja     c01080e0 <_realloc_r+0x320>
c0107ff2:	89 c8                	mov    %ecx,%eax
c0107ff4:	89 fa                	mov    %edi,%edx
c0107ff6:	8b 1a                	mov    (%edx),%ebx
c0107ff8:	89 18                	mov    %ebx,(%eax)
c0107ffa:	8b 5a 04             	mov    0x4(%edx),%ebx
c0107ffd:	89 58 04             	mov    %ebx,0x4(%eax)
c0108000:	8b 52 08             	mov    0x8(%edx),%edx
c0108003:	89 50 08             	mov    %edx,0x8(%eax)
c0108006:	8b 75 e4             	mov    -0x1c(%ebp),%esi
c0108009:	89 7c 24 04          	mov    %edi,0x4(%esp)
c010800d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108010:	89 34 24             	mov    %esi,(%esp)
c0108013:	e8 b8 fa ff ff       	call   c0107ad0 <_free_r>
c0108018:	89 34 24             	mov    %esi,(%esp)
c010801b:	e8 d0 d9 ff ff       	call   c01059f0 <__malloc_unlock>
c0108020:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108023:	83 c4 3c             	add    $0x3c,%esp
c0108026:	5b                   	pop    %ebx
c0108027:	5e                   	pop    %esi
c0108028:	5f                   	pop    %edi
c0108029:	89 c8                	mov    %ecx,%eax
c010802b:	5d                   	pop    %ebp
c010802c:	c3                   	ret    
c010802d:	8d 76 00             	lea    0x0(%esi),%esi
c0108030:	89 45 0c             	mov    %eax,0xc(%ebp)
c0108033:	83 c4 3c             	add    $0x3c,%esp
c0108036:	5b                   	pop    %ebx
c0108037:	5e                   	pop    %esi
c0108038:	5f                   	pop    %edi
c0108039:	5d                   	pop    %ebp
c010803a:	e9 c1 d1 ff ff       	jmp    c0105200 <_malloc_r>
c010803f:	90                   	nop
c0108040:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108043:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
c0108049:	31 c0                	xor    %eax,%eax
c010804b:	e9 f7 fe ff ff       	jmp    c0107f47 <_realloc_r+0x187>
c0108050:	89 c2                	mov    %eax,%edx
c0108052:	3b 55 d8             	cmp    -0x28(%ebp),%edx
c0108055:	0f 8c 4d ff ff ff    	jl     c0107fa8 <_realloc_r+0x1e8>
c010805b:	8b 71 08             	mov    0x8(%ecx),%esi
c010805e:	83 eb 04             	sub    $0x4,%ebx
c0108061:	8b 41 0c             	mov    0xc(%ecx),%eax
c0108064:	83 fb 24             	cmp    $0x24,%ebx
c0108067:	89 46 0c             	mov    %eax,0xc(%esi)
c010806a:	89 70 08             	mov    %esi,0x8(%eax)
c010806d:	8d 71 08             	lea    0x8(%ecx),%esi
c0108070:	0f 87 88 00 00 00    	ja     c01080fe <_realloc_r+0x33e>
c0108076:	83 fb 13             	cmp    $0x13,%ebx
c0108079:	89 f0                	mov    %esi,%eax
c010807b:	76 1a                	jbe    c0108097 <_realloc_r+0x2d7>
c010807d:	8b 07                	mov    (%edi),%eax
c010807f:	83 fb 1b             	cmp    $0x1b,%ebx
c0108082:	89 41 08             	mov    %eax,0x8(%ecx)
c0108085:	8b 47 04             	mov    0x4(%edi),%eax
c0108088:	89 41 0c             	mov    %eax,0xc(%ecx)
c010808b:	0f 87 17 02 00 00    	ja     c01082a8 <_realloc_r+0x4e8>
c0108091:	8d 41 10             	lea    0x10(%ecx),%eax
c0108094:	83 c7 08             	add    $0x8,%edi
c0108097:	8b 1f                	mov    (%edi),%ebx
c0108099:	89 18                	mov    %ebx,(%eax)
c010809b:	8b 5f 04             	mov    0x4(%edi),%ebx
c010809e:	89 58 04             	mov    %ebx,0x4(%eax)
c01080a1:	8b 5f 08             	mov    0x8(%edi),%ebx
c01080a4:	89 f7                	mov    %esi,%edi
c01080a6:	89 ce                	mov    %ecx,%esi
c01080a8:	89 58 08             	mov    %ebx,0x8(%eax)
c01080ab:	89 d3                	mov    %edx,%ebx
c01080ad:	8b 41 04             	mov    0x4(%ecx),%eax
c01080b0:	e9 6e fe ff ff       	jmp    c0107f23 <_realloc_r+0x163>
c01080b5:	8d 76 00             	lea    0x0(%esi),%esi
c01080b8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01080bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01080be:	8b 48 04             	mov    0x4(%eax),%ecx
c01080c1:	83 c2 10             	add    $0x10,%edx
c01080c4:	89 4d d0             	mov    %ecx,-0x30(%ebp)
c01080c7:	83 65 d0 fc          	andl   $0xfffffffc,-0x30(%ebp)
c01080cb:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c01080ce:	01 d9                	add    %ebx,%ecx
c01080d0:	39 d1                	cmp    %edx,%ecx
c01080d2:	7d 54                	jge    c0108128 <_realloc_r+0x368>
c01080d4:	89 c2                	mov    %eax,%edx
c01080d6:	e9 8a fd ff ff       	jmp    c0107e65 <_realloc_r+0xa5>
c01080db:	90                   	nop
c01080dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01080e0:	8b 07                	mov    (%edi),%eax
c01080e2:	83 fb 1b             	cmp    $0x1b,%ebx
c01080e5:	89 01                	mov    %eax,(%ecx)
c01080e7:	8b 47 04             	mov    0x4(%edi),%eax
c01080ea:	89 41 04             	mov    %eax,0x4(%ecx)
c01080ed:	0f 87 2d 01 00 00    	ja     c0108220 <_realloc_r+0x460>
c01080f3:	8d 41 08             	lea    0x8(%ecx),%eax
c01080f6:	8d 57 08             	lea    0x8(%edi),%edx
c01080f9:	e9 f8 fe ff ff       	jmp    c0107ff6 <_realloc_r+0x236>
c01080fe:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0108102:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0108106:	89 f7                	mov    %esi,%edi
c0108108:	89 34 24             	mov    %esi,(%esp)
c010810b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010810e:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108111:	e8 1a fc ff ff       	call   c0107d30 <memmove>
c0108116:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108119:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010811c:	8b 41 04             	mov    0x4(%ecx),%eax
c010811f:	89 ce                	mov    %ecx,%esi
c0108121:	89 d3                	mov    %edx,%ebx
c0108123:	e9 fb fd ff ff       	jmp    c0107f23 <_realloc_r+0x163>
c0108128:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c010812b:	29 d9                	sub    %ebx,%ecx
c010812d:	01 de                	add    %ebx,%esi
c010812f:	83 c9 01             	or     $0x1,%ecx
c0108132:	89 35 88 b8 10 c0    	mov    %esi,0xc010b888
c0108138:	89 4e 04             	mov    %ecx,0x4(%esi)
c010813b:	8b 47 fc             	mov    -0x4(%edi),%eax
c010813e:	83 e0 01             	and    $0x1,%eax
c0108141:	09 d8                	or     %ebx,%eax
c0108143:	89 47 fc             	mov    %eax,-0x4(%edi)
c0108146:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108149:	89 04 24             	mov    %eax,(%esp)
c010814c:	e8 9f d8 ff ff       	call   c01059f0 <__malloc_unlock>
c0108151:	89 f8                	mov    %edi,%eax
c0108153:	e9 ef fd ff ff       	jmp    c0107f47 <_realloc_r+0x187>
c0108158:	89 0c 24             	mov    %ecx,(%esp)
c010815b:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010815f:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0108163:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108166:	e8 c5 fb ff ff       	call   c0107d30 <memmove>
c010816b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010816e:	e9 93 fe ff ff       	jmp    c0108006 <_realloc_r+0x246>
c0108173:	90                   	nop
c0108174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0108178:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c010817b:	e9 d2 fe ff ff       	jmp    c0108052 <_realloc_r+0x292>
c0108180:	8d 14 18             	lea    (%eax,%ebx,1),%edx
c0108183:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108186:	01 d0                	add    %edx,%eax
c0108188:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010818b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010818e:	83 c0 10             	add    $0x10,%eax
c0108191:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0108194:	0f 8c b8 fe ff ff    	jl     c0108052 <_realloc_r+0x292>
c010819a:	8b 41 0c             	mov    0xc(%ecx),%eax
c010819d:	83 eb 04             	sub    $0x4,%ebx
c01081a0:	8b 51 08             	mov    0x8(%ecx),%edx
c01081a3:	83 fb 24             	cmp    $0x24,%ebx
c01081a6:	8d 71 08             	lea    0x8(%ecx),%esi
c01081a9:	89 42 0c             	mov    %eax,0xc(%edx)
c01081ac:	89 50 08             	mov    %edx,0x8(%eax)
c01081af:	0f 87 3d 01 00 00    	ja     c01082f2 <_realloc_r+0x532>
c01081b5:	83 fb 13             	cmp    $0x13,%ebx
c01081b8:	89 f0                	mov    %esi,%eax
c01081ba:	76 1a                	jbe    c01081d6 <_realloc_r+0x416>
c01081bc:	8b 07                	mov    (%edi),%eax
c01081be:	83 fb 1b             	cmp    $0x1b,%ebx
c01081c1:	89 41 08             	mov    %eax,0x8(%ecx)
c01081c4:	8b 47 04             	mov    0x4(%edi),%eax
c01081c7:	89 41 0c             	mov    %eax,0xc(%ecx)
c01081ca:	0f 87 3d 01 00 00    	ja     c010830d <_realloc_r+0x54d>
c01081d0:	8d 41 10             	lea    0x10(%ecx),%eax
c01081d3:	83 c7 08             	add    $0x8,%edi
c01081d6:	8b 17                	mov    (%edi),%edx
c01081d8:	89 10                	mov    %edx,(%eax)
c01081da:	8b 57 04             	mov    0x4(%edi),%edx
c01081dd:	89 50 04             	mov    %edx,0x4(%eax)
c01081e0:	8b 57 08             	mov    0x8(%edi),%edx
c01081e3:	89 50 08             	mov    %edx,0x8(%eax)
c01081e6:	8b 5d dc             	mov    -0x24(%ebp),%ebx
c01081e9:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c01081ec:	89 d8                	mov    %ebx,%eax
c01081ee:	29 df                	sub    %ebx,%edi
c01081f0:	01 c8                	add    %ecx,%eax
c01081f2:	83 cf 01             	or     $0x1,%edi
c01081f5:	a3 88 b8 10 c0       	mov    %eax,0xc010b888
c01081fa:	89 78 04             	mov    %edi,0x4(%eax)
c01081fd:	8b 41 04             	mov    0x4(%ecx),%eax
c0108200:	83 e0 01             	and    $0x1,%eax
c0108203:	09 d8                	or     %ebx,%eax
c0108205:	89 41 04             	mov    %eax,0x4(%ecx)
c0108208:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010820b:	89 04 24             	mov    %eax,(%esp)
c010820e:	e8 dd d7 ff ff       	call   c01059f0 <__malloc_unlock>
c0108213:	89 f0                	mov    %esi,%eax
c0108215:	e9 2d fd ff ff       	jmp    c0107f47 <_realloc_r+0x187>
c010821a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
c0108220:	8b 47 08             	mov    0x8(%edi),%eax
c0108223:	83 fb 24             	cmp    $0x24,%ebx
c0108226:	89 41 08             	mov    %eax,0x8(%ecx)
c0108229:	8b 47 0c             	mov    0xc(%edi),%eax
c010822c:	89 41 0c             	mov    %eax,0xc(%ecx)
c010822f:	74 60                	je     c0108291 <_realloc_r+0x4d1>
c0108231:	8d 41 10             	lea    0x10(%ecx),%eax
c0108234:	8d 57 10             	lea    0x10(%edi),%edx
c0108237:	e9 ba fd ff ff       	jmp    c0107ff6 <_realloc_r+0x236>
c010823c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c0108240:	8b 51 fc             	mov    -0x4(%ecx),%edx
c0108243:	83 e2 fc             	and    $0xfffffffc,%edx
c0108246:	01 d3                	add    %edx,%ebx
c0108248:	e9 d6 fc ff ff       	jmp    c0107f23 <_realloc_r+0x163>
c010824d:	8d 76 00             	lea    0x0(%esi),%esi
c0108250:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c0108254:	89 7c 24 04          	mov    %edi,0x4(%esp)
c0108258:	89 f7                	mov    %esi,%edi
c010825a:	89 34 24             	mov    %esi,(%esp)
c010825d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108260:	e8 cb fa ff ff       	call   c0107d30 <memmove>
c0108265:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108268:	8b 5d d0             	mov    -0x30(%ebp),%ebx
c010826b:	8b 41 04             	mov    0x4(%ecx),%eax
c010826e:	89 ce                	mov    %ecx,%esi
c0108270:	e9 ae fc ff ff       	jmp    c0107f23 <_realloc_r+0x163>
c0108275:	8b 47 08             	mov    0x8(%edi),%eax
c0108278:	83 fb 24             	cmp    $0x24,%ebx
c010827b:	89 41 10             	mov    %eax,0x10(%ecx)
c010827e:	8b 47 0c             	mov    0xc(%edi),%eax
c0108281:	89 41 14             	mov    %eax,0x14(%ecx)
c0108284:	74 3e                	je     c01082c4 <_realloc_r+0x504>
c0108286:	8d 41 18             	lea    0x18(%ecx),%eax
c0108289:	83 c7 10             	add    $0x10,%edi
c010828c:	e9 5b fc ff ff       	jmp    c0107eec <_realloc_r+0x12c>
c0108291:	8b 47 10             	mov    0x10(%edi),%eax
c0108294:	8d 57 18             	lea    0x18(%edi),%edx
c0108297:	89 41 10             	mov    %eax,0x10(%ecx)
c010829a:	8b 5f 14             	mov    0x14(%edi),%ebx
c010829d:	8d 41 18             	lea    0x18(%ecx),%eax
c01082a0:	89 59 14             	mov    %ebx,0x14(%ecx)
c01082a3:	e9 4e fd ff ff       	jmp    c0107ff6 <_realloc_r+0x236>
c01082a8:	8b 47 08             	mov    0x8(%edi),%eax
c01082ab:	83 fb 24             	cmp    $0x24,%ebx
c01082ae:	89 41 10             	mov    %eax,0x10(%ecx)
c01082b1:	8b 47 0c             	mov    0xc(%edi),%eax
c01082b4:	89 41 14             	mov    %eax,0x14(%ecx)
c01082b7:	74 22                	je     c01082db <_realloc_r+0x51b>
c01082b9:	8d 41 18             	lea    0x18(%ecx),%eax
c01082bc:	83 c7 10             	add    $0x10,%edi
c01082bf:	e9 d3 fd ff ff       	jmp    c0108097 <_realloc_r+0x2d7>
c01082c4:	8b 47 10             	mov    0x10(%edi),%eax
c01082c7:	83 c7 18             	add    $0x18,%edi
c01082ca:	89 41 18             	mov    %eax,0x18(%ecx)
c01082cd:	8b 57 fc             	mov    -0x4(%edi),%edx
c01082d0:	8d 41 20             	lea    0x20(%ecx),%eax
c01082d3:	89 51 1c             	mov    %edx,0x1c(%ecx)
c01082d6:	e9 11 fc ff ff       	jmp    c0107eec <_realloc_r+0x12c>
c01082db:	8b 47 10             	mov    0x10(%edi),%eax
c01082de:	83 c7 18             	add    $0x18,%edi
c01082e1:	89 41 18             	mov    %eax,0x18(%ecx)
c01082e4:	8b 5f fc             	mov    -0x4(%edi),%ebx
c01082e7:	8d 41 20             	lea    0x20(%ecx),%eax
c01082ea:	89 59 1c             	mov    %ebx,0x1c(%ecx)
c01082ed:	e9 a5 fd ff ff       	jmp    c0108097 <_realloc_r+0x2d7>
c01082f2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c01082f6:	89 7c 24 04          	mov    %edi,0x4(%esp)
c01082fa:	89 34 24             	mov    %esi,(%esp)
c01082fd:	89 4d e0             	mov    %ecx,-0x20(%ebp)
c0108300:	e8 2b fa ff ff       	call   c0107d30 <memmove>
c0108305:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108308:	e9 d9 fe ff ff       	jmp    c01081e6 <_realloc_r+0x426>
c010830d:	8b 47 08             	mov    0x8(%edi),%eax
c0108310:	83 fb 24             	cmp    $0x24,%ebx
c0108313:	89 41 10             	mov    %eax,0x10(%ecx)
c0108316:	8b 47 0c             	mov    0xc(%edi),%eax
c0108319:	89 41 14             	mov    %eax,0x14(%ecx)
c010831c:	74 1d                	je     c010833b <_realloc_r+0x57b>
c010831e:	8d 41 18             	lea    0x18(%ecx),%eax
c0108321:	83 c7 10             	add    $0x10,%edi
c0108324:	e9 ad fe ff ff       	jmp    c01081d6 <_realloc_r+0x416>
c0108329:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010832c:	89 04 24             	mov    %eax,(%esp)
c010832f:	e8 bc d6 ff ff       	call   c01059f0 <__malloc_unlock>
c0108334:	31 c0                	xor    %eax,%eax
c0108336:	e9 0c fc ff ff       	jmp    c0107f47 <_realloc_r+0x187>
c010833b:	8b 47 10             	mov    0x10(%edi),%eax
c010833e:	83 c7 18             	add    $0x18,%edi
c0108341:	89 41 18             	mov    %eax,0x18(%ecx)
c0108344:	8b 57 fc             	mov    -0x4(%edi),%edx
c0108347:	8d 41 20             	lea    0x20(%ecx),%eax
c010834a:	89 51 1c             	mov    %edx,0x1c(%ecx)
c010834d:	e9 84 fe ff ff       	jmp    c01081d6 <_realloc_r+0x416>
c0108352:	66 90                	xchg   %ax,%ax
c0108354:	66 90                	xchg   %ax,%ax
c0108356:	66 90                	xchg   %ax,%ax
c0108358:	66 90                	xchg   %ax,%ax
c010835a:	66 90                	xchg   %ax,%ax
c010835c:	66 90                	xchg   %ax,%ax
c010835e:	66 90                	xchg   %ax,%ax

c0108360 <cleanup_glue>:
c0108360:	55                   	push   %ebp
c0108361:	89 e5                	mov    %esp,%ebp
c0108363:	56                   	push   %esi
c0108364:	53                   	push   %ebx
c0108365:	83 ec 10             	sub    $0x10,%esp
c0108368:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010836b:	8b 75 08             	mov    0x8(%ebp),%esi
c010836e:	8b 03                	mov    (%ebx),%eax
c0108370:	85 c0                	test   %eax,%eax
c0108372:	74 0c                	je     c0108380 <cleanup_glue+0x20>
c0108374:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108378:	89 34 24             	mov    %esi,(%esp)
c010837b:	e8 e0 ff ff ff       	call   c0108360 <cleanup_glue>
c0108380:	89 5d 0c             	mov    %ebx,0xc(%ebp)
c0108383:	89 75 08             	mov    %esi,0x8(%ebp)
c0108386:	83 c4 10             	add    $0x10,%esp
c0108389:	5b                   	pop    %ebx
c010838a:	5e                   	pop    %esi
c010838b:	5d                   	pop    %ebp
c010838c:	e9 3f f7 ff ff       	jmp    c0107ad0 <_free_r>
c0108391:	eb 0d                	jmp    c01083a0 <_reclaim_reent>
c0108393:	90                   	nop
c0108394:	90                   	nop
c0108395:	90                   	nop
c0108396:	90                   	nop
c0108397:	90                   	nop
c0108398:	90                   	nop
c0108399:	90                   	nop
c010839a:	90                   	nop
c010839b:	90                   	nop
c010839c:	90                   	nop
c010839d:	90                   	nop
c010839e:	90                   	nop
c010839f:	90                   	nop

c01083a0 <_reclaim_reent>:
c01083a0:	55                   	push   %ebp
c01083a1:	89 e5                	mov    %esp,%ebp
c01083a3:	57                   	push   %edi
c01083a4:	56                   	push   %esi
c01083a5:	53                   	push   %ebx
c01083a6:	83 ec 1c             	sub    $0x1c,%esp
c01083a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
c01083ac:	3b 1d 80 b3 10 c0    	cmp    0xc010b380,%ebx
c01083b2:	0f 84 a6 00 00 00    	je     c010845e <_reclaim_reent+0xbe>
c01083b8:	8b 53 4c             	mov    0x4c(%ebx),%edx
c01083bb:	85 d2                	test   %edx,%edx
c01083bd:	74 46                	je     c0108405 <_reclaim_reent+0x65>
c01083bf:	31 c0                	xor    %eax,%eax
c01083c1:	31 f6                	xor    %esi,%esi
c01083c3:	90                   	nop
c01083c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
c01083c8:	8b 04 82             	mov    (%edx,%eax,4),%eax
c01083cb:	85 c0                	test   %eax,%eax
c01083cd:	75 0b                	jne    c01083da <_reclaim_reent+0x3a>
c01083cf:	eb 1e                	jmp    c01083ef <_reclaim_reent+0x4f>
c01083d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
c01083d8:	89 f8                	mov    %edi,%eax
c01083da:	8b 38                	mov    (%eax),%edi
c01083dc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01083e0:	89 1c 24             	mov    %ebx,(%esp)
c01083e3:	e8 e8 f6 ff ff       	call   c0107ad0 <_free_r>
c01083e8:	85 ff                	test   %edi,%edi
c01083ea:	75 ec                	jne    c01083d8 <_reclaim_reent+0x38>
c01083ec:	8b 53 4c             	mov    0x4c(%ebx),%edx
c01083ef:	83 c6 01             	add    $0x1,%esi
c01083f2:	83 fe 20             	cmp    $0x20,%esi
c01083f5:	89 f0                	mov    %esi,%eax
c01083f7:	75 cf                	jne    c01083c8 <_reclaim_reent+0x28>
c01083f9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01083fd:	89 1c 24             	mov    %ebx,(%esp)
c0108400:	e8 cb f6 ff ff       	call   c0107ad0 <_free_r>
c0108405:	8b 43 40             	mov    0x40(%ebx),%eax
c0108408:	85 c0                	test   %eax,%eax
c010840a:	74 0c                	je     c0108418 <_reclaim_reent+0x78>
c010840c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108410:	89 1c 24             	mov    %ebx,(%esp)
c0108413:	e8 b8 f6 ff ff       	call   c0107ad0 <_free_r>
c0108418:	8b 83 48 01 00 00    	mov    0x148(%ebx),%eax
c010841e:	85 c0                	test   %eax,%eax
c0108420:	74 22                	je     c0108444 <_reclaim_reent+0xa4>
c0108422:	8d b3 4c 01 00 00    	lea    0x14c(%ebx),%esi
c0108428:	39 f0                	cmp    %esi,%eax
c010842a:	75 06                	jne    c0108432 <_reclaim_reent+0x92>
c010842c:	eb 16                	jmp    c0108444 <_reclaim_reent+0xa4>
c010842e:	66 90                	xchg   %ax,%ax
c0108430:	89 f8                	mov    %edi,%eax
c0108432:	8b 38                	mov    (%eax),%edi
c0108434:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108438:	89 1c 24             	mov    %ebx,(%esp)
c010843b:	e8 90 f6 ff ff       	call   c0107ad0 <_free_r>
c0108440:	39 fe                	cmp    %edi,%esi
c0108442:	75 ec                	jne    c0108430 <_reclaim_reent+0x90>
c0108444:	8b 43 54             	mov    0x54(%ebx),%eax
c0108447:	85 c0                	test   %eax,%eax
c0108449:	74 0c                	je     c0108457 <_reclaim_reent+0xb7>
c010844b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010844f:	89 1c 24             	mov    %ebx,(%esp)
c0108452:	e8 79 f6 ff ff       	call   c0107ad0 <_free_r>
c0108457:	8b 43 38             	mov    0x38(%ebx),%eax
c010845a:	85 c0                	test   %eax,%eax
c010845c:	75 08                	jne    c0108466 <_reclaim_reent+0xc6>
c010845e:	83 c4 1c             	add    $0x1c,%esp
c0108461:	5b                   	pop    %ebx
c0108462:	5e                   	pop    %esi
c0108463:	5f                   	pop    %edi
c0108464:	5d                   	pop    %ebp
c0108465:	c3                   	ret    
c0108466:	89 1c 24             	mov    %ebx,(%esp)
c0108469:	ff 53 3c             	call   *0x3c(%ebx)
c010846c:	8b 83 e0 02 00 00    	mov    0x2e0(%ebx),%eax
c0108472:	85 c0                	test   %eax,%eax
c0108474:	74 e8                	je     c010845e <_reclaim_reent+0xbe>
c0108476:	89 1c 24             	mov    %ebx,(%esp)
c0108479:	89 44 24 04          	mov    %eax,0x4(%esp)
c010847d:	e8 de fe ff ff       	call   c0108360 <cleanup_glue>
c0108482:	83 c4 1c             	add    $0x1c,%esp
c0108485:	5b                   	pop    %ebx
c0108486:	5e                   	pop    %esi
c0108487:	5f                   	pop    %edi
c0108488:	5d                   	pop    %ebp
c0108489:	c3                   	ret    
