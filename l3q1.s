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
	LDR R0,=VALUE1
	LDR R1,[R0]
	LDR R0,=VALUE2
	LDR R3,[R0]
	SUB R4,R1,R3
	LDR R5,=RESULT
	STR R4,[R5]
STOP
	B STOP
VALUE1 DCD 0x4F
VALUE2 DCD 0x39
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END