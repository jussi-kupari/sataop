#lang racket/base

#|Exercise 2.2: third
Define a procedure called third that takes as its argument a list and that
returns the third item in the list. Assume that the list contains at least three
items.|#

(module+ test
  (require rackunit))

(provide third)

;; third : List-of-Any -> Any
;; Produces the third item on the list
(define third
  (λ (ls)
    (caddr ls)))

(module+ test
  (check-equal? (third '(1 2 3)) (caddr '(1 2 3)))
  (check-equal? (third '(5 7 3 8)) (caddr '(5 7 3 8)))
  (check-equal? (third '((1 2) (6 7) (7 8 9))) '(7 8 9))
  (check-equal? (third '((a b) (c d) (e f))) (caddr '((a b) (c d) (e f))))
  )