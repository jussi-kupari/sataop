#lang racket/base

#|Exercise
Exercise 1.9
If a and b evaluate to any values, what is
a. (car (cons a b))
b. (cdr (cons a b))|#

;; car and cdr are defined only for non-empty pairs (including lists).

(module+ test
  (require rackunit))

(module+ test
  ;; The value of (car (cons a b)) is always the first element of the pair or list
  ;; Lists
  (check-equal? (car (cons 'a '(b c))) 'a)
  (check-equal? (car (cons '(a b) '(c d e))) '(a b))
  ;; Pair
  (check-equal? (car (cons '(a b) 'c)) '(a b))
  
  ;; The value of (cdr (cons a b)) is always the second element of the pair or list
  ;; Lists
  (check-equal? (cdr (cons 'a '(b c))) '(b c))
  (check-equal? (cdr (cons '(a b) '(c d e)))
                '(c d e))
  ;; Pair
  (check-equal? (cdr (cons '(a b) 'c)) 'c)
  )