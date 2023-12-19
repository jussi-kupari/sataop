#lang racket/base

#|Exercise 2.19: sandwich-1st
Define a procedure sandwich-1st that takes two items, a and b, and a list ls as its arguments.
It replaces the first occurrence of two successive b's in
ls with b a b. Test your procedure on:

(sandwich-1st 'meat 'bread '(bread cheese bread bread)) ==> (bread cheese bread meat bread)
(sandwich-1st 'meat 'bread '(bread jam bread cheese bread)) ==> (bread jas bread cheese bread)
(sandwich-1st 'meat 'bread '()) ==> '()|#

(provide sandwich-1st)

(module+ test
  (require rackunit))

;; sandwich-1st : Item Item List -> List
;; Places the first item between the first occurrence of two successive second items
(define sandwich-1st
  (λ (a b ls)
    (cond
      ((null? ls) '())
      ((null? (cdr ls)) ls) ; ls has to be minimum two long to compare consecutive items
      ((and (equal? (car ls) b) (equal? (cadr ls) b))
       (cons b (cons a (cdr ls))))
      (else (cons (car ls) (sandwich-1st a b (cdr ls)))))))

(module+ test
  (check-equal? (sandwich-1st 'meat 'bread '(bread cheese bread bread)) '(bread cheese bread meat bread))
  (check-equal? (sandwich-1st 'meat 'bread '(bread jam bread cheese bread)) '(bread jam bread cheese bread))
  (check-equal? (sandwich-1st 'meat 'bread '()) '())
  )