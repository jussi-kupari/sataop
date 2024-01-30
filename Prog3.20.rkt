#lang racket/base

;; Program 3.20 rprint

(provide rprint)

(require (only-in "Prog7.5.rkt" writeline))

(require (only-in "Prog3.21.rkt" numr denr))

;; rprint : Rtl ->
;; Display the given rational
(define rprint
  (λ (rtl)
    (writeline (numr rtl) "/" (denr rtl))))