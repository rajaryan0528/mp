.model small ; contain two segment data and code 
.stack 100h ; tells the assembler to reserve 100 byte storage 
.data ; start of data segment 
input db "Enter an ASCII character :$" 
output db 10,13,"Binary Equiv: $"; 10 is the ASCII control code for line feed while 13 is the code for 
carriage return
.code ; start of code segment 
MOV AX ,@DATA ; loading starting address of data segment in ax 
MOV DS ,AX 
MOV DX ,OFFSET input ; loading the offset address 
MOV AH, 09H 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9 
MOV AH,01H 
INT 21H ; input from the user 
MOV BL,AL 
MOV DX,OFFSET output 
MOV AH,09H 
INT 21H ; Output a string terminated by '$’ stored in DX, as AH =9MOV CX,8 
BIN_EQUIV: 
SHL BL,1 ; multiply by 16 
JC PRINTONE 
PRINTZERO: 
MOV DL,30H 
JMP PRINT 
PRINTONE: 
MOV DL,31H 
PRINT: 
MOV AH,02H 
INT 21H ; Output a character present in DL , as AH value is 2 
LOOP BIN_EQUIV 
MOV AH,4CH 
INT 21H ; causes the current process to terminate 
END
