	.text
	.file	"CON71.c"
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
	shlq	$9, %rcx
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
	cmpq	$128, %r11
	jne	.LBB1_2
# BB#3:                                 #   in Loop: Header=BB1_1 Depth=1
	addq	$1, %r8
	cmpq	$128, %r8
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
	shlq	$9, %rdx
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
	cmpq	$128, %r11
	jne	.LBB2_2
# BB#3:                                 #   in Loop: Header=BB2_1 Depth=1
	addq	$1, %r8
	cmpq	$128, %r8
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
	shlq	$8, %rcx
	addq	%r14, %rcx
	movw	%ax, (%rcx,%rbx,2)
	addq	$1, %rbx
	cmpq	$128, %rbx
	jne	.LBB3_2
# BB#3:                                 #   in Loop: Header=BB3_1 Depth=1
	addq	$1, %r15
	cmpq	$128, %r15
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
	shlq	$8, %r11
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
	cmpq	$128, %r10
	jne	.LBB4_2
# BB#3:                                 #   in Loop: Header=BB4_1 Depth=1
	addq	$1, %r8
	cmpq	$128, %r8
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
	shlq	$7, %rcx
	addq	%r14, %rcx
	movb	%al, (%rbx,%rcx)
	addq	$1, %rbx
	cmpq	$128, %rbx
	jne	.LBB5_2
# BB#3:                                 #   in Loop: Header=BB5_1 Depth=1
	addq	$1, %r15
	cmpq	$128, %r15
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
	cmpq	$16384, %rax            # imm = 0x4000
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
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi22:
	.cfi_def_cfa_offset 16
	pushq	%r14
.Lcfi23:
	.cfi_def_cfa_offset 24
	pushq	%rbx
.Lcfi24:
	.cfi_def_cfa_offset 32
.Lcfi25:
	.cfi_offset %rbx, -32
.Lcfi26:
	.cfi_offset %r14, -24
.Lcfi27:
	.cfi_offset %rbp, -16
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
	shlq	$8, %r8
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
	cmpq	$128, %rbx
	jne	.LBB7_2
# BB#3:                                 #   in Loop: Header=BB7_1 Depth=1
	addq	$1, %r14
	cmpq	$128, %r14
	jne	.LBB7_1
# BB#4:
	vmovdqa	.LCPI7_0(%rip), %ymm0   # ymm0 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
	vmovdqa	%ymm0, kernel(%rip)
	vmovdqa	%ymm0, kernel+32(%rip)
	vmovdqa	%ymm0, kernel+64(%rip)
	movw	$1, kernel+96(%rip)
	movq	$.L.str.1, programName(%rip)
	movq	$9999999, elapsed_rdtsc(%rip) # imm = 0x98967F
	movabsq	$9999999999, %rax       # imm = 0x2540BE3FF
	movq	%rax, overal_time(%rip)
	movq	$0, ttime(%rip)
	.p2align	4, 0x90
.LBB7_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_6 Depth 2
                                        #       Child Loop BB7_7 Depth 3
                                        #         Child Loop BB7_8 Depth 4
	#APP
	#mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm1
	#NO_APP
	rdtsc
	shlq	$32, %rdx
	orq	%rax, %rdx
	movq	%rdx, t1_rdtsc(%rip)
	movl	$input+6, %r8d
	movl	$3, %r9d
	.p2align	4, 0x90
.LBB7_6:                                #   Parent Loop BB7_5 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB7_7 Depth 3
                                        #         Child Loop BB7_8 Depth 4
	movq	%r8, %r10
	movl	$3, %r11d
	.p2align	4, 0x90
.LBB7_7:                                #   Parent Loop BB7_5 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB7_8 Depth 4
	xorl	%edi, %edi
	movq	$-98, %rbx
	movq	%r10, %rdx
	.p2align	4, 0x90
.LBB7_8:                                #   Parent Loop BB7_5 Depth=1
                                        #     Parent Loop BB7_6 Depth=2
                                        #       Parent Loop BB7_7 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movswl	kernel+98(%rbx), %ecx
	movzwl	-6(%rdx), %eax
	imull	%ecx, %eax
	movswl	kernel+100(%rbx), %ecx
	movzwl	-4(%rdx), %esi
	imull	%ecx, %esi
	movswl	kernel+102(%rbx), %ecx
	movzwl	-2(%rdx), %ebp
	imull	%ecx, %ebp
	vpmovsxwd	kernel+104(%rbx), %xmm0
	vpmovzxwd	(%rdx), %xmm1   # xmm1 = mem[0],zero,mem[1],zero,mem[2],zero,mem[3],zero
	vpmulld	%xmm0, %xmm1, %xmm0
	vpshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %ecx
	addl	%ebp, %ecx
	addl	%esi, %ecx
	addl	%eax, %ecx
	addl	%ecx, %edi
	addq	$256, %rdx              # imm = 0x100
	addq	$14, %rbx
	jne	.LBB7_8
# BB#9:                                 #   in Loop: Header=BB7_7 Depth=3
	movslq	%edi, %rax
	imulq	$1402438301, %rax, %rax # imm = 0x5397829D
	movq	%rax, %rcx
	shrq	$36, %rcx
	shrq	$63, %rax
	leal	2(%rcx,%rax), %eax
	movq	%r9, %rcx
	shlq	$8, %rcx
	movw	%ax, output(%rcx,%r11,2)
	addq	$1, %r11
	addq	$2, %r10
	cmpq	$125, %r11
	jne	.LBB7_7
# BB#10:                                #   in Loop: Header=BB7_6 Depth=2
	addq	$1, %r9
	addq	$256, %r8               # imm = 0x100
	cmpq	$125, %r9
	jne	.LBB7_6
# BB#11:                                #   in Loop: Header=BB7_5 Depth=1
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
	jge	.LBB7_13
# BB#12:                                #   in Loop: Header=BB7_5 Depth=1
	movq	%rax, ttbest_rdtsc(%rip)
	movq	elapsed_rdtsc(%rip), %rdi
	movl	$9999999, %ecx          # imm = 0x98967F
	subq	%rdi, %rcx
	movq	%rcx, elapsed(%rip)
	movq	%rax, %rsi
	jmp	.LBB7_14
	.p2align	4, 0x90
.LBB7_13:                               #   in Loop: Header=BB7_5 Depth=1
	movq	elapsed_rdtsc(%rip), %rdi
.LBB7_14:                               #   in Loop: Header=BB7_5 Depth=1
	addq	ttime(%rip), %rax
	movq	%rax, ttime(%rip)
	leaq	-1(%rdi), %rcx
	movq	%rcx, elapsed_rdtsc(%rip)
	testq	%rdi, %rdi
	je	.LBB7_16
# BB#15:                                #   in Loop: Header=BB7_5 Depth=1
	cmpq	overal_time(%rip), %rax
	jl	.LBB7_5
.LBB7_16:
	movq	elapsed(%rip), %rdx
	movl	$10000000, %ecx         # imm = 0x989680
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
	movl	$128, %ecx
	movl	$128, %r8d
	xorl	%eax, %eax
	callq	fprintf
	movzwl	output+16512(%rip), %esi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
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
	.quad	9999999                 # 0x98967f
	.size	elapsed_rdtsc, 8

	.type	overal_time,@object     # @overal_time
	.globl	overal_time
	.p2align	3
overal_time:
	.quad	9999999999              # 0x2540be3ff
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
	.comm	input,32768,32
	.type	kernel,@object          # @kernel
	.comm	kernel,98,32
	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"CON71"
	.size	.L.str.1, 6

	.type	t1_rdtsc,@object        # @t1_rdtsc
	.comm	t1_rdtsc,8,8
	.type	output,@object          # @output
	.comm	output,32768,32
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

	.ident	"clang version 4.0.0 (tags/RELEASE_400/final)"
	.section	".note.GNU-stack","",@progbits
