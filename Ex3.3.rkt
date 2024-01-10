#lang racket/base

#|Exercise 3.3: dot-product
Define a procedure dot-product that takes two n-tuples of the same length,
multiplies the corresponding components, and adds the resulting products.
This exercise can be done either directly or by using the procedures defined
in Exercises 3.1 and 3.2. Consider the advantages and disadvantages of each
approach. Test your procedure on:

(dot-product '(3 4 -1) '(1 -2 -3)) ==> -2
(dot-product '(0.003 0.035) '(8 2)) ==> 0.094
(dot-product '(5.3e4) '(2.0e-3)) ==> 106.0
(dot-product ' () '()) ==> 0 |#

(require
  (only-in "Ex3.1.rkt" sum)
  (only-in "Ex3.2.rkt" pairwise-product))

;; dot-product : N-tuple N-tuple -> N-tuple
;; Produce the dot-product of the two given tuples
(define dot-product
  (λ (ntpl1 ntpl2)
    (sum (pairwise-product ntpl1 ntpl2))))

(module+ test
  (require rackunit)

  (check-equal? (dot-product '(3 4 -1) '(1 -2 -3)) -2) 
  (check-equal? (dot-product '(0.003 0.035) '(8 2)) 0.094)
  (check-equal? (dot-product '(5.3e4) '(2.0e-3)) 106.0)
  (check-equal? (dot-product ' () '()) 0)
  )