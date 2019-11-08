.model small
data segment
block1 db 'madam'
len dw $-block1
pal db 00h
data ends
extra segment
block2 db 05 dup(?)
extra ends
code segment
        assume cs:code,ds:data,es:extra
start:  mov ax,data
        mov ds,ax
        mov ax,extra
        mov ds,ax
        lea si,block1
        lea di,block2+04h
        mov cx,0005h
back:   cld
        lodsb
        std
        stosb
        loop back
        lea si,block1
        lea di,block2
        mov cx,0005h
        cld
        rep cmpsb
        jnz skip
        mov pal,01h
        mov ah,pal
skip:   mov ah,pal
        mov ah,4ch
        int 21h
code ends
end start
