;
; ComplexAdder.asm
;
; Created: 8/25/2021 6:01:12 PM
; Author : Harish
;


.CSEG
		LDI ZL,	LOW(NUM2<<1)		;	Loads the LS byte of address of NUM IN ZL
		LDI ZH, HIGH(NUM2<<1)	;	Loads the MS byte of address of NUM IN ZH
		LDI R18, 0x00
NUM2: .db 0x01,0x02
		LDI XL, 0x60
		LDI XH, 0x00
		LDI R17, 0x50
		LDI R16, 00

		LPM R0, Z+
		LPM R1, Z
		
		ADD R0, R1
		BRCC abc
		ST X+, R0
abc:		ST X, R16
NOP
NUM1: .db 0xD3, 0x5F




