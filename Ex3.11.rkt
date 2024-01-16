#lang racket/base

#|Exercise 3.11: sum-of-odds
It can be shown that the sum of the first n odd numbers is equal to n^2.
For example,
                 1 + 3 + 5 + 7 = 16 = 4^2

Write a procedure sum-of-odds that sums the first n odd integers. Test your
procedure by evaluating it for all values of n from 1 to 10 to see that each
is the perfect square of the number of terms.|#

(provide sum-of-odds)

;; sum-odds : NonNegativeInt -> NonNegativeInt
;; Produce the sum of first N integers.
(define sum-of-odds
  (λ (n)
    (cond
      ((zero? n) 0)
      (else
       (+ (sub1 (* n 2)) (sum-of-odds (sub1 n)))))))

(module+ test
  (require rackunit)

  (check-equal? (sum-of-odds  1) (expt 1 2))
  (check-equal? (sum-of-odds  2) (expt 2 2))
  (check-equal? (sum-of-odds  3) (expt 3 2))
  (check-equal? (sum-of-odds  4) (expt 4 2))
  (check-equal? (sum-of-odds  5) (expt 5 2))
  (check-equal? (sum-of-odds  6) (expt 6 2))
  (check-equal? (sum-of-odds  7) (expt 7 2))
  (check-equal? (sum-of-odds  8) (expt 8 2))
  (check-equal? (sum-of-odds  9) (expt 9 2))
  (check-equal? (sum-of-odds 10) (expt 10 2))
  )