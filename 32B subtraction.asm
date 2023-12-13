.model small ;contain two segment data and code 
.386 ;instructions for the 80386 processor 
.data ; start of data segment 
DATA1 dd 00000000H ; initializes memory with 32 bit word
msg db 10,13,"Enter the first no.:: $" ; 10 is the ASCII control code for line feed while 13 is the code for carriage return
msg1 db 10,13,"Enter the second no.:: $" 
msg2 db 10,13,"The Resultant sum is :: $" 
.code ; start of code segment 
.startup ;Generates program start-up code 
MOV AH,09 
MOV DX,OFFSET msg
INT 21H ; calling interrupt to display string whose address present in DX it will check AH value first 
MOV EBX,0 
MOV CX,8 ; setting number of loop 
AGAIN: MOV AH,01 ;1ST NO. ENTERED 
INT 21H 
CMP AL,'A' 
JGE L5 
SUB AL,30H ; convert the hexadecimal digits into its equivalent ASCII
JMP L6 
L5: SUB AL,37H ; convert the hexadecimal digits into its equivalent ASCII
L6: SHL EBX,4 ; multiply by 16 
ADD BL,AL 
LOOP AGAIN 
MOV DATA1,EBX 
MOV AH,09 
MOV DX,OFFSET msg1 
INT 21H ; displaying string message 
MOV EBX,0 
MOV CX,8 ; setting number of loop 
AGAIN1:MOV AH,01 ;2nd NO. ENTERED 
INT 21H 
CMP AL,'A' 
JGE L7 
SUB AL,30H ; convert the hexadecimal digits into its equivalent ASCII
JMP L8 
L7: SUB AL,37H ; convert the hexadecimal digits into its equivalent ASCII
L8: SHL EBX,4 ; multiply by 16 
ADD BL,AL 
LOOP AGAIN1 
SUB EBX,DATA1 ;ADDITION 
MOV AH,09
MOV DX,OFFSET msg2 
INT 21H 
MOV CX,8 
AGAIN2: ROL EBX,4 ; rotates the bits within the destination operand to the left 
MOV DL,BL 
AND DL,0FH 
CMP DL,09 
JG L1 ; to o/p given no. 
ADD DL,30H 
JMP PRINT 
L1: ADD DL,37H 
PRINT: MOV AH,02 
INT 21H ; Output a character present in DL , as AH value is 2 
LOOP AGAIN2 
END 
