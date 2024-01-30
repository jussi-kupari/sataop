#lang racket/base

;; Program 3.15 rpositive?

(provide rpositive?)

(require (only-in "Prog3.21.rkt" numr denr))

;; rpositive? : Rtl -> Boolean
;; Produces true if the rational is positive
(define rpositive?
  (λ (rtl)
    (or (and (positive? (numr rtl)) (positive? (denr rtl)))
        (and (negative? (numr rtl)) (negative? (denr rtl))))))