#lang racket/base

#|Exercise 1.12
Evaluate each of the following.

a. (cdr '((a (b c) d)))
b. (car (cdr (cdr '(a (b c) (d e)))))
c. (car (cdr '((1 2) (3 4) (5 6))))
d. (cdr (car '((1 2) (3 4) (5 6))))
e. (car (cdr (car '((cat dog hen)))))
f. (cadr '(a b c d))
g. (cadar '((a b) (c d) (e f)))|#

(module+ test
  (require rackunit)

  ;; a. '()
  (check-equal? (cdr '((a (b c) d))) '())
  
  ;; b. '(d e)
  (check-equal? (car (cdr (cdr '(a (b c) (d e))))) '(d e))

  ;; c. '(3 4)
  (check-equal? (car (cdr '((1 2) (3 4) (5 6)))) '(3 4))

  ;; d. '(2)
  (check-equal? (cdr (car '((1 2) (3 4) (5 6)))) '(2))

  ;; e. 'dog
  (check-equal? (car (cdr (car '((cat dog hen))))) 'dog)

  ;; f. 'b
  (check-equal? (cadr '(a b c d)) 'b)

  ;; g. 'b
  (check-equal? (cadar '((a b) (c d) (e f))) 'b)  
  )