	.text
	.file	"CON72.c"
	.globl	assignToThisCore12
	.p2align	4, 0x90
	.type	assignToThisCore12,@function
assignToThisCore12:                     # @assignToThisCore12
	.cfi_startproc
# BB#0:
	vxorps	%ymm0, %ymm0, %ymm0
	vmovups	%ymm0, mask+96(%rip)
	vmovups	%ymm0, mask+64(%rip)
	vmovups	%ymm0, mask+32(%rip)
	vmovups	%ymm0, mask(%rip)
	cmpl	$1023, %edi             # imm = 0x3FF
	ja	.LBB0_2
# BB#1:
	movslq	%edi, %rcx
	movl	$1, %eax
	shlq	%cl, %rax
	shrq	$6, %rcx
	orq	%rax, mask(,%rcx,8)
.LBB0_2:
	cmpl	$1023, %esi             # imm = 0x3FF
	ja	.LBB0_4
# BB#3:
	movslq	%esi, %rcx
	movl	$1, %eax
	shlq	%cl, %rax
	shrq	$6, %rcx
	orq	%rax, mask(,%rcx,8)
.LBB0_4:
	xorl	%edi, %edi
	movl	$128, %esi
	movl	$mask, %edx
	vzeroupper
	jmp	sched_setaffinity       # TAILCALL
.Lfunc_end0:
	.size	assignToThisCore12, .Lfunc_end0-assignToThisCore12
	.cfi_endproc

	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_0:
	.quad	4593527504729830064     # double 0.123
	.text
	.globl	assignMatrixf32
	.p2align	4, 0x90
	.type	assignMatrixf32,@function
assignMatrixf32:                        # @assignMatrixf32
	.cfi_startproc
# BB#0:
	xorl	%r8d, %r8d
	vmovsd	.LCPI1_0(%rip), %xmm0   # xmm0 = mem[0],zero
	.p2align	4, 0x90
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r11d, %ecx
	imull	%r8d, %ecx
	movq	%r11, %r9
	orq	$1, %r9
	movl	%r8d, %eax
	cltd
	idivl	%r9d
	addl	%ecx, %eax
	cltq
	imulq	$274877907, %rax, %rcx  # imm = 0x10624DD3
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$38, %rcx
	addl	%edx, %ecx
	imull	$1000, %ecx, %ecx       # imm = 0x3E8
	subl	%ecx, %eax
	vcvtsi2sdl	%eax, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	movq	%r8, %rcx
	shlq	$12, %rcx
	movl	%r9d, %r10d
	imull	%r8d, %r10d
	addq	%rdi, %rcx
	vmovss	%xmm1, (%rcx,%r11,4)
	addq	$2, %r11
	movl	%r8d, %eax
	cltd
	idivl	%r11d
	addl	%r10d, %eax
	cltq
	imulq	$274877907, %rax, %rdx  # imm = 0x10624DD3
	movq	%rdx, %rsi
	shrq	$63, %rsi
	sarq	$38, %rdx
	addl	%esi, %edx
	imull	$1000, %edx, %edx       # imm = 0x3E8
	subl	%edx, %eax
	vcvtsi2sdl	%eax, %xmm2, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmovss	%xmm1, (%rcx,%r9,4)
	cmpq	$1024, %r11             # imm = 0x400
	jne	.LBB1_2
# BB#3:                                 #   in Loop: Header=BB1_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8              # imm = 0x400
	jne	.LBB1_1
# BB#4:
	retq
.Lfunc_end1:
	.size	assignMatrixf32, .Lfunc_end1-assignMatrixf32
	.cfi_endproc

	.globl	assignMatrixi32
	.p2align	4, 0x90
	.type	assignMatrixi32,@function
assignMatrixi32:                        # @assignMatrixi32
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Lcfi1:
	.cfi_def_cfa_offset 24
.Lcfi2:
	.cfi_offset %rbx, -24
.Lcfi3:
	.cfi_offset %rbp, -16
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB2_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_2 Depth 2
	xorl	%r11d, %r11d
	.p2align	4, 0x90
.LBB2_2:                                #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r11, %rdx
	imulq	%r8, %rdx
	movslq	%edx, %rsi
	imulq	$274877907, %rsi, %rdx  # imm = 0x10624DD3
	movq	%rdx, %rax
	shrq	$63, %rax
	sarq	$38, %rdx
	addl	%eax, %edx
	imull	$1000, %edx, %eax       # imm = 0x3E8
	subl	%eax, %esi
	movq	%r8, %rdx
	shlq	$12, %rdx
	addq	%rdi, %rdx
	movl	%esi, (%rdx,%r11,4)
	movq	%r11, %r9
	orq	$1, %r9
	movq	%r9, %rax
	imulq	%r8, %rax
	movslq	%eax, %r10
	imulq	$274877907, %r10, %rsi  # imm = 0x10624DD3
	movq	%rsi, %rax
	shrq	$63, %rax
	sarq	$38, %rsi
	addl	%eax, %esi
	imull	$1000, %esi, %ebp       # imm = 0x3E8
	movq	%r11, %rcx
	orq	$2, %rcx
	movq	%rcx, %rsi
	imulq	%r8, %rsi
	movslq	%esi, %rsi
	imulq	$274877907, %rsi, %rbx  # imm = 0x10624DD3
	movq	%rbx, %rax
	shrq	$63, %rax
	sarq	$38, %rbx
	addl	%eax, %ebx
	imull	$1000, %ebx, %eax       # imm = 0x3E8
	subl	%ebp, %r10d
	movl	%r10d, (%rdx,%r9,4)
	subl	%eax, %esi
	movl	%esi, (%rdx,%rcx,4)
	movq	%r11, %rax
	orq	$3, %rax
	movq	%rax, %rcx
	imulq	%r8, %rcx
	movslq	%ecx, %rcx
	imulq	$274877907, %rcx, %rsi  # imm = 0x10624DD3
	movq	%rsi, %rbp
	shrq	$63, %rbp
	sarq	$38, %rsi
	addl	%ebp, %esi
	imull	$1000, %esi, %esi       # imm = 0x3E8
	subl	%esi, %ecx
	movl	%ecx, (%rdx,%rax,4)
	addq	$4, %r11
	cmpq	$1024, %r11             # imm = 0x400
	jne	.LBB2_2
# BB#3:                                 #   in Loop: Header=BB2_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8              # imm = 0x400
	jne	.LBB2_1
# BB#4:
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	assignMatrixi32, .Lfunc_end2-assignMatrixi32
	.cfi_endproc

	.globl	assignMatrixi16
	.p2align	4, 0x90
	.type	assignMatrixi16,@function
assignMatrixi16:                        # @assignMatrixi16
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi4:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi5:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi6:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi7:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Lcfi8:
	.cfi_def_cfa_offset 48
.Lcfi9:
	.cfi_offset %rbx, -40
.Lcfi10:
	.cfi_offset %r14, -32
.Lcfi11:
	.cfi_offset %r15, -24
.Lcfi12:
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB3_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB3_2:                                #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, %ebp
	imull	%r15d, %ebp
	movl	%ebp, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%ebp, %eax
	andl	$65280, %eax            # imm = 0xFF00
	subl	%eax, %ebp
	callq	rand
	cltq
	imulq	$1717986919, %rax, %rcx # imm = 0x66666667
	movq	%rcx, %rdx
	shrq	$63, %rdx
	sarq	$34, %rcx
	addl	%edx, %ecx
	addl	%ecx, %ecx
	leal	(%rcx,%rcx,4), %ecx
	subl	%ecx, %eax
	addl	%ebp, %eax
	movq	%r15, %rcx
	shlq	$11, %rcx
	addq	%r14, %rcx
	movw	%ax, (%rcx,%rbx,2)
	addq	$1, %rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB3_2
# BB#3:                                 #   in Loop: Header=BB3_1 Depth=1
	addq	$1, %r15
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB3_1
# BB#4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end3:
	.size	assignMatrixi16, .Lfunc_end3-assignMatrixi16
	.cfi_endproc

	.globl	assignMatrixui16
	.p2align	4, 0x90
	.type	assignMatrixui16,@function
assignMatrixui16:                       # @assignMatrixui16
	.cfi_startproc
# BB#0:
	xorl	%r8d, %r8d
	.p2align	4, 0x90
.LBB4_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_2 Depth 2
	xorl	%r10d, %r10d
	.p2align	4, 0x90
.LBB4_2:                                #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r10d, %esi
	imull	%r8d, %esi
	movl	%esi, %edx
	sarl	$31, %edx
	shrl	$24, %edx
	addl	%esi, %edx
	andl	$65280, %edx            # imm = 0xFF00
	subl	%edx, %esi
	movq	%r8, %r11
	shlq	$11, %r11
	addq	%rdi, %r11
	movw	%si, (%r11,%r10,2)
	movq	%r10, %r9
	orq	$1, %r9
	movl	%r9d, %esi
	imull	%r8d, %esi
	movl	%esi, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%esi, %eax
	andl	$65280, %eax            # imm = 0xFF00
	movq	%r10, %rcx
	orq	$2, %rcx
	movl	%ecx, %edx
	imull	%r8d, %edx
	subl	%eax, %esi
	movw	%si, (%r11,%r9,2)
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%edx, %eax
	andl	$65280, %eax            # imm = 0xFF00
	subl	%eax, %edx
	movw	%dx, (%r11,%rcx,2)
	movq	%r10, %rax
	orq	$3, %rax
	movl	%eax, %ecx
	imull	%r8d, %ecx
	movl	%ecx, %edx
	sarl	$31, %edx
	shrl	$24, %edx
	addl	%ecx, %edx
	andl	$65280, %edx            # imm = 0xFF00
	subl	%edx, %ecx
	movw	%cx, (%r11,%rax,2)
	addq	$4, %r10
	cmpq	$1024, %r10             # imm = 0x400
	jne	.LBB4_2
# BB#3:                                 #   in Loop: Header=BB4_1 Depth=1
	addq	$1, %r8
	cmpq	$1024, %r8              # imm = 0x400
	jne	.LBB4_1
# BB#4:
	retq
.Lfunc_end4:
	.size	assignMatrixui16, .Lfunc_end4-assignMatrixui16
	.cfi_endproc

	.globl	assignMatrixi8
	.p2align	4, 0x90
	.type	assignMatrixi8,@function
assignMatrixi8:                         # @assignMatrixi8
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi13:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Lcfi14:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Lcfi15:
	.cfi_def_cfa_offset 32
	pushq	%rbx
.Lcfi16:
	.cfi_def_cfa_offset 40
	pushq	%rax
.Lcfi17:
	.cfi_def_cfa_offset 48
.Lcfi18:
	.cfi_offset %rbx, -40
.Lcfi19:
	.cfi_offset %r14, -32
.Lcfi20:
	.cfi_offset %r15, -24
.Lcfi21:
	.cfi_offset %rbp, -16
	movq	%rdi, %r14
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB5_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_2 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_2:                                #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, %ebp
	imull	%r15d, %ebp
	callq	rand
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$254, %ecx
	subl	%ecx, %eax
	addl	%ebp, %eax
	movq	%r15, %rcx
	shlq	$10, %rcx
	addq	%r14, %rcx
	movb	%al, (%rbx,%rcx)
	addq	$1, %rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB5_2
# BB#3:                                 #   in Loop: Header=BB5_1 Depth=1
	addq	$1, %r15
	cmpq	$1024, %r15             # imm = 0x400
	jne	.LBB5_1
# BB#4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	assignMatrixi8, .Lfunc_end5-assignMatrixi8
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI6_0:
	.quad	4                       # 0x4
	.quad	5                       # 0x5
	.quad	6                       # 0x6
	.quad	7                       # 0x7
.LCPI6_1:
	.quad	0                       # 0x0
	.quad	1                       # 0x1
	.quad	2                       # 0x2
	.quad	3                       # 0x3
.LCPI6_2:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	2                       # 0x2
	.long	3                       # 0x3
	.long	4                       # 0x4
	.long	5                       # 0x5
	.long	6                       # 0x6
	.long	7                       # 0x7
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2
.LCPI6_3:
	.long	274877907               # 0x10624dd3
.LCPI6_4:
	.long	1000                    # 0x3e8
.LCPI6_5:
	.long	8                       # 0x8
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI6_6:
	.quad	16                      # 0x10
	.text
	.globl	assignArrayi32
	.p2align	4, 0x90
	.type	assignArrayi32,@function
assignArrayi32:                         # @assignArrayi32
	.cfi_startproc
# BB#0:
	vmovdqa	.LCPI6_0(%rip), %ymm0   # ymm0 = [4,5,6,7]
	vmovdqa	.LCPI6_1(%rip), %ymm1   # ymm1 = [0,1,2,3]
	xorl	%eax, %eax
	vmovdqa	.LCPI6_2(%rip), %ymm8   # ymm8 = [0,1,2,3,4,5,6,7]
	vpbroadcastd	.LCPI6_3(%rip), %ymm3
	vpshufd	$245, %ymm3, %ymm4      # ymm4 = ymm3[1,1,3,3,5,5,7,7]
	vpbroadcastd	.LCPI6_4(%rip), %ymm5
	vpbroadcastd	.LCPI6_5(%rip), %ymm6
	vpbroadcastq	.LCPI6_6(%rip), %ymm7
	.p2align	4, 0x90
.LBB6_1:                                # =>This Inner Loop Header: Depth=1
	leal	1234(%rax), %ecx
	vmovd	%ecx, %xmm2
	vpbroadcastd	%xmm2, %ymm2
	vpaddd	%ymm8, %ymm2, %ymm2
	vpshufd	$232, %ymm1, %ymm9      # ymm9 = ymm1[0,2,2,3,4,6,6,7]
	vpermq	$232, %ymm9, %ymm9      # ymm9 = ymm9[0,2,2,3]
	vpshufd	$232, %ymm0, %ymm10     # ymm10 = ymm0[0,2,2,3,4,6,6,7]
	vpermq	$232, %ymm10, %ymm10    # ymm10 = ymm10[0,2,2,3]
	vinserti128	$1, %xmm10, %ymm9, %ymm9
	vpmulld	%ymm9, %ymm2, %ymm2
	vpshufd	$245, %ymm2, %ymm10     # ymm10 = ymm2[1,1,3,3,5,5,7,7]
	vpmuldq	%ymm4, %ymm10, %ymm10
	vpmuldq	%ymm3, %ymm2, %ymm11
	vpshufd	$245, %ymm11, %ymm11    # ymm11 = ymm11[1,1,3,3,5,5,7,7]
	vpblendd	$170, %ymm10, %ymm11, %ymm10 # ymm10 = ymm11[0],ymm10[1],ymm11[2],ymm10[3],ymm11[4],ymm10[5],ymm11[6],ymm10[7]
	vpsrld	$31, %ymm10, %ymm11
	vpsrad	$6, %ymm10, %ymm10
	vpaddd	%ymm11, %ymm10, %ymm10
	vpmulld	%ymm5, %ymm10, %ymm10
	vpsubd	%ymm10, %ymm2, %ymm2
	vmovdqu	%ymm2, (%rdi,%rax,4)
	leal	1242(%rax), %ecx
	vmovd	%ecx, %xmm2
	vpbroadcastd	%xmm2, %ymm2
	vpaddd	%ymm8, %ymm2, %ymm2
	vpaddd	%ymm6, %ymm9, %ymm9
	vpmulld	%ymm9, %ymm2, %ymm2
	vpshufd	$245, %ymm2, %ymm9      # ymm9 = ymm2[1,1,3,3,5,5,7,7]
	vpmuldq	%ymm4, %ymm9, %ymm9
	vpmuldq	%ymm3, %ymm2, %ymm10
	vpshufd	$245, %ymm10, %ymm10    # ymm10 = ymm10[1,1,3,3,5,5,7,7]
	vpblendd	$170, %ymm9, %ymm10, %ymm9 # ymm9 = ymm10[0],ymm9[1],ymm10[2],ymm9[3],ymm10[4],ymm9[5],ymm10[6],ymm9[7]
	vpsrld	$31, %ymm9, %ymm10
	vpsrad	$6, %ymm9, %ymm9
	vpaddd	%ymm10, %ymm9, %ymm9
	vpmulld	%ymm5, %ymm9, %ymm9
	vpsubd	%ymm9, %ymm2, %ymm2
	vmovdqu	%ymm2, 32(%rdi,%rax,4)
	addq	$16, %rax
	vpaddq	%ymm7, %ymm1, %ymm1
	vpaddq	%ymm7, %ymm0, %ymm0
	cmpq	$1048576, %rax          # imm = 0x100000
	jne	.LBB6_1
# BB#2:
	vzeroupper
	retq
.Lfunc_end6:
	.size	assignArrayi32, .Lfunc_end6-assignArrayi32
	.cfi_endproc

	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5
.LCPI7_0:
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.short	1                       # 0x1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI7_1:
	.quad	562958543486978         # 0x2000200020002
.LCPI7_2:
	.quad	9223231297218904063     # 0x7fff7fff7fff7fff
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%r14
.Lcfi22:
	.cfi_def_cfa_offset 16
	pushq	%rbx
.Lcfi23:
	.cfi_def_cfa_offset 24
	subq	$1480, %rsp             # imm = 0x5C8
.Lcfi24:
	.cfi_def_cfa_offset 1504
.Lcfi25:
	.cfi_offset %rbx, -24
.Lcfi26:
	.cfi_offset %r14, -16
	vxorps	%ymm0, %ymm0, %ymm0
	vmovups	%ymm0, mask+96(%rip)
	vmovups	%ymm0, mask+72(%rip)
	vmovups	%ymm0, mask+40(%rip)
	vmovups	%ymm0, mask+8(%rip)
	movq	$12, mask(%rip)
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	movl	$128, %esi
	movl	$mask, %edx
	vzeroupper
	callq	sched_setaffinity
	.p2align	4, 0x90
.LBB7_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB7_2:                                #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, %edx
	imull	%r14d, %edx
	movl	%edx, %ecx
	sarl	$31, %ecx
	shrl	$24, %ecx
	addl	%edx, %ecx
	andl	$65280, %ecx            # imm = 0xFF00
	subl	%ecx, %edx
	movq	%r14, %r8
	shlq	$11, %r8
	movw	%dx, input(%r8,%rbx,2)
	movq	%rbx, %rdx
	orq	$1, %rdx
	movl	%edx, %esi
	imull	%r14d, %esi
	movl	%esi, %edi
	sarl	$31, %edi
	shrl	$24, %edi
	addl	%esi, %edi
	andl	$65280, %edi            # imm = 0xFF00
	movq	%rbx, %rax
	orq	$2, %rax
	movl	%eax, %ecx
	imull	%r14d, %ecx
	subl	%edi, %esi
	movw	%si, input(%r8,%rdx,2)
	movl	%ecx, %edx
	sarl	$31, %edx
	shrl	$24, %edx
	addl	%ecx, %edx
	andl	$65280, %edx            # imm = 0xFF00
	subl	%edx, %ecx
	movw	%cx, input(%r8,%rax,2)
	movq	%rbx, %rax
	orq	$3, %rax
	movl	%eax, %ecx
	imull	%r14d, %ecx
	movl	%ecx, %edx
	sarl	$31, %edx
	shrl	$24, %edx
	addl	%ecx, %edx
	andl	$65280, %edx            # imm = 0xFF00
	subl	%edx, %ecx
	movw	%cx, input(%r8,%rax,2)
	addq	$4, %rbx
	cmpq	$1024, %rbx             # imm = 0x400
	jne	.LBB7_2
# BB#3:                                 #   in Loop: Header=BB7_1 Depth=1
	addq	$1, %r14
	cmpq	$1024, %r14             # imm = 0x400
	jne	.LBB7_1
# BB#4:
	vmovaps	.LCPI7_0(%rip), %ymm0   # ymm0 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	vmovaps	%ymm0, kernel(%rip)
	vmovaps	%ymm0, kernel+32(%rip)
	vmovaps	%ymm0, kernel+64(%rip)
	movw	$1, kernel+96(%rip)
	vbroadcastsd	.LCPI7_1(%rip), %ymm0
	vmovaps	%ymm0, Coffset_v(%rip)
	vpbroadcastq	.LCPI7_2(%rip), %ymm0
	vmovdqa	%ymm0, Cdiv_v(%rip)
	movq	$.L.str.1, programName(%rip)
	movq	$99999999, elapsed_rdtsc(%rip) # imm = 0x5F5E0FF
	movabsq	$19999999999, %rax      # imm = 0x4A817C7FF
	movq	%rax, overal_time(%rip)
	movq	$0, ttime(%rip)
	.p2align	4, 0x90
.LBB7_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_6 Depth 2
                                        #       Child Loop BB7_7 Depth 3
	#APP
	#mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm1
	#NO_APP
	rdtsc
	vpbroadcastw	kernel(%rip), %ymm6
	vpbroadcastw	kernel+2(%rip), %ymm7
	vpbroadcastw	kernel+4(%rip), %ymm8
	vpbroadcastw	kernel+6(%rip), %ymm0
	vmovdqu	%ymm0, 1440(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+8(%rip), %ymm0
	vmovdqu	%ymm0, 1408(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+10(%rip), %ymm0
	vmovdqu	%ymm0, 1376(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+12(%rip), %ymm0
	vmovdqu	%ymm0, 1344(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+14(%rip), %ymm0
	vmovdqu	%ymm0, 1312(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+16(%rip), %ymm0
	vmovdqu	%ymm0, 1280(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+18(%rip), %ymm0
	vmovdqu	%ymm0, 1248(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+20(%rip), %ymm0
	vmovdqu	%ymm0, 1216(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+22(%rip), %ymm0
	vmovdqu	%ymm0, 1184(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+24(%rip), %ymm0
	vmovdqu	%ymm0, 1152(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+26(%rip), %ymm0
	vmovdqu	%ymm0, 1120(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+28(%rip), %ymm0
	vmovdqu	%ymm0, 1088(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+30(%rip), %ymm0
	vmovdqu	%ymm0, 1056(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+32(%rip), %ymm0
	vmovdqu	%ymm0, 1024(%rsp)       # 32-byte Spill
	vpbroadcastw	kernel+34(%rip), %ymm0
	vmovdqu	%ymm0, 992(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+36(%rip), %ymm0
	vmovdqu	%ymm0, 960(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+38(%rip), %ymm0
	vmovdqu	%ymm0, 928(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+40(%rip), %ymm0
	vmovdqu	%ymm0, 896(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+42(%rip), %ymm0
	vmovdqu	%ymm0, 864(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+44(%rip), %ymm0
	vmovdqu	%ymm0, 832(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+46(%rip), %ymm0
	vmovdqu	%ymm0, 800(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+48(%rip), %ymm0
	vmovdqu	%ymm0, 768(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+50(%rip), %ymm0
	vmovdqu	%ymm0, 736(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+52(%rip), %ymm0
	vmovdqu	%ymm0, 704(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+54(%rip), %ymm0
	vmovdqu	%ymm0, 672(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+56(%rip), %ymm0
	vmovdqu	%ymm0, 640(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+58(%rip), %ymm0
	vmovdqu	%ymm0, 608(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+60(%rip), %ymm0
	vmovdqu	%ymm0, 576(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+62(%rip), %ymm0
	vmovdqu	%ymm0, 544(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+64(%rip), %ymm0
	vmovdqu	%ymm0, 512(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+66(%rip), %ymm0
	vmovdqu	%ymm0, 480(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+68(%rip), %ymm0
	vmovdqu	%ymm0, 448(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+70(%rip), %ymm0
	vmovdqu	%ymm0, 416(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+72(%rip), %ymm0
	vmovdqu	%ymm0, 384(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+74(%rip), %ymm0
	vmovdqu	%ymm0, 352(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+76(%rip), %ymm0
	vmovdqu	%ymm0, 320(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+78(%rip), %ymm0
	vmovdqu	%ymm0, 288(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+80(%rip), %ymm0
	vmovdqu	%ymm0, 256(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+82(%rip), %ymm0
	vmovdqu	%ymm0, 224(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+84(%rip), %ymm0
	vmovdqu	%ymm0, 192(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+86(%rip), %ymm0
	vmovdqu	%ymm0, 160(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+88(%rip), %ymm0
	vmovdqu	%ymm0, 128(%rsp)        # 32-byte Spill
	vpbroadcastw	kernel+90(%rip), %ymm0
	vmovdqu	%ymm0, 96(%rsp)         # 32-byte Spill
	shlq	$32, %rdx
	vpbroadcastw	kernel+92(%rip), %ymm0
	vmovdqu	%ymm0, 64(%rsp)         # 32-byte Spill
	orq	%rax, %rdx
	vpbroadcastw	kernel+94(%rip), %ymm0
	vmovdqu	%ymm0, 32(%rsp)         # 32-byte Spill
	movq	%rdx, t1_rdtsc(%rip)
	vpbroadcastw	kernel+96(%rip), %ymm0
	vmovdqu	%ymm0, (%rsp)           # 32-byte Spill
	xorl	%eax, %eax
	movl	$3, %ecx
	vmovdqa	Cdiv_v(%rip), %ymm15
	vmovdqa	Coffset_v(%rip), %ymm0
	.p2align	4, 0x90
.LBB7_6:                                #   Parent Loop BB7_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_7 Depth 3
	addq	$1, %rcx
	movq	%rax, %rdx
	movl	$3, %esi
	vmovdqu	224(%rsp), %ymm1        # 32-byte Reload
	vmovdqu	192(%rsp), %ymm2        # 32-byte Reload
	vmovdqu	160(%rsp), %ymm9        # 32-byte Reload
	vmovdqu	128(%rsp), %ymm10       # 32-byte Reload
	vmovdqu	96(%rsp), %ymm11        # 32-byte Reload
	vmovdqu	64(%rsp), %ymm12        # 32-byte Reload
	vmovdqu	32(%rsp), %ymm13        # 32-byte Reload
	vmovdqu	(%rsp), %ymm14          # 32-byte Reload
	.p2align	4, 0x90
.LBB7_7:                                #   Parent Loop BB7_5 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vpmullw	input(%rdx), %ymm6, %ymm3
	vpmullw	input+2(%rdx), %ymm7, %ymm4
	vpmullw	input+4(%rdx), %ymm8, %ymm5
	vpaddw	%ymm3, %ymm4, %ymm3
	vmovdqu	1440(%rsp), %ymm4       # 32-byte Reload
	vpmullw	input+6(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	1408(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+8(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	1376(%rsp), %ymm4       # 32-byte Reload
	vpmullw	input+10(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	1344(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+12(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	1312(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+2048(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	1280(%rsp), %ymm4       # 32-byte Reload
	vpmullw	input+2050(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	1248(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+2052(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	1216(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+2054(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	1184(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+2056(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	1152(%rsp), %ymm4       # 32-byte Reload
	vpmullw	input+2058(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	1120(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+2060(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	1088(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+4096(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	1056(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+4098(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	1024(%rsp), %ymm5       # 32-byte Reload
	vpmullw	input+4100(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	992(%rsp), %ymm4        # 32-byte Reload
	vpmullw	input+4102(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	960(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+4104(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	928(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+4106(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	896(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+4108(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	864(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+6144(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	832(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+6146(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	800(%rsp), %ymm4        # 32-byte Reload
	vpmullw	input+6148(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	768(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+6150(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	736(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+6152(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	704(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+6154(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	672(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+6156(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	640(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+8192(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	608(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+8194(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	576(%rsp), %ymm4        # 32-byte Reload
	vpmullw	input+8196(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	544(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+8198(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	512(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+8200(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	480(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+8202(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	448(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+8204(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	416(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+10240(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	384(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+10242(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	352(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+10244(%rdx), %ymm5, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vmovdqu	320(%rsp), %ymm4        # 32-byte Reload
	vpmullw	input+10246(%rdx), %ymm4, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vmovdqu	288(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+10248(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vmovdqu	256(%rsp), %ymm5        # 32-byte Reload
	vpmullw	input+10250(%rdx), %ymm5, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpmullw	input+10252(%rdx), %ymm1, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpmullw	input+18438(%rdx), %ymm2, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpmullw	input+18440(%rdx), %ymm9, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpmullw	input+18442(%rdx), %ymm10, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpmullw	input+18444(%rdx), %ymm11, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpmullw	input+18446(%rdx), %ymm12, %ymm5
	vpaddw	%ymm4, %ymm3, %ymm3
	vpmullw	input+18448(%rdx), %ymm13, %ymm4
	vpaddw	%ymm4, %ymm5, %ymm4
	vpmullw	input+18450(%rdx), %ymm14, %ymm5
	vpaddw	%ymm5, %ymm4, %ymm4
	vpaddw	%ymm4, %ymm3, %ymm3
	vpmulhrsw	%ymm15, %ymm3, %ymm3
	vpaddw	%ymm3, %ymm0, %ymm3
	vmovdqu	%ymm3, output+6150(%rdx)
	addq	$16, %rsi
	addq	$32, %rdx
	cmpq	$1021, %rsi             # imm = 0x3FD
	jl	.LBB7_7
# BB#8:                                 #   in Loop: Header=BB7_6 Depth=2
	addq	$2048, %rax             # imm = 0x800
	cmpq	$1021, %rcx             # imm = 0x3FD
	jne	.LBB7_6
# BB#9:                                 #   in Loop: Header=BB7_5 Depth=1
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, t2_rdtsc(%rip)
	#APP
	#mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm2
	#NO_APP
	movq	t2_rdtsc(%rip), %rax
	subq	t1_rdtsc(%rip), %rax
	movq	%rax, ttotal_rdtsc(%rip)
	movq	ttbest_rdtsc(%rip), %rsi
	cmpq	%rsi, %rax
	jge	.LBB7_11
# BB#10:                                #   in Loop: Header=BB7_5 Depth=1
	movq	%rax, ttbest_rdtsc(%rip)
	movq	elapsed_rdtsc(%rip), %rdi
	movl	$99999999, %ecx         # imm = 0x5F5E0FF
	subq	%rdi, %rcx
	movq	%rcx, elapsed(%rip)
	movq	%rax, %rsi
	jmp	.LBB7_12
	.p2align	4, 0x90
.LBB7_11:                               #   in Loop: Header=BB7_5 Depth=1
	movq	elapsed_rdtsc(%rip), %rdi
.LBB7_12:                               #   in Loop: Header=BB7_5 Depth=1
	addq	ttime(%rip), %rax
	movq	%rax, ttime(%rip)
	leaq	-1(%rdi), %rcx
	movq	%rcx, elapsed_rdtsc(%rip)
	testq	%rdi, %rdi
	je	.LBB7_14
# BB#13:                                #   in Loop: Header=BB7_5 Depth=1
	cmpq	overal_time(%rip), %rax
	jl	.LBB7_5
.LBB7_14:
	movq	elapsed(%rip), %rdx
	movl	$100000000, %ecx        # imm = 0x5F5E100
	subq	%rdi, %rcx
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	vzeroupper
	callq	printf
	movl	$.L.str.3, %edi
	movl	$.L.str.4, %esi
	callq	fopen
	movq	%rax, %rdi
	movq	%rdi, fileForSpeedups(%rip)
	movq	programName(%rip), %rdx
	movq	ttbest_rdtsc(%rip), %r9
	movl	$.L.str.5, %esi
	movl	$1024, %ecx             # imm = 0x400
	movl	$1024, %r8d             # imm = 0x400
	xorl	%eax, %eax
	callq	fprintf
	movzwl	output+1049600(%rip), %esi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	addq	$1480, %rsp             # imm = 0x5C8
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc

	.type	fileForSpeedups,@object # @fileForSpeedups
	.bss
	.globl	fileForSpeedups
	.p2align	3
fileForSpeedups:
	.quad	0
	.size	fileForSpeedups, 8

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	" "
	.size	.L.str, 2

	.type	programName,@object     # @programName
	.data
	.globl	programName
	.p2align	3
programName:
	.quad	.L.str
	.size	programName, 8

	.type	ttbest_rdtsc,@object    # @ttbest_rdtsc
	.globl	ttbest_rdtsc
	.p2align	3
ttbest_rdtsc:
	.quad	99999999999999999       # 0x16345785d89ffff
	.size	ttbest_rdtsc, 8

	.type	elapsed_rdtsc,@object   # @elapsed_rdtsc
	.globl	elapsed_rdtsc
	.p2align	3
elapsed_rdtsc:
	.quad	99999999                # 0x5f5e0ff
	.size	elapsed_rdtsc, 8

	.type	overal_time,@object     # @overal_time
	.globl	overal_time
	.p2align	3
overal_time:
	.quad	19999999999             # 0x4a817c7ff
	.size	overal_time, 8

	.type	ttime,@object           # @ttime
	.bss
	.globl	ttime
	.p2align	3
ttime:
	.quad	0                       # 0x0
	.size	ttime, 8

	.type	mask,@object            # @mask
	.comm	mask,128,8
	.type	input,@object           # @input
	.comm	input,2097152,32
	.type	kernel,@object          # @kernel
	.comm	kernel,98,32
	.type	Coffset_v,@object       # @Coffset_v
	.comm	Coffset_v,32,32
	.type	Cdiv_v,@object          # @Cdiv_v
	.comm	Cdiv_v,32,32
	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"CON72"
	.size	.L.str.1, 6

	.type	t1_rdtsc,@object        # @t1_rdtsc
	.comm	t1_rdtsc,8,8
	.type	output,@object          # @output
	.comm	output,2097152,32
	.type	t2_rdtsc,@object        # @t2_rdtsc
	.comm	t2_rdtsc,8,8
	.type	ttotal_rdtsc,@object    # @ttotal_rdtsc
	.comm	ttotal_rdtsc,8,8
	.type	elapsed,@object         # @elapsed
	.comm	elapsed,8,8
	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"\nthe best is %lld in %lldth iteration and %lld repetitions\n"
	.size	.L.str.2, 60

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"fileForSpeedups"
	.size	.L.str.3, 16

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"a"
	.size	.L.str.4, 2

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"%s, %dx%d, %lld\n"
	.size	.L.str.5, 17

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"\nThe  %d X matrix \n"
	.size	.L.str.6, 20

	.type	mask1,@object           # @mask1
	.comm	mask1,128,8
	.type	temp2i16,@object        # @temp2i16
	.comm	temp2i16,32,32

	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
