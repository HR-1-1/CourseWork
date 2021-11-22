#include "LPC23xx.h"

void delay()
{
	int i,j;
	for (i=0;i<0xff;i++)
		for(j=0;j<0xff;j++);
}

int main(void)
{	
	FIO4PIN = 0x0;
	FIO3DIR = 0xFFFFFFFF;
	FIO4DIR = 0x0;
	while(1)
	{
		FIO3PIN = ((FIO4PIN0&0xF0)>>4)*(FIO4PIN0&0xF);
	}
	return 0;
}