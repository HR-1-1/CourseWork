/*
 * INT1_C.c
 *
 * Created: 9/22/2021 4:05:47 PM
 * Author : Harish
 */ 

#define		F_CPU  1000000

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>


ISR (INT1_vect)
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
	GICR = (1<<INT1);
	PORTB = 0x00;
	
	sei();
	
    while (1) 
    {
    }
}

