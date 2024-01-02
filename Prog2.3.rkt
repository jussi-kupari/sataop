#lang racket/base

;; Program 2.3 member?

(provide (all-defined-out))

(module+ test
  (require rackunit))

;; member? : Item List -> Boolean
;; Produces true if item is in the list
(define member?
  (λ (item ls)
    (cond
      ((null? ls) #f)
      (else (or (equal? (car ls) item)
                (member? item (cdr ls)))))))

;; Note! in Racket eq? seems to also work on numbers not just symbols

;; memq? : Symbol List -> Boolean
;; Produces true if symbol is in the list
(define memq?
  (λ (symbol ls)
    (cond
      ((null? ls) #f)
      (else (or (eq? (car ls) symbol)
                (memq? symbol (cdr ls)))))))

;; memv? : Symbol|Number List -> Boolean
;; Produces true if symbol|number is in the list
(define memv?
  (λ (sorn ls) ; sorn is symbol-or-number
    (cond
      ((null? ls) #f)
      (else (or (eqv? (car ls) sorn)
                (memv? sorn (cdr ls)))))))

(module+ test
  (check-true (member? 'cat '(dog hen cat pig)))
  (check-false (member? 'fox '(dog hen cat pig)))
  (check-false (member? 2 '(1 (2 3) 4)))
  (check-true (member? '(2 3) '(1 (2 3) 4)))
  (check-false (member? 'cat '()))
  )