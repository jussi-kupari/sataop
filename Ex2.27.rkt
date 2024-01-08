#lang racket/base
#|Exercise 2.27
Does the answer change if cond clause 2 and cond clause 3 are interchanged
in the definition of swapper? Does the same thing hold if cond clauses 1 and
2 are interchanged in swap-tester?

;; swapper : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper
  (λ (x y ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) x) (cons y (swapper x y (cdr ls))))
      ((equal? (car ls) y) (cons x (swapper x y (cdr ls))))
      (else (cons (car ls) (swapper x y (cdr ls)))))))

;; swap-tester
(define swap-tester
  (λ (x y a)
    (cond
      ((equal? a x) y)
      ((equal? a y) x)
      (else a))))

|#

;; swapper-modified : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper-modified
  (λ (x y ls)
    (cond
      ((null? ls) '())
      ((equal? (car ls) y) (cons x (swapper-modified x y (cdr ls))))
      ((equal? (car ls) x) (cons y (swapper-modified x y (cdr ls))))
      (else (cons (car ls) (swapper-modified x y (cdr ls)))))))

;; I will use the swapper function with swap-tester written inline inside it

;; Original
;; swapper.v2 : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper.v2
  (λ (x y ls)
    (cond
      ((null? ls) '())
      (else (cons (cond
                    ((equal? (car ls) x) y)
                    ((equal? (car ls) y) x)
                    (else (car ls)))
                  (swapper.v2 x y (cdr ls)))))))

;; Modified
;; swapper.v2.mod : Item Item List -> List
;; Produces a list where the two items have changed places.
(define swapper.v2.mod
  (λ (x y ls)
    (cond
      ((null? ls) '())
      (else (cons (cond
                    ((equal? (car ls) x) y)
                    ((equal? (car ls) y) x)
                    (else (car ls)))
                  (swapper.v2.mod x y (cdr ls)))))))


(module+ test
  (require rackunit)

  ;; Swapping cond clause 2 and cond clause 3 makes no difference
  (check-equal? (swapper-modified 'b 'd '(a b c d b)) '(a d c b d))
  (check-equal? (swapper.v2 'b 'd '(a b c d b)) '(a d c b d))
  ;; Swapping cond clause 1 and cond clause 2 makes no difference
  (check-equal? (swapper.v2.mod 'b 'd '(a b c d b)) '(a d c b d))
  )