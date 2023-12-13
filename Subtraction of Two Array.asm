.model small ; contain two segment data and code 
.data ; start of data segment 
mat1 db 12h, 11h, 12h, 10h, 11h, 12h, 10h, 11h, 12h ; defining byte size variable
mat2 db 13h, 02h, 02h, 02h, 02h, 02h, 02h, 02h, 02h 
res3 dw 9 dup(?); Declaring an array with garbage 
.code ; start of code segment 
mov ax, @data ;loading starting address of data segment in ax 
mov ds, ax 
mov cx, 09h 
mov di, offset mat1 
mov bx, offset mat2 
mov si, offset res3 
back : mov ah, 0 
mov al, [di] 
sub al, [bx] 
adc ah, 00 
mov [si], ax 
inc di 
inc bx 
inc si 
inc si 
loop back 
mov si, offset res3 
mov dh, 9 
l10: mov ch, 04h 
mov cl, 04h 
mov bx, [si] 
l2: rol bx, cl ; rotates the bits within the destination operand to the left 
mov dl, bl 
and dl, 0fh 
cmp dl, 09
jbe l4 
add dl, 07 
l4: add dl, 30h 
mov ah, 02 
int 21h ; display single character as ah = 2 
dec ch 
jnz l2 
mov dl, ' ' ;This is a whitespace 
int 21h 
inc si 
inc si 
dec dh 
jnz l10 
mov ah, 4ch 
int 21h ; causes the current process to terminate 
end 
