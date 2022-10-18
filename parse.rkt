#lang racket

(provide parse)
(require "ast.rkt")

(define (parse s)
  (match s
         [(? integer?) (Int s)]
         [(list (? op1? o) e) (Op1 o (parse e))]
         [(list 'if z1 e2 e3)
          (match z1
                 [(list 'zero? e1) (IfZero (parse e1) (parse e2) (parse e3))])
          ]
         [_ (error "Parse error")]
         ))

(define (op1? x)
  (memq x '(add1 sub1)))
