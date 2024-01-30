#lang racket/base

;; Program 3.13 r/

(provide r/)

(require (only-in "Prog3.12.rkt" rinvert))
(require (only-in "Prog3.10.rkt" r*))

;; r/ : Rtl Rtl -> Rtl
;; Divides first rational with second rational
(define r/
  (λ (x y)
    (r* x (rinvert y))))