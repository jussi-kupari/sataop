#lang racket/base

#|Exercise 3.7: count-background
Define a procedure count-background that takes an item a and a list of items
ls as arguments and returns the number of items in ls that are not equal? to a.
Test your procedure on:

(count-background 'blue '(red white blue yellow blue red)) ==> 4
(count-backgroiind 'red '(white blue green)) ==> 3
(count-background 'white '()) ==> 0 |#

(provide count-background)

;; count-background : Any List -> NonNegativeInteger
;; Produce the number of items in list that are different from given item.
(define count-background
  (λ (a ls)
    (cond
      ((null? ls) 0)
      ((equal? a (car ls))
       (count-background a (cdr ls)))
      (else (add1 (count-background a (cdr ls)))))))


(module+ test
  (require rackunit)

  (check-equal? (count-background 'blue '(red white blue yellow blue red)) 4)
  (check-equal? (count-background 'red '(white blue green)) 3)
  (check-equal? (count-background 'white '()) 0) 
  )