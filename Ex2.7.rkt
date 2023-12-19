#lang racket/base

#|Exercise 2.7
Decide whether the following expressions are true or false if expr is some
boolean expression.

a. (or (symbol? expr) (not (symbol? expr)))
b. (and (null? expr) (not (null? expr)))
c. (not (and (or expr #f) (not expr)))
d. (not (or expr #t))|#

(module+ test
  (require rackunit))

;; Set expr as #t for testing
(define expr #t)

(module+ test
  ;; a. (or (symbol? expr) (not (symbol? expr)) ==> (or #f (not #f)) ==> (or #f #t) ==> #t
  (check-true (or (symbol? expr) (not (symbol? expr))))

  ;; b. (and (null? expr) (not (null? expr))) ==> (and #f (not #f)) ==> (and #f #t) ==> #f
  (check-false (and (null? expr) (not (null? expr))))

  ;; c. (not (and (or expr #f) (not expr))) ==> (not (and (or #t #f) (not #t))) ==> (not (and #t #f)) ==> (not #f) ==> #t
  (check-true (not (and (or expr #f) (not expr))))

  ;; d. (not (or expr #t)) ==> (not (or #t #t)) ==> (not #t) ==> #f
  (check-false (not (or expr #t)))
  )