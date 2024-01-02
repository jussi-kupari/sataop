#lang racket/base

;; Program 2.7 leaving

(provide leaving)

(require (only-in "Prog7.5.rkt" writeline))

;; leaving
(define leaving
  (λ (result cond-clause-number)
    (begin
      (writeline "Leaving cond-clause-"
               cond-clause-number " with result  = " result)
      result)))