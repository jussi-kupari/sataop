#lang racket/base

#|Exercise 2.15: list-of-first-items
Define a procedure list-of-first-items that takes as its argument a list composed of nonempty lists of items.
Its value is a list composed of the first top-level item in each of the sublists. Test your procedure on:

(list-of-first-items '((a) (b c d) (e f))) ==> (a b e)
(list-of-first-items '((1 2 3) (4 5 6))) ==> (1 4) 
(list-of-first-items '((one))) ==> (one)
(list-of-first-items '()) ==> ()|#

(module+ test
  (require rackunit))

;; list-of-first-items : List-of-nonempty-lists -> List
;; Produces a list of the first elements of the top-level lists in the list
(define list-of-first-items
  (λ (ls)
    (cond
      ((null? ls) '())
      (else
       (cons (caar ls) (list-of-first-items (cdr ls)))))))

(module+ test
  (check-equal? (list-of-first-items '((a) (b c d) (e f))) '(a b e))
  (check-equal? (list-of-first-items '((1 2 3) (4 5 6))) '(1 4))
  (check-equal? (list-of-first-items '((one))) '(one))
  (check-equal? (list-of-first-items '()) '())
  )