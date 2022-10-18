#lang racket

(provide interp)
(require "ast.rkt")

(define (interp e)
  (match e
         [(Int i) i]
         [(Op1 op e) (interp-op1 op (interp e))]
         [(IfZero e1 e2 e3) (interp-if-zero (interp e1) e2 e3)]
  ))

(define (interp-op1 op e)
  (match op
         ['add1 (add1 e)]
         ['sub1 (sub1 e)]
         ))

(define (interp-if-zero e1 e2 e3)
  (if (= e1 0)
    (interp e2)
    (interp e3)))
