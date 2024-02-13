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
		LDR R0,=1
		LDR R1,=5
		LDR R2,=4
		LDR R3,=2
		LDR R4,=6
		LDR R5,=3
		LDR R6,=7
		LDR R8,=8
		LDR R9,=10
		STM R13!,{R0-R9}
		MOV R0,R13
L2  	MOV R1,R0
		MOV R3,R0
		SUB R3,#4
		ADD R11,R10,#1
L1  	LDMDB R3,{R4}
		LDMDB R1,{R7}
		CMP R4,R7
		BLO DOWN
		MOV R1,R3
DOWN	SUB R3,#4
		ADD R11,#1
		CMP R11,#10
		BNE L1
		LDMDB R0!,{R2}
		LDMDB R1!,{R6}
		STM R1,{R2}
		STM R0,{R6}
		ADD R10,#1
		CMP R10,#9
		BNE L2
		LDMDB R13!,{R0-R9}
		
HERE    B HERE
		END