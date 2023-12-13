.model small ; contain two segment data and code 
.386 ;instructions for the 80386 processor 
.data ; start of data segment 
MESS0 DB 10,13,"ENTER THE FIRST NUMBER:$" ; ; 10 is the ASCII control code for line feed while 13 is 
the code for carriage return
MESS1 DB 10,13,"ENTER THE SECOND NUMBER:$" 
MESS2 DB 10,13,"THE DIFFERENCE IS:$" 
A DD ? ; set double word variable 
B DD ? ; set double word variable 
C DD ? ; set double word variable 
COUNT DB 04h reserve byte of memory locations 
.code ; start of code segment 
.startup ; Generates program start-up code 
LEA DX,MESS0 ; load the effective address 
MOV AH,09 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9 
MOV EBX,0 
MOV CX,8 
AGAIN: 
MOV AH,01 
INT 21H ; input the number 
CMP AL,'A' 
JGE L5 
SUB AL,30H ; convert the hexadecimal digits into its equivalent ASCII
JMP L6 
L5: SUB AL,37H ; convert the hexadecimal digits into its equivalent ASCII
L6: SHL EBX,4 ; multiply by 16
ADD BL,AL 
LOOP AGAIN ; goto AGAIN label 
MOV A,EBX 
LEA DX,MESS1 
MOV AH,09 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9 
MOV EBX,0 
MOV CX,8 
AGAINS: 
MOV AH,01 
INT 21H ; input the number 
CMP AL,'A' 
JGE L51 
SUB AL,30H ; convert the hexadecimal digits into its equivalent ASCII
JMP L61 
L51: SUB AL,37H ; convert the hexadecimal digits into its equivalent ASCII
L61: SHL EBX,4 ; multiply by 16 
ADD BL,AL 
LOOP AGAINS ; goto AGAIN label 
MOV B,EBX 
MOV AX,WORD PTR A ; retrieve only the lowest word (2 bytes) at the "A" address 
MOV BX,WORD PTR B ; retrieve only the lowest word (2 bytes) at the "B" address 
SUB AL,BL 
DAS ; Adjusts the result of the subtraction to create a packed BCD result 
MOV BL,AL
SBB AH,BH ; Subtract with borrow BH from AH 
MOV AL,AH 
DAS ; Adjusts the result of the subtraction to create a packed BCD result 
MOV BH,AL 
MOV WORD PTR C,BX ; ; replace only the lowest word (2 bytes) at the "C" address 
MOV AX,WORD PTR A+2 ; retrieve the highest word at the "A" address 
MOV BX,WORD PTR B+2 ; retrieve the highest word at the "B" address 
SBB AL,BL ;Subtract with borrow BL from AL 
DAS ; Adjusts the result of the subtraction to create a packed BCD result 
MOV BL,AL 
SBB AH,BH ; Subtract with borrow BH from AH 
MOV AL,AH 
DAS ; Adjusts the result of the subtraction to create a packed BCD result 
MOV BH,AL 
MOV WORD PTR C+2,BX ; replace the highest word at the "C" address 
LEA DX,MESS2 
MOV AH,09 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9 
MOV BX,WORD PTR C+2 ; ;replace the highest word at the "C" address 
MOV DH,2 
L1: MOV CH,04H 
MOV CL,04H 
L2: ROL BX,CL ; rotates the bits within the destination operand to the left 
MOV DL,BL 
AND DL,0FH 
CMP DL,09 
JBE L4 
ADD DL,07 
L4: ADD DL,30H 
MOV AH,02 
INT 21H ; Output a character present in DL , as AH value is 2 
DEC CH 
JNZ L2 
DEC DH 
CMP DH,0 
MOV BX,WORD PTR C ; retrieve the lowest word at the "C" address 
JNZ L1 
MOV AH,4CH 
INT 21H ; causes the current process to terminate 
END
