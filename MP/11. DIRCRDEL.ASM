.model small
data segment
namze db 'Wallah',0
msg1 db 10,13,'success$'
msg2 db 10,13,'failure$'
info db '39 for creation and 3a for deletion$'
data ends
code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        mov ah,3ah  
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
