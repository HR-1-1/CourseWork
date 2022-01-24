;
; INT0_INTERRUPT.asm
;
; Created: 9/22/2021 3:44:16 PM
; Author : Harish
;



.CSEG

.ORG		0x000
			RJMP	RESET

.ORG		0x001
			RJMP	INT0_ISR

.ORG		0x010

RESET:	
			;Loading the Stack address into SP
			LDI		R16,	HIGH(RAMEND)
			OUT		SPH,	R16
			LDI		R16,	LOW(RAMEND)
			OUT		SPL,	R16
		
			;Interface Port B Pin0 to be output
			;to control LED blinking
			LDI		R16,	(1<<PINB0)
			OUT		DDRB,	R16

			;Configure PIND2 as Input
			;to generate external interrupt INT0
			LDI		R16,	0x00
			OUT		DDRD,	R16

			;Set ISC1 bits in MCUCR to enable Low level interrupt
			LDI		R16,	0x00
			OUT		MCUCR,	R16

			;Set INT0 bit in GICR to enable Ext Interrupt 0
			LDI		R16,	(1<<INT0)
			OUT		GICR,	R16

			;Turn off the LED initially
			LDI		R16,	0x00
			OUT		PORTB,	R16

			;Enable Global Interrupt Flag in SREG
			SEI

			;Keep the CPU busy
LOOP:		RJMP	LOOP

INT0_ISR:	
			;Save the SREG Register
			IN		R16,	SREG
			PUSH	R16
			
			;Make the LED at PINB0 Blink 10 times for time period 2 sec
BLINK:		LDI		R16,	0x0A
			
			;Turn ON the LED at PINB0
			LDI		R16,	0x01
			OUT		PORTB,	R16

			;Delay for 1 sec
			RCALL	DELAY_1s

			;Turn OFF the LED at PINB0
			LDI		R16,	0x00
			OUT		PORTB,	R16

			;Delay for 1 sec
			RCALL	DELAY_1s
			
			DEC		R16
			BRNE	BLINK

			;Pop back the SREG
			POP		R16
			OUT		SREG,	R16

			RETI

			;SubRoutine to cause 1 sec Delay for CPU of 1 MHz

DELAY_1s:	
			LDI		R17,	8

DELAY1:		LDI		R18,	125

DELAY2:		LDI		R19,	250

DELAY3:		DEC		R19
			NOP
			BRNE	DELAY3
			
			DEC		R18
			BRNE	DELAY2
			
			DEC		R17
			BRNE	DELAY1

			RET
