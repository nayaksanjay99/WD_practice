.model small
.data
a db 09h
b db 04h
.code
mov ax,@data
mov ds,ax
mov ax,0000h
mov bx,0000h
mov al,a
mov bl,b
div bX
mov ah,4ch
int 21h

end
