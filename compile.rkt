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
