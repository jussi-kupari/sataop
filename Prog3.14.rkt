#lang racket/base

;; Program 3.14 r=

(provide r=)

(require (only-in "Prog3.21.rkt" numr denr))

;; r= : Rtl Rtl -> Boolean
;; Produces true if given rationals are equal
(define r=
  (λ (x y)
    (= (* (numr x) (denr y))
       (* (numr y) (denr x)))))