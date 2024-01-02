#lang racket/base

#|Exercise 2.14: insert-right-1st
The procedure insert-right-1st is like remove-1st except that instead of
removing the item that it is searching for, it inserts a new item to its right.

For example,

(insert-right-1st 'not 'does '(my dog does have fleas))=> (my dog does not have fleas)

The definition of insert-right-1st is

(define insert-right-1st
  (λ (new old ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) old)
       (cons old (cons new (cdr ls))))
      (else (cons (car ls)
                  (insert-right-1st new old (cdr ls)))))))

Define a procedure insert-left-1st that is like insert-right-1st except
that instead of inserting a new item to the right of the item it is searching
for, it inserts it to its left. Test your procedure on

(insert-left-1st 'hot 'dogs '(I eat dogs)) ==> (I eat hot dogs)
(insert-left-1st 'fun 'games '(some fun)) ==> (some fun)
(insert-left-1st 'a 'b '(a b c a b c)) ==> (a a b c a b c)
(insert-left-1st 'a 'b '()) => () |#

(module+ test
  (require rackunit))

;; insert-left-1st : Any Any List -> List
;; Inserts new item in front (left) of the first old item in the list
(define insert-left-1st
  (λ (new old ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) old)
       (cons new ls)) ; see what I did here? Same as (cons new (cons old (cdr ls)))
      (else (cons (car ls)
                  (insert-left-1st new old (cdr ls)))))))

(module+ test
  (check-equal? (insert-left-1st 'hot 'dogs '(I eat dogs)) '(I eat hot dogs))
  (check-equal? (insert-left-1st 'fun 'games '(some fun)) '(some fun))
  (check-equal? (insert-left-1st 'a 'b '(a b c a b c)) '(a a b c a b c))
  (check-equal? (insert-left-1st 'a 'b '()) '())
  )

