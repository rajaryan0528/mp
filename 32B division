.model small ; contain two segment data and code 
.386 ;instructions for the 80386 processor 
.data ; start of data segment 
DATA1 dd 00000000H ; initializes memory with 32 bit word 
DATA2 dd 00000000H ; initializes memory with 32 bit word 
REM dd ? ; set double word variable 
QUO dd ? ; set double word variable 
msg db 10,13,"Enter the first no.:: $" ; 10 is the ASCII control code for line feed while 13 is the code for carriage return
msg1 db 10,13,"Enter the second no.:: $" 
msg2 db 10,13,"The Remainder is :: $" 
msg3 db 10,13,"The Quotient is :: $" 
.code ; start of code segment 
.startup ; Generates program start-up code 
MOV AH,09
MOV DX,OFFSET msg 
INT 21H ; calling interrupt to display string whose address present in DX it will check AH value first 
MOV EBX,0 
MOV CX,8 ; setting number of loop 
AGAIN: MOV AH,01 ;1ST NO. ENTERED 
INT 21H 
CMP AL,'A' 
JGE L5 
JMP L6 
L5: SUB AL,37H ;convert the hexadecimal digits into its equivalent ASCII 
L6: SUB AL,30H ;convert the hexadecimal digits into its equivalent ASCII 
SHL EBX,4 ; multiply by 16 
ADD BL,AL 
LOOP AGAIN 
MOV DATA1,EBX 
MOV AH,09 
MOV DX,OFFSET msg1 
INT 21H ; Output a string terminated by '$’ stored in DX 
MOV EBX,0 
MOV CX,8 ; setting number of loop 
AGAIN1:MOV AH,01 ;2nd NO. ENTERED 
INT 21H 
CMP AL,'A' 
JGE L7 
SUB AL,30H ;convert the hexadecimal digits into its equivalent ASCII
JMP L8 
L7: SUB AL,37H ;convert the hexadecimal digits into its equivalent ASCII
L8: SHL EBX,4 ; multiply by 16 
ADD BL,AL 
LOOP AGAIN1 
MOV DATA2,EBX 
MOV EBX,0 
MOV EDX,0 
MOV EAX,0 
MOV EAX,DATA1 
MOV EBX,DATA2 
DIV EBX 
MOV REM,EDX ;REM=REMAINDER 
MOV QUO,EAX ;QUO=QUOTIENT 
MOV AH,09 
MOV DX,OFFSET msg2 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9 
MOV EBX,REM 
MOV CX,8 
AGAIN2: ROL EBX,4 ; rotates the bits within the destination operand to the left 
MOV DL,BL 
AND DL,0FH ; to o/p the result in rem 
CMP DL,9 
JBE L1 
ADD DL,37H 
MOV AH,02 
INT 21H ; Output a character stored in DL, as AH value is 2 
JMP L2 
L1: ADD DL,30H 
MOV AH,02 
INT 21H ; Output a character stored in DL, as AH value is 2 
L2: LOOP AGAIN2 
MOV AH,09 
MOV DX,OFFSET msg3 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9 
MOV EBX,QUO 
MOV CX,8 ; setting the number of loop 
AGAIN3: ROL EBX,4 ; rotates the bits within the destination operand to the left 
MOV DL,BL 
AND DL,0FH ; to o/p the result in quo 
CMP DL,9 
JBE L3 
ADD DL,37H 
MOV AH,02 
INT 21H ; Output a character present in DL , as AH value is 2 
JMP L4 
L3: ADD DL,30H 
MOV AH,02 
INT 21H ; Output a character present in DL , as AH value is 2 
L4: LOOP AGAIN3 
MOV AH,4CH ; causes the current process to terminate 
INT 21H 
END 
