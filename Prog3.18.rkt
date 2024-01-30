#lang racket/base

;; Program 3.18 rmax and rmin

(provide rmax)

(require (only-in "Prog3.16.rkt" r> r<))
(require (only-in "Prog3.21.rkt" make-ratl))

;; rmax : Rtl Rtl -> Rtl
;; Produces the first given rational if it is bigger, else the second
(define rmax
  (λ (x y)
    (if (r> x y)
        x
        y)))

;; rmin : Rtl Rtl -> Rtl
;; Produces the first given rational if it is smaller, else the second
(define rmin
  (λ (x y)
    (if (r< x y)
        x
        y)))