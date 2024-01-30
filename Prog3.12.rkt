#lang racket/base

;; Program 3.12 rinvert

(provide rinvert)

(require (only-in "Prog3.21.rkt" numr denr make-ratl))

;; rinvert : Rtl -> Rtl
;; Inverts the given rational number
(define rinvert
  (λ (rtl)
    (if (zero? (denr rtl))
        (error "rinvert: Cannot invert "rtl)
        (make-ratl (denr rtl) (numr rtl)))))