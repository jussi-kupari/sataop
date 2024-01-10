#lang racket/base

#|Exercise 3.2: pairwise-sum
Define a procedure pairwise-sum that takes two n-tuples of the same length,
ntpl-1 and ntpl-2, as arguments and produces a new n-tuple whose components
are the sum of the corresponding components of ntpl-1 and ntpl-2.

Test your procedure on:
(pairwise-sum '(1 3 2) '(4 -1 2)) ==> (5 2 4)
(pairwise-sum '(3.2 1.5) '(6.0 -2.5)) ==> (9.2 -1.0)
(pairwise-sum '(7) '(11)) ==> (18)
(pairwise-sum '() '()) ==> ()

In an analogous way, define a procedure pairwise-product that produces an
n-tuple whose components are the products of the corresponding components
of ntpl-1 and ntpl-2.|#

(provide (all-defined-out))

;; pairwise-sum : N-tuple N-tuple -> N-tuple
;; Produce an n-tuple of the pairwise sums of given n-tuples
(define pairwise-sum
  (λ (ntpl1 ntpl2)
    (cond
      ((null? ntpl1) '()) ; You need to check only one of them
      (else
       (cons (+ (car ntpl1) (car ntpl2))
             (pairwise-sum (cdr ntpl1) (cdr ntpl2)))))))

;; pairwise-product : N-tuple N-tuple -> N-tuple
;; Produce an n-tuple of the pairwise products of given n-tuples
(define pairwise-product
  (λ (ntpl1 ntpl2)
    (cond
      ((null? ntpl1) '())
      (else
       (cons (* (car ntpl1) (car ntpl2))
             (pairwise-product (cdr ntpl1) (cdr ntpl2)))))))


(module+ test
  (require rackunit)

  ;; pairwise-sum
  (check-equal? (pairwise-sum '(1 3 2) '(4 -1 2)) '(5 2 4)) 
  (check-equal? (pairwise-sum '(3.2 1.5) '(6.0 -2.5)) '(9.2 -1.0)) 
  (check-equal? (pairwise-sum '(7) '(11)) '(18))
  (check-equal? (pairwise-sum '() '()) '())
  (check-equal? (pairwise-sum '(0) '(1)) '(1))
  (check-equal? (pairwise-sum '(0) '(0)) '(0))

  ;; pairwise-product
  (check-equal? (pairwise-product '(1 3 2) '(4 -1 2)) '(4 -3 4)) 
  (check-equal? (pairwise-product '(3 1.5) '(6 -2.5)) '(18 -3.75)) 
  (check-equal? (pairwise-product '(7) '(11)) '(77))
  (check-equal? (pairwise-product '() '()) '())
  (check-equal? (pairwise-product '(0) '(1)) '(0))
  (check-equal? (pairwise-product '(0) '(0)) '(0))
  )