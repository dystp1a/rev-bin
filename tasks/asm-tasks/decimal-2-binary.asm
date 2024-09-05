section .data
    frmt db "%d", 0
    prompt db "enter a no:", 0

section .bss
    num resd 1

section .text
    global main
    extern printf
    extern scanf

dec2bin:
    xor r10,r10
    xor r8,r8
    mov rax,[rdi]
    mov rcx,1
    jmp boi
realstart:
    mov rax,r10
boi:
    mov rbx,2
    div rbx
    mov r10,rax
    mov rax, rdx
    mul rcx
    
    add r8, rax
    mov rax, rcx
    mov r9,10
    mul r9
    mov rcx,rax
    cmp r10,0
    jne realstart
end:
    mov rax,r8
    ret


main:
    push rbp
    mov rbp, rsp
    sub rsp, 16 ; align the stack

    mov rdi, prompt
    call printf

    lea rsi, [num]
    mov rdi, frmt
    call scanf

    mov rdi,num
    call dec2bin
  
    mov rdi, frmt
    mov rsi, rax
    call printf

    xor rax, rax
    leave
    ret
