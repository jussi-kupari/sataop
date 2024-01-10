#lang racket/base

;;Program 3.2 sub1

(provide =sub1=)

;; =sub1= : Real -> Real
(define =sub1=
  (λ (n)
    (- n 1)))

(module+ test
  (require rackunit)
  (check-equal? (=sub1=  0)  -1)
  (check-equal? (=sub1= 11)  10)
  (check-equal? (=sub1= -5)  -6)
  )