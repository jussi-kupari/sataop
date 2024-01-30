#lang racket/base

;; Program 3.9 r+

(provide r+)

(require (only-in "Prog3.21.rkt" numr denr make-ratl))

;; r+ : Rtl Rtl -> Rtl
;; Produces the sum of the two rational numbers
(define r+
  (λ (x y)
    (make-ratl
     (+ (* (numr x) (denr y)) (* (numr y) (denr x)))
     (* (denr x) (denr y)))))