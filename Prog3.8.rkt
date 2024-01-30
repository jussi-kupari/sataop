#lang racket/base

;; Program 3.8 rzero?

(provide rzero?)

;; rzero? : Rtl
;; Produces true if the numerator is zero
(define rzero?
  (λ (rtl)
    (zero? (numr rtl))))