;
; SimpleAdder.asm
;
; Created: 9/1/2021 2:41:38 PM
; Author : Harish
;


.CSEG 
	LDI ZL, LOW(NUM<<1)	
	LDI ZH, HIGH(NUM<<1)

	LPM R0, Z+
	LPM R1, Z

	ADD R0, R1
	BRCC abc
	LDI R17, 0x01
abc:MOV R16, R0
NOP
NUM:	.db	0xFF, 0x01	
