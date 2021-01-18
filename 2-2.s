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
	ADD R5, R5, R6
	SW C(R4), R5			; C[i] = A[i] + B[i]
	
	ADDI R4, R4, 4			; i = i + 4
	J L_ENTER_FOR
	
L_EXIT_FOR:

	; Halt
	TRAP 0