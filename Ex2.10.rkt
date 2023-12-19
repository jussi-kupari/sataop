#lang racket/base

#|Exercise 2.10
Rewrite the definitions of the three procedures last-item, member? and
remove-1st with the cond expression replaced by if expressions.|#

(provide (all-defined-out))

(module+ test
  (require rackunit))

;; last-item-if : List -> Any
;; Produces the last element in the list using if not cond
(define last-item-if
  (λ (ls)
    (if (null? (cdr ls))
        (car ls)
        (last-item-if (cdr ls)))))

(module+ test
  (check-equal? (last-item-if '(1 2 3 4 5)) 5)
  (check-equal? (last-item-if '(a b (c d))) '(c d))
  (check-equal? (last-item-if '(cat)) 'cat)
  (check-equal? (last-item-if '((cat))) '(cat))
  )


;; member-if? : Item List -> Boolean
;; Tests if item is in the list using if not cond
(define member-if?
  (λ (item ls)
    (if (null? ls)
        #f
        (or (equal? (car ls) item)
            (member-if? item (cdr ls))))))

(module+ test
  (check-true (member-if? 'cat '(dog hen cat pig)))
  (check-false (member-if? 'fox '(dog hen cat pig)))
  (check-false (member-if? 2 '(1 (2 3) 4)))
  (check-true (member-if? '(2 3) '(1 (2 3) 4)))
  (check-false (member-if? 'cat '()))
  )

;; remove-1st-if : Item List -> List
;; Produce the list with first occurrence of item removed using if not cond
(define remove-1st-if
  (λ (item ls)
    (if (null? ls)
        '()
        (if (equal? (car ls) item)
            (cdr ls)
            (cons (car ls) (remove-1st-if item (cdr ls)))))))

(module+ test
  (check-equal? (remove-1st-if 'fox '(hen fox chick cock)) '(hen chick cock))
  (check-equal? (remove-1st-if 'fox '(hen fox chick fox cock)) '(hen chick fox cock))
  (check-equal? (remove-1st-if 'fox '(hen (fox chick) cock)) '(hen (fox chick) cock))
  (check-equal? (remove-1st-if 'fox '()) '())
  (check-equal? (remove-1st-if '(1 2) '(1 2 (1 2) ((1 2)))) '(1 2 ((1 2))))
  )