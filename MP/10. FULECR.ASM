.model small
data segment
namze db 'waqanda.txt',0
msg1 db 10,13,'File created succesfully$'
msg2 db 10,13,'File creation failed$'
data ends
code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        mov ah,09h
        lea dx,namze
        int 21h

        mov ah,3ch
        lea dx,namze
        int 21h

        jc exit
        mov ah,09h
        lea dx,msg1
        int 21h
        jmp final
exit:   mov ah,09h
        lea dx,msg2
        int 21h
final:  mov ah,4ch
        int 21h
code ends
end start
code ends
end start

