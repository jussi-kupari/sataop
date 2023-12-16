#lang racket/base

#|Exercise 1.11
If a list ls contains only one item, what is (null? (cdr ls))?|#

(module+ test
  (require rackunit))

(module+ test
  ;; True, the tail of a one value list is the null list
  (check-true (null? (cdr (cons 'a '()))))
  )