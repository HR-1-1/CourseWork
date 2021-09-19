;
; FibonacciAsm.asm
;
; Created: 9/17/2021 9:14:24 AM
; Author : Harish
;
;Assembly Code to store first 10 numbers of Fibonacci Series(Starting with 0,1) in Registers R11 to R20. 


.CSEG

		LDI		R21,	LOW(RAMEND)
		OUT		SPL,	R21
		LDI		R21,	HIGH(RAMEND)
		OUT		SPH,	R21

		LDI		ZL,		LOW(NUM<<1)
		LDI		ZH,		HIGH(NUM<<1)

		LPM		R1,		Z+
		LPM		R2,		Z

		LDI		ZL,		0x0B
		LDI		ZH,		0x00

		LDI		R23,	0x0A

loop:	PUSH	R2
		ADD		R2,		R1
		ST		Z+,		R1
		POP		R1
		DEC		R23
		BRNE	loop

vetti:	RJMP	vetti
		
NUM:	.DB		0x00,	0x01
