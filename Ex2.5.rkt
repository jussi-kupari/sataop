#lang racket/base

#|Exercise 2.5: switch
Define a procedure switch that interchanges the first and third elements of a three-element list.
Test your procedure on the examples given in the previous exercise.|#

(module+ test
  (require rackunit))

(require
  (only-in "Ex2.1.rkt" second)
  (only-in "Ex2.2.rkt" third))

;; switch : List-of-three -> List-of-three
(define switch
  (λ (ls)
    (cons (third ls)
          (cons (second ls)
                (cons (car ls) '())))))

(module+ test
  (check-equal? (switch '(jump quick spot)) '(spot quick jump))
  (check-equal? (switch '(dog bites man)) '(man bites dog))
  )