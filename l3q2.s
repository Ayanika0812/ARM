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
	LDR R2,[R0]
	UMULL R5,R6,R1,R2
	LDR R3,=RESULT
	STR R5,[R3],#4
	STR R6,[R3]
STOP
	B STOP
VALUE1 DCD 0xFFFFFFFF
VALUE2 DCD 0xEEEEEEEE
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END