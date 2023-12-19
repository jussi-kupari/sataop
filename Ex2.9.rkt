#lang racket/base

#|Exercise 2.9
Decide whether the following expressions are true or false using s-or-n-list?
as defined in this section.

a. (s-or-n-list? '(b))
b. (s-or-n-list? '(c 2 m))
c. (s-or-n-list? '(10 10 10 10))
d. (s-or-n-list? '())|#

(module+ test
  (require rackunit))

;; s-or-n-list from page 44

;; s-or-n-list : List -> Boolean?
;; Produce true if input is a pair and car is a symbol or a number
(define s-or-n-list?
  (λ (ls)
    (and (pair? ls)
         (or (symbol? (car ls))
             (number? (car ls))))))
  
(module+ test
  ;; test s-or-n-list
  (check-true (s-or-n-list? '(a 1 b)))
  (check-true (s-or-n-list? '(1 a b)))
  (check-false (s-or-n-list? 'aaa))
  (check-false (s-or-n-list? '()))
  (check-false (s-or-n-list? '((a b) b 1)))

  ;; a. (s-or-n-list? '(b))
  (check-true (s-or-n-list? '(b)))

  ;; (s-or-n-list? '(c 2 m))
  (check-true (s-or-n-list? '(c 2 m)))

  ;; c. (s-or-n-list? '(10 10 10 10))
  (check-true (s-or-n-list? '(10 10 10 10)))

  ;; d. (s-or-n-list? '())
  (check-false (s-or-n-list? '()))
  )

