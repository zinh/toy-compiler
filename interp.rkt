#lang racket

(provide interp)
(require "ast.rkt")

(define (interp e)
  (match e
         [(Int i) i]
         [(Bool b) b]
         [(Op1 op e) (interp-op1 op (interp e))]
         [(If e1 e2 e3) (interp-if (interp e1) e2 e3)]
  ))

(define (interp-op1 op e)
  (match op
         ['add1 (add1 e)]
         ['sub1 (sub1 e)]
         ['zero? (= 0 e)]
         ))

(define (interp-if e1 e2 e3)
  (if e1
    (interp e2)
    (interp e3)))
