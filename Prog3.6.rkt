#lang racket/base

;; Program 3.6 =length=

(provide =length=)

;; =length= : List -> NonNegativeInteger
(define =length=
  (λ (ls)
    (if (null? ls)
     0
     (add1 (=length= (cdr ls))))))

(module+ test
  (require rackunit)

  (check-equal? (=length= '())                0)
  (check-equal? (=length= '(a b c d e))       5)
  (check-equal? (=length= '(1 (2 3) (4 5 6))) 3)
  (check-equal? (=length= '(one))             1)
  )