#lang racket

(provide interp)
(require "ast.rkt")

(define (interp e)
  (match e
         [(Int i) i]
         [(Op1 op e) (interp-op1 op (interp e))]
  ))

(define (interp-op1 op e)
  (match op
         ['add1 (add1 e)]
         ['sub1 (sub1 e)]
         ))
