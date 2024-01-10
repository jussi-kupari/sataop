#lang racket/base

#|We refer to a list of numbers as an n-tuple. Thus (1 3 5 7), (-1.3 2.5),
(3), and () are examples of n-tuples. The numbers in an n-tuple are called
components. In Exercises 3.1-3.4, you are asked to define several procedures
on n-tuples. In all of the exercises in this section, you may use procedures
you have already defined as helping procedures.

Exercise 3.1: sum
Define a procedure sum that finds the sum of the components of an n-tuple.
Test your procedure on:
(sum '(1 2 3 4 5)) ==> 15
(sum '(6)) ==> 6
(sum '()) ==> 0 |#

(provide sum)

;; sum : N-tuple -> Real
;; Sum up all the numbers in the given n-tuple
(define sum
  (λ (ntpl)
    (cond
      ((null? ntpl) 0)
      (else (+ (car ntpl) (sum (cdr ntpl)))))))


(module+ test
  (require rackunit)
  (check-equal? (sum '(1 2 3 4 5)) 15)
  (check-equal? (sum '(6))         6)
  (check-equal? (sum '())          0)
  )