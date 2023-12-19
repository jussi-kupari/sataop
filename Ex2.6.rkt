#lang racket/base

#|Exercise 2.6
Assume that a, b, and c are expressions that evaluate to #t and that e and f
are expressions that evaluate to #f. Decide whether the following expressions
are true or false.

a. (and a (or b e))
b. (or e (and (not f) a c))
c. (not (or (not a) (not b)))
d. (and (or a f) (not (or b e)))|#

(module+ test
  (require rackunit))

;; Set values for expressions
(define a #t)
(define b #t)
(define c #t)
(define e #f)
(define f #f)

(module+ test
  ;; a.(and a (or b e)) ==> (and #t (or #t #f)) ==> (and #t #t) ==> #t
  (check-true (and a (or b e)))

  ;; b. (or e (and (not f) a c)) ==> (or #f (and (not #f) #t #t)) ==> (or #f (and #t #t #t)) ==> (or #f #t) ==> #t
  (check-true (or e (and (not f) a c)))

  ;; c. (not (or (not a) (not b))) ==> (not (or (not #t) (not #t))) ==> (not (or #f #f)) ==> (not #f) ==> #t
  (check-true (not (or (not a) (not b))))

  ;; d. (and (or a f) (not (or b e))) ==> (and (or #t #f) (not (or #t #f))) ==> (and #t (not #t)) ==> (and #t #f) ==> #f
  (check-false (and (or a f) (not (or b e))))
  )