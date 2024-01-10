#lang racket/base

;;Program 3.1 add1

(provide =add1=)

;; =add1= : Real -> Real
(define =add1=
  (λ (n)
    (+ n 1)))

(module+ test
  (require rackunit)
  (check-equal? (=add1=  0)  1)
  (check-equal? (=add1= 11) 12)
  (check-equal? (=add1= -5) -4)
  )