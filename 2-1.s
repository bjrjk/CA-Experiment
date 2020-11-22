.data

	.align 8
	A:
	.double 5
	B:
	.double 6
	C:
	.double 7
	D:
	.double 0


.text 	
	; Calculate D = (A+B)*C + (A+C)*B + (B+C)*A + A+A + B+B + C+C

	; Load A,B,C
	LD F0, A
	LD F2, B
	LD F4, C
	
	; Clear D6
	MOVI2FP F6, R0
	MOVI2FP F7, R0
	
	; D8 = (A+B)*C
	ADDD F8, F0, F2
	MULTD F8, F8, F4
	
	; D6 += D8
	ADDD F6, F6, F8
	
	; D8 = (A+C)*B
	ADDD F8, F0, F4
	MULTD F8, F8, F2
	
	; D6 += D8
	ADDD F6, F6, F8
	
	; D8 = (B+C)*A
	ADDD F8, F2, F4
	MULTD F8, F8, F0
	
	; D6 += D8
	ADDD F6, F6, F8
	
	; D8 = A+A
	ADDD F8, F0, F0
	; D10 = B+B
	ADDD F10, F2, F2
	; D12 = C+C
	ADDD F12, F4, F4
	
	; D6 += D8
	ADDD F6, F6, F8
	; D10 += D12
	ADDD F10, F10, F12
	; D6 += D10
	ADDD F6, F6, F10
	
	; Store D
	SD D, F6
	
	; Halt
	TRAP 0
