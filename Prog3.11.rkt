#lang racket/base

;; Program 3.11 r-

(provide r-)

(require (only-in "Prog3.21.rkt" numr denr make-ratl))

;; r- : Rtl Rtl -> Rtl
;; Produces the difference between the two rational numbers
(define r-
  (λ (x y)
    (make-ratl
     (- (* (numr x) (denr y)) (* (numr y) (denr x)))
     (* (denr x) (denr y)))))