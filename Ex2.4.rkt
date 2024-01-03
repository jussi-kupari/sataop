#lang racket/base

#|Exercise 2.4: juggle
Define a procedure juggle that rotates a three-element list. The procedure
juggle returns a list that is a rearrangement of the input list so that the
first element of this list becomes the second, the second element becomes the
third, and the third element becomes the first. Test your procedure on:

(juggle '(jump quick spot)) ==> (spot jump quick)
(juggle '(dog bites man) ) ==> (man dog bites)|#


(require
  (only-in "Ex2.1.rkt" second)
  (only-in "Ex2.2.rkt" third))

;; juggle : List -> List
(define juggle
  (λ (ls)
    (cons (third ls)
          (cons (car ls)
                (cons (second ls) '())))))

(module+ test
  
  (require rackunit)
  (check-equal? (juggle '(jump quick spot)) '(spot jump quick))
  (check-equal? (juggle '(dog bites man)) '(man dog bites))
  )