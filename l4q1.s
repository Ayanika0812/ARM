	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=unpacked
	LDR R1,[R0]
	LDR R2,=packed_RESULT
	MOV R6,#32
	
	
up	LDRB R4,[R1],#1
	LDRB R5,[R1],#1
	LSL R5,#4
	ORR R5,R4
	STRB R5,[R2],#1
	SUB R6,#1
	
	CMP R3,R6
	BNE up
STOP
	B STOP
	
unpacked DCD 01020304

	AREA mydata, DATA, READWRITE
packed_RESULT DCB 0
	END
	