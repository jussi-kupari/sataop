#lang racket/base

#|Exercise 2.21: all-same?
Define a procedure all-same? that takes a list ls as its argument and tests whether all top-level elements of ls are the same.
Test your procedure with:

(all-same? '(a a a a a)) ==> #t
(all-same? '(a b a b a b)) ==> #f
(all-same? '((a b) (a b) (a b))) ==> #t
(all-same? '(a)) ==> #t
(all-same? '()) ==> #t|#

(provide all-same?)

;; cond version
;; all-same? : List -> Boolean
;; Produces true if all items in the list are identical
(define all-same?
  (λ (ls)
    (cond
      ((or (null? ls) (null? (cdr ls))) #t)
      (else
       (and (equal? (car ls) (cadr ls))
            (all-same? (cdr ls)))))))

;; or-and version
;; all-same.v2? : List -> Boolean
;; Produces true if all items in the list are identical
(define all-same.v2?
  (λ (ls)
    (or
     (or (null? ls) (null? (cdr ls)))
     (and (equal? (car ls) (cadr ls))
          (all-same.v2? (cdr ls))))))

;; if version
;; all-same.v3? : List -> Boolean
;; Produces true if all items in the list are identical
(define all-same.v3?
  (λ (ls)
    (if
     (or (null? ls) (null? (cdr ls)))
     #t
     (and (equal? (car ls) (cadr ls))
          (all-same.v3? (cdr ls))))))


(module+ test
  (require rackunit)
  
  (check-true (all-same? '(a a a a a)))
  (check-false (all-same? '(a b a b a b)))
  (check-true (all-same? '((a b) (a b) (a b))))
  (check-true (all-same? '(a)))
  (check-true (all-same? '()))
  
  (check-true (all-same.v2? '(a a a a a)))
  (check-false (all-same.v2? '(a b a b a b)))
  (check-true (all-same.v2? '((a b) (a b) (a b))))
  (check-true (all-same.v2? '(a)))
  (check-true (all-same.v2? '()))

  (check-true (all-same.v3? '(a a a a a)))
  (check-false (all-same.v3? '(a b a b a b)))
  (check-true (all-same.v3? '((a b) (a b) (a b))))
  (check-true (all-same.v3? '(a)))
  (check-true (all-same.v3? '()))
  )