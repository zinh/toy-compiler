#lang racket

(provide parse)
(require "ast.rkt")

(define (parse s)
  (match s
         [(? integer?) (Int s)]
         [(list (? op1? o) e) (Op1 o (parse e))]
         [_ (error "Parse error")]
         ))

(define (op1? x)
  (memq x '(add1 sub1)))
