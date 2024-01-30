#lang racket/base

;; Program 3.16 r> and r<

(provide r> r<)

(require (only-in "Prog3.11.rkt" r-))
(require (only-in "Prog3.15.rkt" rpositive?))

;; r> : Rtl Rtl -> Boolean
;; Produces true if first rational is greater than the second
(define r>
  (λ (x y)
    (rpositive? (r- x y))))

;; r< : Rtl Rtl -> Boolean
;; Produces true if first rational is smaller than the second
(define r<
  (λ (x y)
    (rpositive? (r- y x))))