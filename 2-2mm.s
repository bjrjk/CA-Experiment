.data

	.align 8
A:
	.word 0,1,2,3,4,5,6,7
B:
	.word 0,1,2,3,4,5,6,7
C:
	.word 0,0,0,0,0,0,0,0


.text 	
	; Calculate C[i]=A[i]+B[i]
	
	; R1=addr(A),R2=addr(B),R3=addr(C)
	LHI R1, (A>>16) & 0xFFFF  
    ADDUI R1, R1, A & 0xFFFF  
    LHI R2, (B>>16) & 0xFFFF  
    ADDUI R2, R2, B & 0xFFFF  
	LHI R3, (C>>16) & 0xFFFF  
    ADDUI R3, R3, C & 0xFFFF  

	; R4(i)=0
	ADD R4, R0, R0
	
L_ENTER_FOR:
	SLTI R5, R4, #32 		; R5 = R4 < 32
	BEQZ R5, L_EXIT_FOR		; R5 == 0 Branch
	
	LW R5, A(R4)
	LW R6, B(R4)
	LW R7, A+4(R4)
	LW R8, B+4(R4)
	ADD R5, R5, R6
	SW C(R4), R5
	LW R9, A+8(R4)
	LW R10, B+8(R4)	
	ADD R7, R7, R8
	SW C+4(R4), R7			
	LW R11, A+12(R4)
	LW R12, B+12(R4)
	ADD R9, R9, R10
	SW C+8(R4), R9			
	ADD R11, R11, R12
	SW C+12(R4), R11	
	
	ADDI R4, R4, 16			; i = i + 16
	
	J L_ENTER_FOR
	
L_EXIT_FOR:

	; Halt
	TRAP 0