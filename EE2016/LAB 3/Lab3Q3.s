	TTL ODD_OR_EVEN
	AREA Program,CODE,READONLY
		ENTRY
		
Main
		LDR R0,INPUT
		ANDS R1,R0,#0x1
		MOVEQ R2,#1
		
		SWI &11
		
INPUT	DCD &ABC4
	
		END