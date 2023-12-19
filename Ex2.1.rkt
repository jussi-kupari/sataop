#lang racket/base

#|Exercise 2.1: second
Define a procedure called second that takes as its argument a list and that
returns the second item in the list. Assume that the list contains at least two
items.|#

(provide second)

(module+ test
  (require rackunit))

;; second : List-of-Any -> Any
;; Produces the second item on the list
(define second
  (λ (ls)
    (cadr ls)))

(module+ test
  (check-equal? (second '(1 2)) 2)
  (check-equal? (second '(5 7 3 8)) 7)
  (check-equal? (second '((1 2) (6 7))) '(6 7))
  (check-equal? (second '((a b) (c d) (e f))) '(c d))
  )