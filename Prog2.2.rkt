#lang racket/base

;; Program 2.2 last-item

(provide last-item)

(module+ test
  (require rackunit))

;; last-item : List -> Any
;; Produces the last element in the list
(define last-item
  (λ (ls)
    (cond
      ((null? (cdr ls)) (car ls))
      (else (last-item (cdr ls))))))

(module+ test
  (check-equal? (last-item '(1 2 3 4 5)) 5)
  (check-equal? (last-item '(a b (c d))) '(c d))
  (check-equal? (last-item '(cat)) 'cat)
  (check-equal? (last-item '((cat))) '(cat))
  )
 