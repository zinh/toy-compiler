#lang racket

(provide compile)
(require "ast.rkt" a86/ast)

(define (compile e)
  (prog (Global 'entry)
        (Label 'entry)
        (compile-e e)
        (Ret))
  )

(define (compile-e e)
  (match e
         [(Int i) (compile-int i)]
         [(Op1 op e) (compile-op1 op e)]
         [(IfZero e1 e2 e3) (compile-if-zero e1 e2 e3)]
         ))

(define (compile-int i)
  (seq (Mov 'rax i)))

(define (compile-op1 op e)
  (seq (compile-e e)
       (match op
              ['add1 (Add 'rax 1)]
              ['sub1 (Sub 'rax 1)]
              )
  ))

(define (compile-if-zero e1 e2 e3)
  (let ((l0 (gensym 'if))
        (l1 (gensym 'if)))
    (append (compile-e e1)
            (list (Cmp 'rax 0)
                  (Je l0))
            (compile-e e3)
            (list (Jmp l1)
                  (Label l0))
            (compile-e e2)
            (list (Label l1)))))
