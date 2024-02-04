	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
N1 DCD 0x123
	AREA mydata, DATA, READWRITE	
DST DCD	0	
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=N1  ;loc of BCD
	LDR R1,=DST
	LDR R2,[R0]  ;R2=BCD num
	MOV R3,#1  ;for ones place
	MOV R4,#0xa  ;for hundredths place
	MOV R5,#0   
	MOV R7,#0xF  
	
up	MOV R6,R2
	AND R6,R7 ;R6=ones digit num
	MLA R5,R6,R3,R5  ; initially (3x1)+0
	MUL R3,R4 ;multiply r3 by 10 (initially 1 then 10,100,1000...)
	LSR R2,#4 ;to remove the last digit num
	CMP R2,#0
	BNE up
	STR R5,[R1]
STOP
	B STOP
	
	END
	
	
	