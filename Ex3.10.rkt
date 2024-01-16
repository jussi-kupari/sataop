#lang racket/base

#|Exercise 3.10: multiple?
Define a predicate multiple? that takes as arguments two integers m and n
and returns #t if m is an integer multiple of n. (Hint: Use remainder.)
Test your procedure on:

(multiple? 7 2) ==>  #f
(multiple? 9 3) ==>  #t
(multiple? 5 0) ==>  #f
(multiple? 0 20) ==>   #t
(multiple? 17 1) ==> #t
(multiple? 0 0) ==>  #t |#

(provide multiple?)

;; multiple? : Integer Integer -> Boolean
;; Produce #true if first int is a multiple of second.
(define multiple?
  (λ (m n)
    (if (and (zero? m) (zero? n)) ; First deal with 0/0
        #t
        (and (not (zero? n))
             (zero? (remainder m n))))))


  (module+ test
    (require rackunit)

    (check-false (multiple? 7 2))
    (check-true (multiple? 9  3))
    (check-false (multiple? 5 0))
    (check-true (multiple? 0 20))
    (check-true (multiple? 17 1))
    (check-true (multiple? 0  0))
    )