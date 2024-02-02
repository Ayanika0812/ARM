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
    MOV R3,#9 ; Set R3 to 9 (4 bytes * 2 digits per byte + 1 carry digit)
    LDR R0, =NUM1 ; Load the address of the first input number
    LDR R1, =NUM2 ; Load the address of the second input number
    LDR R4, =PACKED ; Load the address of the output number
    MOV R5, #0 ; Initialize the carry digit to 0

UP
    LDRB R6,[R0],#1 ; Load the first digit of the first input number
    LDRB R7,[R1],#1 ; Load the first digit of the second input number

    ; Add the digits along with the carry digit
    ADD R8, R6, R7
    ADD R8, R8, R5

    ; Check if there is a carry-out
    CMP R8, #10
    MOVHI R5, #1 ; Set the carry digit to 1 if there is a carry-out
    SUBHI R8, R8, #10 ; Subtract 10 from the result if there is a carry-out

    STRB R8,[R4],#1 ; Store the result digit in the output number

    SUBS R3,#1 ; Decrement the loop counter
    BNE UP ; Repeat the loop if the loop counter is not zero

    ; Store the carry digit as the last digit in the output number
    STRB R5,[R4],#1 

STOP
	B STOP

NUM1 DCD 0X1234567 ; First input number
NUM2 DCD 0X8765432 ; Second input number

	AREA mydata, DATA, READWRITE
PACKED DCD 0 ; Output number

	END
	
