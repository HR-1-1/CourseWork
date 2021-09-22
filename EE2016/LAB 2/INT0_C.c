/*
 * INT0_C.c
 *
 * Created: 9/22/2021 4:21:06 PM
 * Author : Harish
 */ 


#define		F_CPU  1000000

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>


ISR (INT0_vect)
{
	int i;
	for (i=1; i<=10; i++)
	{
		PORTB = 0x01;
		_delay_ms(1000);
		PORTB = 0x00;
		_delay_ms(1000);
	}
}

int main(void)
{
	DDRB = (1<<PINB0);
	DDRD = 0x00;
	MCUCR = 0x00;
	GICR = (1<<INT0);
	PORTB = 0x00;
	
	sei();
	
	while (1)
	{
	}
}

