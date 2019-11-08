.model small
data segment
arr db 12h,75h,37h,08h,33h
len db $-arr
data ends
code segment
        assume cs:code,ds:data
start:  mov ax,data
        mov ds,ax
        mov ch,04h
back1:  lea si,arr
        mov cl,04h
back2:  mov ah,arr[si]
        mov al,arr[si+1]
        cmp al,ah
        jg skip
        mov arr[si],al
        mov arr[si+1],ah
skip:   inc si
        dec cl
        jnz back2
        dec ch
        jnz back1
        mov ah,4ch
        int 21h
code ends
end start
