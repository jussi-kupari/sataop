#lang racket/base

;; Program 2.1 singleton-list?

(module+ test
  (require rackunit))

;; singleton-list? : Any -> Boolean
;; Produces true if the input is a pair with one element
(define singleton-list?
  (λ (ls)
    (and (pair? ls)
         (null? (cdr ls)))))

(module+ test
  (check-true (singleton-list? '(a)))
  (check-true (singleton-list? '(123)))
  (check-false (singleton-list? '(a b c)))
  (check-false (singleton-list? '(a (b c))))
  )