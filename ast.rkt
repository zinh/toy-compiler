#lang racket

(provide Int Op1 IfZero)
(struct Int (i))
(struct Op1 (op e))
(struct IfZero (e1 e2 e3))
