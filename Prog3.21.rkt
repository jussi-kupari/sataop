#lang racket/base

;; Program 3.21 numr, denr, make-ratl

;; Rtl is (make-ratl Int Int)
;; interp. a representation of rational number

(provide (all-defined-out))

;; numr : Rtl -> Int
;; Produces the numerator from given rational
(define numr
  (λ (rtl)
    (car rtl)))

;; denr : Rtl -> Int
;; Produces the denominator from given rational
(define denr
  (λ (rtl)
    (cadr rtl))) ; (car (cdr rtl))

;; make-ratl : Int Int -> Rtl
;; Produces a rational from given integers
(define make-ratl
  (λ (int1 int2)
    (if (zero? int2)
        (error "make-ratl: The denominator cannot be zero.")
        (list int1 int2))))