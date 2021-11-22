#include "LPC23xx.h"
void delay(void)
{
	int i,j;
	for (i=0; i<0xff; i++)
		for(j=0; j<0xff; j++);
}

void forward(void)
{
		IOPIN0 = 0x00000280; //1010
		delay();
		IOPIN0 = 0x00000180; //0110
		delay();
		IOPIN0 = 0x00000140; //0101
		delay();
		IOPIN0 = 0x00000240; //1001
		delay();
	
}

void reverse(void)
{
		IOPIN0 = 0x00000240; //1001
		delay();
		IOPIN0 = 0x00000140; //0101
		delay();
		IOPIN0 = 0x00000180; //0110
		delay();
		IOPIN0 = 0x00000280; //1010
		delay();
	
}

int main(void)
{	
	IOPIN0 = 0x0;
	IODIR0 = 0x0FF0;	//pins 8,9,10,11
	int angle = 80;
	/*
	while(1)
	{
		reverse();
	}
	*/
	for(int i=0; i<(angle/8); i++)
	{
		forward();
	}
	
	return 0;
}