.model small

data segment
arr db 05h,10h,76h,44h,22h
len dw $-arr
res db ?
data ends

code segment
assume cs:code,ds:data
START:  mov ax,data
        mov ds,ax
        mov cx,len
        lea si,arr
        mov bh,arr[si]
label1: mov al,arr[si]
        cmp al,bh
        jg nochng
        mov bh,al
nochng: inc si
        loop label1
        mov res,bh
        mov ah,4ch
        int 21h
code ends

end

