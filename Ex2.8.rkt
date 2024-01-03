#lang racket/base

#|Exercise 2.8
Decide whether the following expressions are true or false using s-and-n-list? as defined in this section.

a. (s-and-n-list? '(2 pair 12 dozen))
b. (s-and-n-list? '(b 4 u c a j))
c. (s-and-n-list? '(a ten))
d. (s-and-n-list? '(a))|#

;; s-and-n-list from page 43

;; s-and-n-list : List -> Boolean
;; Produce true if input is a pair and car is a symbol and cadr a number
(define s-and-n-list?
  (λ (ls)
    (and (pair? ls)
          (symbol? (car ls))
          (pair? (cdr ls))
          (number? (cadr ls)))))

(module+ test
  (require rackunit)
  
  ;; test s-and-n-list
  (check-true (s-and-n-list? '(a 1 b)))
  (check-false (s-and-n-list? '(a b 1)))

  ;; a. (s-and-n-list? '(2 pair 12 dozen))
  (check-false (s-and-n-list? '(2 pair 12 dozen)))

  ;; b. (s-and-n-list? '(b 4 u c a j))
  (check-true (s-and-n-list? '(b 4 u c a j)))

  ;; c. (s-and-n-list? '(a ten))
  (check-false (s-and-n-list? '(a ten)))

  ;; d. (s-and-n-list? '(a))
  (check-false (s-and-n-list? '(a)))
  )