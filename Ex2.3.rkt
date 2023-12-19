#lang racket/base

#|Exercise 2.3: firsts-of-both
The procedure firsts-of-both is defined as follows:

(define firsts-of-both
  (λ (list-1 list-2)
    (make-list-of-two (car list-1) (car list-2))))

Determine the value of the following expressions:
a. (firsts-of-both '(1357) '(246))
b. (firsts-of-both '((a b) (c d)) '((e f) (g h)))|#

(module+ test
  (require rackunit))

;; firsts-of-both : List-of-Any List-of-Any -> List-of-2
(define firsts-of-both
  (λ (list-1 list-2)
    (make-list-of-two (car list-1) (car list-2))))


;; Helper functions from pages 33 and 34

;; make-list-of-one : Any -> List-of-1
(define make-list-of-one
  (λ (item)
    (cons item '())))

;; make-list-of-two : Any Any -> List-of-2
(define make-list-of-two
  (λ (item1 item2)
    (cons item1 (make-list-of-one item2))))


(module+ test
  (check-equal? (firsts-of-both '(1357) '(246)) '(1357 246))
  (check-equal? (firsts-of-both '((a b) (c d)) '((e f) (g h))) '((a b) (e f)))
  )