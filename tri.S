default rel
section .text
global entry

entry:
        mov rbx, 36
tri:
        cmp rbx, 0
        je done
        push rbx
        sub rbx, 1
        call tri
        pop rbx
        add rax, rbx
        ret

done:
        mov rax, 0
        ret
