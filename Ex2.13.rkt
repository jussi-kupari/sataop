#lang racket/base

#|Exercise 2.13: subst-1st
Define a procedure subst-1st that takes three parameters: an item new, an item old, and a list of items Is.
The procedure subst-1st looks for the first top-level occurrence of the item old in ls and replaces it with the item new.
Test your procedure on:

(subst-1st 'dog 'cat '(my cat is clever)) ==> (my dog is clever)
(subst-1st 'b 'a '(c a b a c)) ==> (c b b a c)
(subst-1st '(0) '() '((*) (1) () (2))) ==> ((0) (1) (*) (2))
(subst-1st 'two 'one '()) ==> '()

In order to be able to include lists as possible arguments to which the parameters new and old are bound, use equal? to test for sameness.
Also define procedures substq-1st and substv-1st that use eq? and eqv? respectively, instead of equal? to test for sameness.|#

(provide (all-defined-out))

(module+ test
  (require rackunit))

;; subst-1st : Any Any List -> List
;; Replace the first occurrence of old item with new item in the list
(define subst-1st
  (λ (new old ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) old)
       (cons new (cdr ls)))
      (else
       (cons (car ls) (subst-1st new old (cdr ls)))))))

;; substq-1st : Any Any List -> List
(define substq-1st
  (λ (new old ls)
    (cond
      ((null? ls) '())
      ((eq? (car ls) old)
       (cons new (cdr ls)))
      (else
       (cons (car ls) (substq-1st new old (cdr ls)))))))

;; substv-1st : Any Any List -> List
(define substv-1st
  (λ (new old ls)
    (cond
      ((null? ls) '())
      ((eqv? (car ls) old)
       (cons new (cdr ls)))
      (else
       (cons (car ls) (substv-1st new old (cdr ls)))))))


(module+ test
  (check-equal? (subst-1st 'dog 'cat '(my cat is clever)) '(my dog is clever))
  (check-equal? (subst-1st 'b 'a '(c a b a c)) '(c b b a c))
  (check-equal? (subst-1st '(0) '(*) '((*) (1) (*) (2))) '((0) (1) (*) (2)))
  (check-equal? (subst-1st 'two 'one '()) '()) 
  )