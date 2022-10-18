        default rel
        section .text
        global entry
entry:
        mov rax, 1
        sub rax, 1
        cmp rax, 0
        je if3317
        mov rax, 22
        sub rax, 1
        jmp if3318
if3317:
        mov rax, 50
        cmp rax, 0
        je if3319
        mov rax, 70
        jmp if3320
if3319:
        mov rax, 60
if3320:
if3318:
        ret
