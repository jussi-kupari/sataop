#lang racket/base

;; Program 3.17 =max=

;; Named =max= not to clash with max in racket

(provide =max=)

;; =max= : Number Number -> Number
;; Produces the first given number if it is bigger, else the second
(define =max=
  (λ (x y)
    (if (> x y)
        x
        y)))


(module+ test
  (require rackunit)

  (check-equal? (=max= 5 4)       5)
  (check-equal? (=max= 345 234) 345)
  (check-equal? (=max= 5 5)       5)
  (check-equal? (=max= 12 29)    29)
  )