#lang racket/base

;; Program 3.19 extreme-value

(provide (all-defined-out))

(require (only-in "Prog3.16.rkt" r> r<))

;; extreme-value : Predicate Number Number -> Number
;; Produces maximum or minimum value of the two, depending on predicate
(define extreme-value
  (λ (pred x y)
    (if (pred x y)
        x
        y)))

;; Define rmax, rmin, =max=, =min=

;; =rmax= : Predicate Rtl Rtl -> Rtl
;; Produces the first given rational if it is bigger, else the second
(define =rmax=
  (λ (x y)
    (extreme-value r> x y)))

;; =rmin= : Predicate Rtl Rtl -> Rtl
;; Produces the first given rational if it is smaller, else the second
(define =rmin=
  (λ (x y)
    (extreme-value r< x y)))

;; =max= : Predicate Number Number -> Number
;; Produces the first given number if it is bigger, else the second
(define =max=
  (λ (x y)
    (extreme-value > x y)))

;; =min= : Predicate Number Number -> Number
;; Produces the first given number if it is smaller, else the second
(define =min=
  (λ (x y)
    (extreme-value < x y)))