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
		LDR R6, =RESULT ; Quotient
		MOV R2, #00
		LDR R0, =VALUE1 ; pointer to the first value
		LDR R1, [R0] ; load the first value into R1
		LDR R0, =VALUE2 ; pointer to the second value
		LDR R3, [R0] ; load second number into R3
up	
		CMP R1, R3 ; compare two numbers
		BCC store ; branch if R1 lower
		SUB R1, R1, R3 ; Subtract if R1 greater or equal
		ADD R2, #01 ; increment a counter for Quotient
		B up
store   
		STR R2, [R6], #4
		STR R1, [R6]
STOP
		B STOP
	
VALUE1 DCD 0x20000000
VALUE2 DCD 0x5000
	AREA mydata, DATA, READWRITE
RESULT DCD 0, 0
	END
