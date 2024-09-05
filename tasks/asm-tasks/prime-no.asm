section .data
    format db "%d",0
    prompt db "enter to check if prime(0) or not(1): ",10,0
    prime db "prime",10,0
    nonp db "non-prime",10,0
section .bss
    num resd 1


section .text
    global main
    extern scanf 
    extern printf

primetime:
    cmp rdi,1
    jle np
    mov rcx,2
hello:
    mov rbx,rdi
    shr rbx,1
    cmp rcx,rbx
    jg end
    mov rax,rdi
    xor rdx,rdx
    div rcx
    cmp rdx,0
    jz np
    inc rcx
    jmp hello
np:
    mov rax,1
    ret
end:
    mov rax,0
    ret

main:
    push rbp
    mov rdi, prompt
    call printf

    lea rsi,[num]
    mov rdi, format
    call scanf

    mov rdi, [num]
    call primetime
    mov rdi,prime
    cmp rax,0
    jz okau
    mov rdi,nonp
okau:
    call printf

    pop rbp
    mov rax,0 
    ret

 
