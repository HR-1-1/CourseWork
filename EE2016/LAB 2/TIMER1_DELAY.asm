;
; Timer1_Interrupt.asm
;
; Created: 9/22/2021 4:26:50 PM
; Author : Harish
;


.CSEG

.ORG	0x000

			;Initializing the SP with Stack Top address
			LDI		R16,		HIGH(RAMEND)
			OUT		SPH,		R16
			LDI		R16,		LOW(RAMEND)
			OUT		SPL,		R16

			;Configure PINB0 in output mode
			LDI		R16,		(1<<PINB0)
			OUT		DDRB,		R16

			;Blink LED in PINB0 with Time period 2 sec
BEGIN:	
			SBI		PORTB,		0
			RCALL	DELAY_1s
			CBI		PORTB,		0	
			RCALL	DELAY_1s

			RJMP	BEGIN

;------------TIMER1 DELAY----------------------

DELAY_1s:	
			LDI		R20,		0x00
			OUT		TCNT1H,		R20
			OUT		TCNT1L,		R20
			
			;Loading 15625 into OCR1A
			LDI		R20,		HIGH(0x3D09)
			OUT		OCR1AH,		R20
			LDI		R20,		LOW(0x3D09)
			OUT		OCR1AL,		R20

			;Setting Prescalar as 1/64
			LDI		R20,		0x03
			OUT		TCCR1B,		R20

			;Setting CTC Mode for Channel A
			LDI		R20,		(1<<6)
			OUT		TCCR1A,		R20

AGAIN:		
			IN		R20,		TIFR
			SBRS	R20,		OCF1A
			RJMP	AGAIN

			LDI		R20,		1<<OCF1A
			OUT		TIFR,		R20
			LDI		R19,		0
			OUT		TCCR1B,		R19
			OUT		TCCR1A,		R19

			RET