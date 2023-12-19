#lang racket/base

#|Exercise 2.12
The following procedure, named mystery, takes as its argument a list that contains at least two top-level items.

(define mystery
  (λ (ls)
    (if (null? (cddr ls))
        (cons (car ls) '())
        (cons (car ls) (mystery (cdr ls))))))

What is the value of (mystery '(1 2 3 4 5))? Describe the general behavior of mystery.
Suggest a good name for the procedure mystery.|#

#| The function mystery takes as an argument a list that has least two top-level items and
reproduces the list with the last element removed. A good name for this function is remove-last. |#

(module+ test
  (require rackunit))

;; remove-last : List -> List
;; Removes the last element of a list
(define remove-last
  (λ (ls)
    (if (null? (cddr ls))
        (cons (car ls) '())
        (cons (car ls) (remove-last (cdr ls))))))


(module+ test
  (check-equal? (remove-last '(1 2 3 4 5)) '(1 2 3 4))
  (check-equal? (remove-last '(5 6 7)) '(5 6))
  (check-equal? (remove-last '(7 8)) '(7))
  )
