#lang racket

(provide Int Bool Op1 If)
(struct Int (i))
(struct Bool (b))
(struct Op1 (op e))
(struct If (e1 e2 e3))
