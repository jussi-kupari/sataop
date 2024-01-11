#lang racket/base

#|Exercise 3.9: wrapa
Define a procedure wrapa that takes as arguments an item a and a nonnegative
integer num and wraps num sets of parentheses around the item a. Test your
procedure on:

(wrapa 'gift 1) ==> (gift)
(wrapa 'sandwich 2) ==> ((sandwich))
(wrapa 'prisoner 5) ==> (((((prisoner)))))
(wrapa 'moon 0) ==> moon |#

;; wrapa : Any NonNegativeInteger -> List or Atom
;; Wraps num sets of parentheses around the item
(define wrapa
  (λ (a num)
    (cond
      ((zero? num) a)
      (else (cons (wrapa a (sub1 num)) '())))))

(module+ test
  (require rackunit)

  (check-equal? (wrapa 'gift 1) '(gift))
  (check-equal? (wrapa 'sandwich 2) '((sandwich)))
  (check-equal? (wrapa 'prisoner 5) '(((((prisoner))))))
  (check-equal? (wrapa 'moon 0) 'moon)
  )