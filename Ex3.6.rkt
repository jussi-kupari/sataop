#lang racket/base

#|Exercise 3.6: make-list
Define a procedure make-list that takes as arguments a nonnegative integer num and an item a
and returns a list of num elements, each of which is a. Test your procedure on:

(make-list 5 'no) ==> (no no no no no)
(make-list 1 'maybe) ==> (maybe)
(make-list 0 'yes) ==> ()
(length (make-list 7 'any)) ==> 7
(all-same? (make-list 100 'any)) ==> #t |#

(provide make-list)

;; make-list : NonNegativeInt Any -> List
;; Produce a list of items length of given integer
(define make-list
  (λ (num a)
    (cond
      ((zero? num) '())
      (else (cons a (make-list (sub1 num) a))))))


(module+ test
  (require rackunit)
  (require (only-in "Ex2.21.rkt" all-same?))

  (check-equal? (make-list 5 'no) '(no no no no no))
  (check-equal? (make-list 1 'maybe) '(maybe))
  (check-equal? (make-list 0 'yes) '())
  (check-equal? (length (make-list 7 'any)) 7)
  (check-equal? (all-same? (make-list 100 'any)) #t)
  )