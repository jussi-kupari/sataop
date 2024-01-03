#lang racket/base

#|Exercise 1.10
If the operands a and b evaluate to any values, what is

a. (symbol? (cons a b))
b. (pair? (cons a b))
c. (null? (cons a b))
d. (null? (cdr (cons a '())))|#

(module+ test
  (require rackunit)

  ;; a. False, cons builds a pair/list not a symbol
  (check-false (symbol? (cons 'a 'b)))

  ;; b. True, cons builds a pair/list
  (check-true (pair? (cons 'a 'b)))

  ;; c. False, consing values (even empty lists) together builds a non-empty pair/list 
  (check-false (null? (cons '() '())))

  ;; d. True, the tail of a one value list is the null list
  (check-true (null? (cdr (cons 'a '()))))  
  )

