#lang racket/base

#|Exercise 3.4: mult-by-n
Define a procedure mult-by-n that takes a number num and an n-tuple ntpl
as arguments and multiplies each component of ntpl by num. Test your procedure on:

(mult-by-n 3 '(1 2 3 4 5)) ==> (3 6 9 12 15)
(mult-by-n 0 '(1 3 5 7 9 11)) ==> (000000)
(mult-by-n -7 '()) ==> () |#

;; mult-by-n : N-tuple Number -> N-tuple
;; Multiplies each component of given n-tuple with given number.
(define mult-by-n
  (λ (num ntpl)
    (cond
      ((null? ntpl) '())
      (else
       (cons (* num (car ntpl))
             (mult-by-n num (cdr ntpl)))))))

(module+ test
  (require rackunit)
  (check-equal? (mult-by-n 3 '(1 2 3 4 5)) '(3 6 9 12 15))
  (check-equal? (mult-by-n 0 '(1 3 5 7 9 11)) '(0 0 0 0 0 0))
  (check-equal? (mult-by-n -7 '()) '())
  )