section .data
    prompt db "enter a number: ",0
    format db "%s",0

section .bss
    num resb 256


section .text
    global main
    extern scanf 
    extern printf

incind:
    inc rcx
chamber:
    mov al,[rdi+rcx]
    cmp al,0
    je end
    cmp al,96
    jle incind
    cmp al,122
    jg incind
    sub al,32
    mov [rdi+rcx],al
    jmp incind
end:
    mov rax,rdi
    ret

main:
    push rbp
    mov rdi, prompt
    call printf

    lea rsi,[num]
    mov rdi, format
    call scanf
    
    mov rdi,num
    xor rcx,rcx
    call chamber


    mov rsi,rax
    mov rdi, format
    call printf

    pop rbp
    mov rax,0 
    ret
