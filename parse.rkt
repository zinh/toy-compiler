#lang racket

(provide parse)
(require "ast.rkt")

(define (parse s)
  (match s
         [(? integer?) (Int s)]
         [(? boolean?) (Bool s)]
         [(list (? op1? o) e) (Op1 o (parse e))]
         [(list 'if e1 e2 e3) (If (parse e1) (parse e2) (parse e3))]
         [_ (error "Parse error")]
         ))

(define (op1? x)
  (memq x '(add1 sub1 zero?)))
