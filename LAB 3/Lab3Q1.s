	TTL Factorial
	AREA Program,CODE,READONLY
		ENTRY
Main	
		LDR R3, RESULT
		LDRB R0,INPUT
		MOV R10,#1
	
		
Loop		
		
		MUL R10,R0,R10
		SUBS R0,R0,#1
		BNE Loop
		
		STR R10,[R3]
		SWI &11
		
INPUT	DCB &05
		ALIGN
RESULT DCD &40000002
		END