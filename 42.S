        default rel
        section .text
        global entry
entry:
        mov rax, 42
        sub rax, 1
        add rax, 1
        add rax, 1
        add rax, 1
        add rax, 1
        ret
