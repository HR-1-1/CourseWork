	TTL Half_Assemble_List
	AREA abc,CODE,READONLY ;
		
		ENTRY
		
Main
		LDR R11, RESULT	;Load address of result variable
		LDR R6, LIST	;Pointer to List
		MOV R0, #0		;Clear Register
		LDRB R0, [R6]	;Get Length of List --> Counter variable
		MOV R8, R6		;Make a copy of list
		ADD	R8, R8, R0	;Point to Last element
		
		MOV R1, #0xF 	;Mask
		MOV R2, #0		;Shift Counter

Loop
		LDRB R3, [R8], #-1	
		AND R9,R3,R1
		ADD R10,R10,R9,LSL R2
		ADD R2,R2,#4
		SUBS R0,R0,#1
		BNE Loop
		
		STR R10,[R11]	;Store the result in the RESULT VARIABLE
			
		SWI &11
START	
		DCB 4
		DCB &1A, &2B, &3C, &4D

LIST	DCD	START

RESULT  DCD &E0000002
		
		END