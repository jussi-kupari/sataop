#lang racket/base

(module+ test
  (require rackunit))

#|Exercise 1.13
We can extract the symbol a from the list (b (a c) d) using car and cdr
by going through the following steps:

(cdr '(b (a c) d)) ==> ((a c) d)
(car (cdr '(b (a c) d))) ==> (a c)
(car (car (cdr '(b (a c) d)))) ==> a

For each of the following lists, write the expression using car and cdr that
extracts the symbol a:

a. (b c a d)
b. ((b a) (c d))
c. ((d c) (a) b)
d. (((a)))|#

(module+ test
  ;; a. (car (cdr (cdr '(b c a d)))) | (caddr '(b c a d))
  (check-equal? (car (cdr (cdr '(b c a d)))) 'a)
  (check-equal? (caddr '(b c a d)) 'a)

  ;; b. (car (cdr (car '((b a) (c d))))) | (cadar '((b a) (c d)))
  (check-equal? (car (cdr (car '((b a) (c d))))) 'a)
  (check-equal? (cadar '((b a) (c d))) 'a)

  ;; c. (car (car (cdr '((d c) (a) b)))) | (caadr '((d c) (a) b))
  (check-equal? (car (car (cdr '((d c) (a) b)))) 'a)
  (check-equal? (caadr '((d c) (a) b)) 'a)

  ;; d. (car (car (car '(((a)))))) | (caaar '(((a))))
  (check-equal? (car (car (car '(((a)))))) 'a)
  (check-equal? (caaar '(((a)))) 'a)
  )