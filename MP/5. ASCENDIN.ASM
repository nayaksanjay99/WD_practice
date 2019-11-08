.model small

data segment
arr db 04h,44h,07h,23h,11h
len dw $-arr
data ends

code segment
assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov ch,04h
back1:  lea si,arr
        mov cl,04h
back2:  mov al,arr[si]
        mov ah,arr[si+1]
        cmp ah,al
        jnc skip1
        mov arr[si],ah
        mov arr[si+1],al
skip1:  inc si
        dec cl
        jnz back2
        dec ch
        jnz back1
        mov ah,4ch
        int 21h
code ends

end
