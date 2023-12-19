#lang racket/base

#|Exercise 2.18: remove-last
Define a procedure remove-last that removes the last top-level occurrence
of a given element item in a list ls. Test your procedure on:

(remove-last 'a '(b a n a n a s)) ==> (b a n a n s)
(remove-last 'a '(b a n a n a)) ==> (b a n a n)
(remove-last 'a '()) ==> '()|#

(provide remove-last)

(require
  (only-in "Prog2.3.rkt" member?))

(module+ test
  (require rackunit))

;; remove-last : Item List -> List
(define remove-last
  (λ (item ls)
    (cond
      ((null? ls) '())
      ((and (equal? (car ls) item)
            (not (member? item (cdr ls))))
       (cdr ls))
      (else (cons (car ls) (remove-last item (cdr ls)))))))

(module+ test
  (check-equal? (remove-last 'a '(b a n a n a s)) '(b a n a n s))
  (check-equal? (remove-last 'a '(b a n a n a)) '(b a n a n))
  (check-equal? (remove-last 'a '()) '())
  )
