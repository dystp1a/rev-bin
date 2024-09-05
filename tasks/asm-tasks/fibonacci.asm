section .data
    format db "%d",0
    prompt db "enter a number: ",10,0

section .bss
    num resd 1


section .text
    global main
    extern scanf 
    extern printf

fib:
    
    cmp rdi,1
    jle grrr
    xor r9,r9 
    mov r10,1 
    mov r12,1
    mov rcx,1
    
    
loop:
    
    inc r12
    add rcx,r9
    mov r9,r10
    mov r10,rcx
    cmp r12, rdi
    jl loop
grrr:
    mov rax, rcx 
    ret
main:
    push rbp
    mov rdi, prompt
    call printf

    lea rsi,[num]
    mov rdi, format
    call scanf

    mov rdi, [num]
    call fib

    mov rdi, format
    mov rsi, rax
    call printf

    pop rbp
    mov rax,0 
    ret

 
