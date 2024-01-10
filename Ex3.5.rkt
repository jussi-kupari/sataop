#lang racket/base

#|Exercise 3.5: index
Define a procedure index that has two arguments, an item a and a list of
items ls, and returns the index of a in ls, that is, the zero-based location
of a in ls. If the item is not in the list, the procedure returns -1.
Test your procedure on:

(index 3 '(1 2 3 4 5 6)) ==> 2
(index 'so '(do re me fa so la ti do)) ==> 4
(index 'a ' (b c d e)) ==> -1
(index 'cat '()) ==> -1 |#

(provide index)

;; This solution uses two helper functions: one to test first if the item is not on the list
;; and another to fetch the index of a found item.

;; index : Any List -> Integer
;; Produce the index of item in list; if not found, produce -1.
(define index
  (λ (a ls)
    (cond
      ((not-in-list? a ls) -1)
      (else (get-index a ls)))))

;; get-index : Any List -> Integer
;; Produce the index of item in list.
(define get-index
  (λ (a ls)
    (cond
      ((equal? a (car ls)) 0)
      (else (add1 (get-index a (cdr ls)))))))

;; not-in-list? : Any List -> Boolean
;; Produce #true if given item is not on the list. 
(define not-in-list?
  (λ (a ls)
    (cond
      ((null? ls) #t)
      (else
       (and (not (equal? a (car ls)))
            (not-in-list? a (cdr ls)))))))


;; ----- Alternative solution without helpers -----

(define index.v2
  (λ (a ls)
    (cond
      ((null? ls) -1)
      ((eqv? a (car ls)) 0)
      ((eqv? -1 (index.v2 a (cdr ls))) -1)
      (else (add1 (index.v2 a (cdr ls)))))))

;; ------------------------------------------------


(module+ test
  (require rackunit)

  ;; not-in-list?
  (check-true (not-in-list? 1 '()))
  (check-true (not-in-list? 1 '(2 3 5)))
  (check-false (not-in-list? 1 '(1 2 3 5)))

  ;; get-index
  (check-equal? (get-index 1 '(1 2 3 5)) 0)
  (check-equal? (get-index 1 '(2 1 3 5)) 1)
  (check-equal? (get-index 1 '(2 3 1 5)) 2)
  (check-equal? (get-index 1 '(5 3 2 1)) 3)

  ;; index
  (check-equal? (index 3 '(1 2 3 4 5 6)) 2)
  (check-equal? (index 'so '(do re me fa so la ti do)) 4)
  (check-equal? (index 'a ' (b c d e)) -1)
  (check-equal? (index 'cat '()) -1)

  ;; index.v2
  (check-equal? (index.v2 3 '(1 2 3 4 5 6)) 2)
  (check-equal? (index.v2 'so '(do re me fa so la ti do)) 4)
  (check-equal? (index.v2 'a ' (b c d e)) -1)
  (check-equal? (index.v2 'cat '()) -1)
  )