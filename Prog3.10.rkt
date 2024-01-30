#lang racket/base

;; Program 3.10 r*

(provide r*)

(require (only-in "Prog3.21.rkt" numr denr make-ratl))

;; r* : Rtl Rtl -> Rtl
;; Produces the product of the two rational numbers
(define r*
  (λ (x y)
    (make-ratl
     (* (numr x) (numr y))
     (* (denr x) (denr y)))))