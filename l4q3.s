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
		LDR R6,=unpacked_RESULT
		LDR R0,=VALUE1  ;RO=the addr where BCD is stored
		MOV R2,#00   ;for quotient
		LDR R1,[R0]  ; R1=BCD NUMBER
up		cmp R1,#0xa
		BLO store
		SUB R1,#0xa
		ADD R2,#01   ; Incrementing Quotient
		B up
store	STRB R1,[R6],#1    
		MOV R1,R2
		MOV R2,#0
		cmp R1,#0xa
		BCS up
		STRB R1,[R6],#1
		MOV R3,R6 
		
		LDR R2,=packed
		LDR R6,=unpacked_RESULT
		
		SUB R4,R3,R6 ;gives total unpacked numbers in mem
up1		LDRB R0,[R6],#1
		LDRB R1,[R6],#1
		LSL R1,#4
		ORR R1,R0
		STRB R1,[R2],#1
		SUB R4,#2
		cmp R4,#01
		BGE up1
STOP
		B STOP
VALUE1 DCD 0x7B
		AREA mydata, DATA, READWRITE
unpacked_RESULT DCD 0,0,0,0,0,0,0,0,0,0		
packed DCB 0
		END
	