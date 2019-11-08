.model small
code segment
        assume cs:code
start:  mov ax,2000h
        mov ds,ax
        mov ax,3000h
        mov es,ax
        mov si,0000h
        mov di,0000h
        mov cx,0004h
back:   mov al,ds:[si]
        mov es:[di],al
        inc si
        inc di
        loop back
        mov ah,4ch
        int 21h
code ends
end start
