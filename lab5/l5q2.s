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
		MOV R0,#1
		LDR R1,=VAL
		LDR R2,[R1]
		BL FACT
		LDR R3,=RES
		STR R0,[R3]
STOP 
		B STOP

VAL DCD 4
	
FACT	MUL R0,R0,R2
		SUBS R2,#1
		BNE FACT
		BX LR
		
	AREA mydata, DATA, READWRITE	
RES DCD 0
		END
	
	