#lang racket/base

#|Exercise 2.20: list-of-symbols?
Define a procedure list-of-symbols? that tests whether the top-level items
in a given list ls are symbols. Write your definitions in three ways, first using
cond, then if, and finally and and or. Test your procedures with:

(list-of-symbols? '(one two three four five)) ==> #t
(list-of-symbols? '(cat dog (hen pig) cow)) ==> #f
(list-of-symbols? ' (a b 3 4 d) ) ==> #f
(list-of-symbols? '()) ==> #t|#

(provide list-of-symbols?)

(module+ test
  (require rackunit))

;; list-of-symbols.v1? : List -> Boolean
;; Produces true if all items in list are symbols
(define list-of-symbols?
  (λ (ls)
    (cond
      ((null? ls) #t)
      (else
       (and (symbol? (car ls))
            (list-of-symbols? (cdr ls)))))))

;; list-of-symbols.v2? : List -> Boolean
;; Produces true if all items in list are symbols
(define list-of-symbols.v2?
  (λ (ls)
    (if (null? ls)
        #t
        (and (symbol? (car ls))
             (list-of-symbols.v2? (cdr ls))))))

;; list-of-symbols.v3? : List -> Boolean
;; Produces true if all items in list are symbols
(define list-of-symbols.v3?
  (λ (ls)
    (or (null? ls)
        (and (symbol? (car ls))
             (list-of-symbols.v3? (cdr ls))))))

(module+ test
  (check-true (list-of-symbols? '(one two three four five)))
  (check-false (list-of-symbols? '(cat dog (hen pig) cow)))
  (check-false (list-of-symbols? '(a b 3 4 d)))
  (check-true (list-of-symbols? '()))

  (check-true (list-of-symbols.v2? '(one two three four five)))
  (check-false (list-of-symbols.v2? '(cat dog (hen pig) cow)))
  (check-false (list-of-symbols.v2? '(a b 3 4 d)))
  (check-true (list-of-symbols.v2? '()))

  (check-true (list-of-symbols.v3? '(one two three four five)))
  (check-false (list-of-symbols.v3? '(cat dog (hen pig) cow)))
  (check-false (list-of-symbols.v3? '(a b 3 4 d)))
  (check-true (list-of-symbols.v3? '()))
  )