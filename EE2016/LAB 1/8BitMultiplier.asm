;
; 8BitMultiplier.asm
;
; Created: 9/1/2021 3:00:02 PM
; Author : Harish
;


.CSEG

	LDI ZL, LOW(NUM<<1)
	LDI ZH, HIGH(NUM<<1)

	LPM R16, Z+
	LPM R17, Z

	MUL R16, R17 ; Result stored in R1-R0
	
NOP
NUM: .db 0xFF, 0x01
