#lang racket

(provide main)
(require "parse.rkt" "interp.rkt")

(define (main fn)
  (let ([p (open-input-file fn)])
    (begin
      (println (interp (parse (read p))))
      (close-input-port p)
      )))
