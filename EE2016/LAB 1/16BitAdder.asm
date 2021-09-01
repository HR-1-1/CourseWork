;
; 16BitAdder.asm
;
; Created: 9/1/2021 2:50:12 PM
; Author : Harish
;


.CSEG
	LDI ZL, LOW(NUM1<<1)	
	LDI ZH, HIGH(NUM1<<1)

	LPM R0, Z+
	LPM R1, Z
	
	LDI ZL, LOW(NUM2<<1)
	LDI ZH, HIGH(NUM2<<1)
	
	LPM R2, Z+
	LPM R3, Z
	
	ADD R0, R2
	ADC R1, R3	
	BRCC abc
	LDI R18, 0x01
abc: MOVW R16, R0	;The final answer is stored in R18-R17-R16 0x1FFFE
	
NOP
NUM1 : .dw 0xFFFF
NUM2 : .dw 0xFFFF

