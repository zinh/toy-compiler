#lang racket

(provide main)
(require a86/printer)
(require "compile.rkt" "parse.rkt")

(define (main fn)
  (let ([p (open-input-file fn)])
    (begin
      (asm-display (compile (parse (read p))))
      (close-input-port p)
      )))
