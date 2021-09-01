;
; LargestNumber.asm
;
; Created: 9/1/2021 3:08:55 PM
; Author : Harish
;


.CSEG
		LDI ZL, LOW(NUM<<1)
		LDI ZH, HIGH(NUM<<1)

		LDI XL, 0x60
		LDI XH, 0x00
		
		LDI R18, 2*(abc - NUM) - 0x01		; Counter Variable set to N-1 (where N numbers are to be compared)
		LPM R16, Z+

AGAIN:	LPM R17, Z+
		CP R16, R17
		BRGE abc1
		MOV R16, R17
abc1:	CLS 
		DEC R18
		BRNE AGAIN
		ST X, R16	; Largest number put in SRAM 0x0060


NUM: .db 0x1D, 0x02, 0x04, 0x01	
abc: NOP