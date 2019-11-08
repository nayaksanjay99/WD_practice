.model small
data segment
namze db 'waqanda.txt',0
msg1 db 10,13,'File deleted successfully$'
msg2 db 10,13,'Deletion error'
data ends
code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax

        mov ah,41h
        lea dx,namze
        int 21h

        jc exit
        mov ah,09h
        lea dx,msg1
        int 21h
        jmp final
exit:   mov ah,09h
        lea dx,msg1
        int 21h
final:  mov ah,4ch
        int 21h
code ends
end start
