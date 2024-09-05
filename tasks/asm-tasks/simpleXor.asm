section .data
    prompt db "enter the string to be encrypted and the key(num): ",0
    format db "%s",0
    formatnum db "%d",0

section .bss
    stringg resb 256
    key resd 1


section .text
    global main
    extern scanf 
    extern printf
    extern strlen
    
xorin:
    mov rcx,0
    xor rax,rax
xorfr:
    mov al,[rdi+rcx]
    xor rax,rsi
    mov [rdi+rcx],al
    inc rcx
    cmp rcx,rdx
    jl xorfr
    mov rax,rdi
    ret

main:
    push rbp
    mov rdi, prompt
    call printf

    lea rsi,[stringg]
    mov rdi, format
    call scanf

    lea rsi,[key]
    mov rdi,formatnum
    call scanf

    

    mov rdi,stringg
    call strlen
    
    mov rdx,rax
    mov rdi,stringg
    mov rsi,[key]
    call xorin
    


    mov rsi,rax
    mov rdi, format
    call printf

    pop rbp
    mov rax,0 
    ret
