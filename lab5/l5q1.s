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
	LDR R0,=DST
L2  MOV R1,R0
	MOV R3,R0
	ADD R3,#4
	ADD R10,R9,#1
L1  LDR R4,[R3]
	LDR R7,[R1]
	CMP R4,R7
	BHS UP
	MOV R1,R3
UP  ADD R3,#4
	ADD R10,#1
	CMP R10,#5
	BNE L1
	LDR R2,[R0]
	LDR R6,[R1]
	STR R2,[R1]
	STR R6,[R0]
	ADD R0,#4
	ADD R9,#1
	CMP R9,#4
	BNE L2
	
HERE
	B HERE
	
	AREA mydata, DATA, READWRITE
DST DCD 9,8,7,6,5
	END