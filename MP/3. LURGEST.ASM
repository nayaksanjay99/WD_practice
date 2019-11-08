.model small
data segment
a db 10h,53h,77h,42h,09h
len dw $-a
data ends
code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov cx,len
        lea si,a
        mov al,00h
back:   cmp al,a[si]
        jg skip
        mov al,a[si]
skip:   inc si
        loop back
        mov ah,4ch
        int 21h
code ends
end start
