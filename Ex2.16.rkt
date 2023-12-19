#lang racket/base

#|Exercise 2.16: replace
Define a procedure replace that replaces each top-level item in a list of items
ls by a given item new-item. Test your procedure on:

(replace 'no '(will you do me a favor)) ==> (no no no no no no)
(replace 'yes '(do you like ice cream)) ==> (yes yes yes yes yes)
(replace 'why '(not)) ==> (why)
(replace 'maybe '()) ==> ()|#

(provide replace)

(module+ test
  (require rackunit))

;; replace : Item List -> List
;; Replaces all items in list with new item
(define replace
  (λ (item ls)
    (cond
      ((null? ls) '())
      (else (cons item (replace item (cdr ls)))))))

(module+ test
  (check-equal? (replace 'no '(will you do me a favor)) '(no no no no no no))
  (check-equal? (replace 'yes '(do you like ice cream)) '(yes yes yes yes yes))
  (check-equal? (replace 'why '(not)) '(why))
  (check-equal? (replace 'maybe '()) '())
  )