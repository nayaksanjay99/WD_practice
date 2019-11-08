.model small
data segment
block1 db 05h,03h,24h,04h,05h
len dw $-block1
pal db 00h
data ends
extra segment
block2 dw 05h dup(?)
extra ends
code segment
        assume cs:code,ds:data,es:extra
start:  mov ax,data
        mov ds,ax
        mov ax,extra
        mov es,ax
        mov cx,len
        lea si,block1
        lea di,block2+4
back:   cld
        lodsb
        std
        stosb
        loop back
        lea si,block1
        lea di,block2
        mov cx,len
        cld
        rep cmpsb
        jnz skip
        mov al,01h
        mov pal,al
skip:   int 03h
code ends
end start
